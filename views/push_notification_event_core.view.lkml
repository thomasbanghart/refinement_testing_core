view: push_notification_event {
  sql_table_name: PUSH_NOTIFICATION_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    hidden: yes
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
    description: "id of the campaign if from a campaign"
  }

  dimension: canvas_id {
    type: number
    hidden: yes
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a Canvas"
  }

  dimension: canvas_step_id {
    type: number
    hidden: yes
    sql: ${TABLE}.canvas_step_id ;;
    description: "id of the step for this message if from a Canvas"
  }

  dimension: canvas_variation_id {
    type: number
    hidden: yes
    sql: ${TABLE}.canvas_variation_id ;;
    description: "id of the canvas variation the user is in if from a Canvas"
  }

  dimension: device_id {
    type: number
    hidden: yes
    sql: ${TABLE}.device_id ;;
    description: "id of the device that a delivery attempt was made to"
  }

  dimension: event_type {
    type: string
    label: "Push Notification Event Type"
    sql: ${TABLE}.event_type ;;
    description: "type of push event: Send, Open, iOS Foreground, Bounce"
  }

  dimension: external_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: message_variation_id {
    type: number
    hidden: yes
    sql: ${TABLE}.message_variation_id ;;
    description: "id of the message variation if from a campaign"
  }

  dimension: send_id {
    type: number
    hidden: yes
    sql: ${TABLE}.send_id ;;
    description: "id of the message if specified for the campaign"
  }

  dimension: timezone {
    type: string
    hidden: yes
    sql: ${TABLE}.timezone ;;
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  dimension_group: campaign_updated {
    type: time
    hidden: yes
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.camapign_updated_at) ;;
    timeframes: [
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

  dimension_group: canvas_step_updated {
    type: time
    hidden: yes
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.canvas_step_updated_at) ;;
    timeframes: [
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

  dimension_group: canvas_updated {
    type: time
    hidden: yes
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.canvas_updated_at) ;;
    timeframes: [
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

  dimension_group: message_variation_updated {
    type: time
    hidden: yes
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.message_variation_iupdated_at) ;;
    timeframes: [
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

  dimension_group: time {
    label: "Push Notification"
    group_label: "Dates"
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.time) ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      hour_of_day,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  measure: count {
    type: count
    group_label: "Push Notifications"
    label: "Push Notifications"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: total_sent {
    group_label: "Push Notifications"
    type: count
    value_format_name: decimal_0
  }

  measure: total_open {
    group_label: "Push Notifications"
    type: count
    value_format_name: decimal_0
  }

  measure: total_ios_foreground {
    group_label: "Push Notifications"
    type: count
    value_format_name: decimal_0
  }

  measure: total_bounces {
    group_label: "Push Notifications"
    type: count
    value_format_name: decimal_0
  }

  measure: total_delivered {
    group_label: "Push Notifications"
    type: number
    sql: ${total_sent} - ${total_bounces} ;;
    value_format_name: decimal_0
  }

  measure: bounce_rate {
    group_label: "Push Notifications"
    type: number
    sql: ${total_bounces} / NULLIF(${total_sent},0) ;;
    value_format_name: percent_1
  }

  set: detail {
    fields: [
      id,
      device.id,
      message_variation.name,
      message_variation.id,
      canvas_step.canvas_step_name,
      canvas_step.id,
      canvas.name,
      canvas.id,
      campaign.name,
      campaign.id
    ]
  }
}
