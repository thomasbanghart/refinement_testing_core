include: "//@{CONFIG_PROJECT_NAME}/views/campaign_conversion_event.view.lkml"


view: campaign_conversion_event {
  extends: [campaign_conversion_event_config]
}

###################################################

view: campaign_conversion_event_core {
  sql_table_name: CAMPAIGN_CONVERSION_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes

  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
    hidden: yes
    description: "id for the app on which the user action occurred"
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
    description: "id of the campaign if from a campaign"
  }

  dimension_group: updated {
    type: time
    hidden: yes
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.updated_at) ;;
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year]
  }

  dimension: conversion_behavior_index {
    type: number
    hidden: yes
    sql: ${TABLE}.conversion_behavior_index ;;
    description: "index of the conversion behavior"
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    hidden: yes
    description: "external ID of the user"
  }

  dimension: message_variation_id {
    type: number
    sql: ${TABLE}.message_variation_id ;;
    hidden: yes
    description: "id of the message variation if from a campaign"
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.send_id ;;
    hidden: yes
    description: "id of the message if specified for the campaign"
  }

  dimension_group: time {
    label: "Campaign Conversion"
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.time) ;;
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year]
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
    hidden: yes
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    label: "Campaign Conversions"
    drill_fields: [id, message_variation.name, message_variation.id, campaign.name, campaign.id]
  }

  measure: count_email_conversions {
    type: count
    label: "Email Conversions"
    drill_fields: [id, message_variation.name, message_variation.id, campaign.name, campaign.id]
    filters: [message_variation.channel: "email"]
  }

  measure: count_push_notification_conversions {
    type: count
    label: "Push Notification Conversions"
    drill_fields: [id, message_variation.name, message_variation.id, campaign.name, campaign.id]
    filters: [message_variation.channel: "ios_push"]
  }

  measure: conversion_rate {
    type: number
    sql: ${campaign_conversion_event.count} / NULLIF(${campaign.estimated_audience},0) ;;
    value_format_name: percent_1
  }

  measure: conversion_running_total {
    type: running_total
    sql: ${count} ;;
  }
}