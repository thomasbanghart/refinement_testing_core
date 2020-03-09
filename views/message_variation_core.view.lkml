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
    description: "the notification message"
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
    description: "JSON object if body is included for message"
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

  dimension: canvas_step_id {
    type: number
    sql: ${TABLE}.canvas_step_id ;;
    description: "id of the step for this message if from a Canvas"
  }

  dimension: canvas_step_updated_at {
    type: string
    sql: ${TABLE}.canvas_step_updated_at ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "channel type of the message (as in, 'email', 'ios_push', 'webhook', 'content_card', 'in-app_message', 'sms')"
  }

  dimension: extras {
    type: string
    sql: ${TABLE}.extras ;;
    description: "any key-value pairs provided"
  }

  dimension: from {
    type: string
    sql: ${TABLE}.``from`` ;;
    description: "from address and display name (With email channel)"
  }

  dimension: headers {
    type: string
    sql: ${TABLE}.headers ;;
    description: "specified request headers (webhook channel)"
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
    description: "one of 'POST', 'PUT', 'DELETE', or 'GET'"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "name of the message in the Dashboard (eg., 'Variation 1')"
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
    description: "reply-to for message, if different than 'from' address (email channel)"
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
    description: "subject (email channel)"
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    description: "name of the email (email channel)"
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
