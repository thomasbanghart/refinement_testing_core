include: "//@{CONFIG_PROJECT_NAME}/views/campaign_conversion_event.view.lkml"


view: campaign_conversion_event {
  extends: [campaign_conversion_event_config]
}

###################################################

view: campaign_conversion_event_core {
  sql_table_name: braze.CAMPAIGN_CONVERSION_EVENT ;;
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
    label: ""
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.time) ;;
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

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
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
    label: "Camapign Conversions"
    drill_fields: [id, message_variation.name, message_variation.id, campaign.name, campaign.id]
  }
}
