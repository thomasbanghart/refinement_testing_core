include: "//@{CONFIG_PROJECT_NAME}/views/canvas.view.lkml"


view: canvas {
  extends: [canvas_config]
}

###################################################

view: canvas_core {
  sql_table_name: braze.CANVAS ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: channel_android_push {
    type: yesno
    sql: ${TABLE}.channel_android_push ;;
    description: "Are android push events associated with Canvas?"
  }

  dimension: channel_email {
    type: yesno
    sql: ${TABLE}.channel_email ;;
    description: "Are email events associated with Canvas?"
  }

  dimension: channel_ios_push {
    type: yesno
    sql: ${TABLE}.channel_ios_push ;;
    description: "Are IOS push events associated with Canvas?"
  }

  dimension: channel_web_push {
    type: yesno
    sql: ${TABLE}.channel_web_push ;;
    description: "Are web_push events associated with Canvas?"
  }

  dimension: channel_webhook {
    type: yesno
    sql: ${TABLE}.channel_webhook ;;
    description: "Are web_hook events associated with Canvas?"
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
    description: "date created as ISO 8601 date"
  }

  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
    description: "date created as ISO 8601 date"
  }

  dimension: error {
    type: yesno
    sql: ${TABLE}.error ;;
  }

  dimension: first_sent {
    type: string
    sql: ${TABLE}.first_sent ;;
    description: "date of first entry as ISO 8601 date"
  }

  dimension: last_sent {
    type: string
    sql: ${TABLE}.last_sent ;;
    description: "date of last entry as ISO 8601 date"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "Canvas name"
  }

  dimension: schedule_type {
    type: string
    sql: ${TABLE}.schedule_type ;;
    description: "type of scheduling action"
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
    description: "date updated as ISO 8601 date"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      push_notification_event.count,
      email_event.count,
      canvas_entry_event.count,
      canvas_tag.count,
      canvas_step_seq.count,
      canvas_conversion_behavior.count,
      canvas_step.count,
      webhook_event.count,
      in_app_message_event.count,
      canvas_conversion_event.count,
      canvas_variation.count,
      subscription_event.count
    ]
  }
}
