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
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
  }

  dimension: button_id {
    type: number
    sql: ${TABLE}.button_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: canvas_id {
    type: number
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: canvas_step_id {
    type: number
    sql: ${TABLE}.canvas_step_id ;;
  }

  dimension: canvas_step_updated_at {
    type: string
    sql: ${TABLE}.canvas_step_updated_at ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: canvas_variation_id {
    type: number
    sql: ${TABLE}.canvas_variation_id ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_updated_at {
    type: string
    sql: ${TABLE}.card_updated_at ;;
  }

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: message_variation_id {
    type: number
    sql: ${TABLE}.message_variation_id ;;
  }

  dimension: message_variation_iupdated_at {
    type: string
    sql: ${TABLE}.message_variation_iupdated_at ;;
  }

  dimension: send_id {
    type: number
    sql: ${TABLE}.send_id ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
