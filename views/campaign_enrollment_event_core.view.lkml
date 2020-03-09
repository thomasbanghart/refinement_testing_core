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
    description: "id of the campaign if from a campaign"
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external ID of the user"
  }

  dimension: message_variation_id {
    type: number
    sql: ${TABLE}.message_variation_id ;;
    description: "id of the message variation if from a campaign"
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.send_id ;;
    description: "id of the message if specified for the campaign"
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description:"braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id, message_variation.name, message_variation.id, campaign.name, campaign.id]
  }
}