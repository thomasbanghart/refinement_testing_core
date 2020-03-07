include: "//@{CONFIG_PROJECT_NAME}/views/campaign_enrollment_event.view.lkml"


view: campaign_enrollment_event {
  extends: [campaign_enrollment_event_config]
}

###################################################

view: campaign_enrollment_event_core {
  sql_table_name: braze.CAMPAIGN_ENROLLMENT_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: message_variation_id {
    type: number
    sql: ${TABLE}.message_variation_id ;;
    description: "Used when providing a campaign_id to specify which message variation this message should be tracked under (must be a Content Card Message)"
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.send_id ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, message_variation.name, message_variation.id, campaign.name, campaign.id]
  }
}
