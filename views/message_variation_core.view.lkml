include: "//@{CONFIG_PROJECT_NAME}/views/message_variation.view.lkml"


view: message_variation {
  extends: [message_variation_config]
}

###################################################

view: message_variation_core {
  sql_table_name: braze.MESSAGE_VARIATION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: alert {
    type: string
    sql: ${TABLE}.alert ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: canvas_step_id {
    type: number
    sql: ${TABLE}.canvas_step_id ;;
  }

  dimension: canvas_step_updated_at {
    type: string
    sql: ${TABLE}.canvas_step_updated_at ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: extras {
    type: string
    sql: ${TABLE}.extras ;;
  }

  dimension: from {
    type: string
    sql: ${TABLE}.``from`` ;;
  }

  dimension: headers {
    type: string
    sql: ${TABLE}.headers ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      canvas_step.canvas_step_name,
      canvas_step.id,
      campaign.name,
      campaign.id,
      push_notification_event.count,
      email_event.count,
      campaign_enrollment_event.count,
      webhook_event.count,
      in_app_message_event.count,
      campaign_conversion_event.count,
      subscription_event.count
    ]
  }
}
