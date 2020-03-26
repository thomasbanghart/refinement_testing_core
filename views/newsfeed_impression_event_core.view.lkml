include: "//@{CONFIG_PROJECT_NAME}/views/newsfeed_impression_event.view.lkml"


view: newsfeed_impression_event {
  extends: [newsfeed_impression_event_config]
}

###################################################

view: newsfeed_impression_event_core {
  sql_table_name: brazedev.NEWSFEED_IMPRESSION_EVENT ;;
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

  dimension: device_id {
    type: number
    hidden: yes
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the event occurred"
  }

  dimension: external_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension_group: time {
    label: "Newsfeed Event"
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
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year]
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    label: "Newsfeed Impressions"
    drill_fields: [id, device.id]
  }
}
