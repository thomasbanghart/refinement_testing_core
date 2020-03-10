include: "//@{CONFIG_PROJECT_NAME}/views/in_app_message_event.view.lkml"


view: in_app_message_event {
  extends: [in_app_message_event_config]
}

###################################################

view: in_app_message_event_core {
  sql_table_name: braze.IN_APP_MESSAGE_EVENT ;;
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

  dimension: button_id {
    type: number
    hidden: yes
    sql: ${TABLE}.button_id ;;
    description: "index of the button clicked, if it was a button that was clicked"
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
    description: "id of the campaign if from a campaign"
  }

  dimension_group: campaign_updated {
    type: time
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
      fiscal_year]
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
    description: "id of the Canvas if from a Canvas"
  }

  dimension_group: canvas_step_updated {
    type: time
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
      fiscal_year]
  }

  dimension_group: canvas_updated {
    type: time
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
      fiscal_year]
  }

  dimension: canvas_variation_id {
    type: number
    hidden: yes
    sql: ${TABLE}.canvas_variation_id ;;
    description: "id of the Canvas variation the user is in if from a Canvas"
  }

  dimension: card_id {
    type: number
    hidden: yes
    sql: ${TABLE}.card_id ;;
    description: "id of the content card that was viewed/clicked/dismissed"
  }

  dimension: card_updated_at {
    type: string
    sql: ${TABLE}.card_updated_at ;;
  }

  dimension: device_id {
    type: number
    hidden: yes
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the event occurred"
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "type of In-App Message event: Impression, Click"
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

  dimension_group: message_variation_updated {
    type: time
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
      fiscal_year]
  }

  dimension: send_id {
    type: number
    hidden: yes
    sql: ${TABLE}.send_id ;;
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
    hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    label: "In App Message Events"
    drill_fields: [detail*]
    value_format_name: decimal_0
  }

  set: detail {
    fields: [
      id,
      device.id,
      message_variation.name,
      message_variation.id,
      canvas_step.canvas_step_name,
      canvas_step.id,
      card.name,
      card.id,
      canvas.name,
      canvas.id,
      campaign.name,
      campaign.id
    ]
  }
}
