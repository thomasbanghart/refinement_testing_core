include: "//@{CONFIG_PROJECT_NAME}/views/canvas_step.view.lkml"


view: canvas_step {
  extends: [canvas_step_config]
}

###################################################

view: canvas_step_core {
  sql_table_name: braze.CANVAS_STEP ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: canvas_id {
    hidden: yes
    type: number
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a canvas"
  }

  dimension: canvas_step_name {
    type: string
    sql: ${TABLE}.canvas_step_name ;;
  }

  dimension_group: canvas_updated_at {
    hidden: yes
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.canvas_updated_at) ;;
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

#3/10/20: Moved dimensions from canvas_variation and canvas_tag here since they do not seem to need their own view files
  dimension: canvas_variant_name{
    sql: ${canvas_variation.variant_name} ;;
  }

  dimension: canvas_tag {
    sql: ${canvas_tag.tag} ;;
  }

  dimension: channel_android_push {
    label: "Android push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_android_push ;;
  }

  dimension: channel_ios_push {
    label: "iOS push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_ios_push ;;
  }

  dimension: channel_web_push {
    label: "Web push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_web_push ;;
  }

  dimension: channel_webhook {
    label: "Webhook"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_webhook ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      canvas_step_name,
      canvas.name,
      canvas.id,
      push_notification_event.count,
      email_event.count,
      message_variation.count,
      canvas_entry_event.count,
      webhook_event.count,
      in_app_message_event.count,
      canvas_conversion_event.count,
      subscription_event.count
    ]
  }
}
