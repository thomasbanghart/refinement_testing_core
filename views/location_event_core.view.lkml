include: "//@{CONFIG_PROJECT_NAME}/views/location_event.view.lkml"


view: location_event {
  extends: [location_event_config]
}

###################################################

view: location_event_core {
  sql_table_name: LOCATION_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: alt_accuracy {
    type: number
    hidden: yes
    sql: ${TABLE}.alt_accuracy ;;
    description: "altitude accuracy of recorded location"
  }

  dimension: altitude {
    type: number
    hidden: yes
    sql: ${TABLE}.altitude ;;
    description: "altitude of recorded location"
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
  }

  dimension: external_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: latitude {
    type: number
    hidden: yes
    sql: ${TABLE}.latitude ;;
    description: "latitude of recorded location"
  }

  dimension: ll_accuracy {
    type: number
    hidden: yes
    sql: ${TABLE}.ll_accuracy ;;
    description: "a percentage representing the OS determined accuracy of the recorded location"
  }

  dimension: longitude {
    type: number
    hidden: yes
    sql: ${TABLE}.longitude ;;
    description: "longitude of recorded location"
  }

  dimension_group: time {
    label: ""
    hidden: yes
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
    label: "Location Events"
    drill_fields: [id, device.id]
  }
}