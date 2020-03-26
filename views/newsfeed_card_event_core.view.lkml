include: "//@{CONFIG_PROJECT_NAME}/views/newsfeed_card_event.view.lkml"


view: newsfeed_card_event {
  extends: [newsfeed_card_event_config]
}

###################################################

view: newsfeed_card_event_core {
  sql_table_name: NEWSFEED_CARD_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden:  yes
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: card_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.card_id ;;
    description: "id of the card that was clicked"
  }

  dimension: card_updated_at {
    type: string
    hidden:  yes
    sql: ${TABLE}.card_updated_at ;;
  }

  dimension: device_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the event occurred"
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "type of Newsfeed event: Impression, Click"
  }

  dimension: external_user_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
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
      day_of_week,
      hour_of_day,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension: timezone {
    type: string
    hidden:  yes
    sql: ${TABLE}.timezone ;;
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    label: "Newsfeed Card Events"
    drill_fields: [id, device.id, card.name, card.id]
  }
}