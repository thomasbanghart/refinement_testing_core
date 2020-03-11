include: "//@{CONFIG_PROJECT_NAME}/views/campaign.view.lkml"


view: campaign {
  extends: [campaign_config]
}

###################################################

view: campaign_core {
  sql_table_name: brazedev.CAMPAIGN ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
    description: "whether this Campaign is archived"
  }

  dimension: channel_android_push {
    label: "Android push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_android_push ;;
    description: "Are android push events associated with campaign?"
  }

  dimension: channel_email {
    label: "Email"
    group_label: "Channel"
    type: string
    sql: ${TABLE}.channel_email ;;
    description: "Are email events associated with campaign?"
  }

  dimension: channel_ios_push {
    label: "iOS push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_ios_push ;;
    description: "Are IOS push events associated with campaign?"
  }

  dimension: channel_web_push {
    label: "Web push"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_web_push ;;
    description: "Are web_push events associated with campaign?"
  }

  dimension: channel_webhook {
    label: "Webhook"
    group_label: "Channel"
    type: yesno
    sql: ${TABLE}.channel_webhook ;;
    description: "Are webhook events associated with campaign?"
  }

  dimension_group: created {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.created_at) ;;
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
      fiscal_year]
  }

  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
    description: "whether this Campaign is a draft"
  }

  dimension: error {
    type: yesno
    sql: ${TABLE}.error ;;
  }

  dimension: first_sent {
    type: string
    sql: ${TABLE}.first_sent ;;
    description: "date and hour of first sent as ISO 8601 date"
  }

  dimension: last_sent {
    type: string
    sql: ${TABLE}.last_sent ;;
    description: "date and hour of last sent as ISO 8601 date"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "campaign name"
  }

  dimension: schedule_type {
    type: string
    sql: ${TABLE}.schedule_type ;;
    description: "type of scheduling action"

  }

  dimension_group: updated {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.updated_at) ;;
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
      fiscal_year]
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
      message_variation.count,
      campaign_enrollment_event.count,
      campaign_conversion_behavior.count,
      webhook_event.count,
      in_app_message_event.count,
      campaign_tag.count,
      campaign_conversion_event.count,
      subscription_event.count
    ]
  }
}