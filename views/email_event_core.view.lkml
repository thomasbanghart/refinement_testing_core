include: "//@{CONFIG_PROJECT_NAME}/views/email_event.view.lkml"


view: email_event {
  extends: [email_event_config]
}

###################################################

view: email_event_core {
  sql_table_name: braze.EMAIL_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
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
    description: "id of the Canvas if from a canvas"
  }

  dimension: canvas_step_id {
    type: number
    hidden: yes
    sql: ${TABLE}.canvas_step_id ;;
    description: "id of the step for this message if from a Canvas"
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
    description: "id of the canvas variation the user is in if from a Canvas"
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
    description: "email address for this event"
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "type of email event: Send, Delivery, Open, Clicks, Bounce, SoftBounce, MarkAsSpam, Unsubscribe"
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

  dimension_group: message_variation_iupdated {
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

  dimension: sending_ip {
    type: string
    sql: ${TABLE}.sending_ip ;;
    description: "the IP address from which the message was sent (Email Delivery, Bounce, and SoftBounce events only)"
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

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "the URL that was clicked (Email Click events only)"
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
    description: "description of the user's system and browser for the event (Click, Open, and MarkAsSpam events only)"
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
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
