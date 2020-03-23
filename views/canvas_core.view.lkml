include: "//@{CONFIG_PROJECT_NAME}/views/canvas.view.lkml"


view: canvas {
  extends: [canvas_config]
}

###################################################

view: canvas_core {
  sql_table_name: brazedev.CANVAS ;;
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
    label: "Android push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_android_push ;;
    description: "Are android push events associated with Canvas?"
  }

  dimension: channel_email {
    label: "Email"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_email ;;
    description: "Are email events associated with Canvas?"
  }

  dimension: channel_ios_push {
    label: "iOS push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_ios_push ;;
    description: "Are IOS push events associated with Canvas?"
  }

  dimension: channel_web_push {
    label: "Web push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_web_push ;;
    description: "Are web_push events associated with Canvas?"
  }

  dimension: channel_webhook {
    label: "Webhook"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_webhook ;;
    description: "Are web_hook events associated with Canvas?"
  }

  dimension_group: created_at {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.created_at) ;;
    timeframes:
    [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }


  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
    description: "whether this Canvas is a draft"
  }

  dimension: error {
    type: yesno
    sql: ${TABLE}.error ;;
  }

  dimension_group: first_sent {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.first_sent) ;;
    description: "date of first entry as ISO 8601 date"
    timeframes:
    [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension_group: last_sent {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.last_sent) ;;
    description: "date of last entry as ISO 8601 date"
    timeframes:
    [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
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


  dimension_group: updated_at {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.updated_at) ;;
    description: "date updated as ISO 8601 date"
    timeframes:
    [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: estimated_impressions {
    label: "Impressions"
    type: number
    sql: ${email_event.count} + ${subscription_event.count} + ${webhook_event.count} + ${subscription_event.count}
        + ${in_app_message_event.count} + ${push_notification_event.count};;
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
