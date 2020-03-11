include: "//@{CONFIG_PROJECT_NAME}/views/location_event.view.lkml"


view: location_event {
  extends: [location_event_config]
}

###################################################

view: location_event_core {
  sql_table_name: brazedev.LOCATION_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: alt_accuracy {
    type: number
    sql: ${TABLE}.alt_accuracy ;;
    description: "altitude accuracy of recorded location"
  }

  dimension: altitude {
    type: number
    sql: ${TABLE}.altitude ;;
    description: "altitude of recorded location"
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    description: "latitude of recorded location"
  }

  dimension: ll_accuracy {
    type: number
    sql: ${TABLE}.ll_accuracy ;;
    description: "a percentage representing the OS determined accuracy of the recorded location"
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    description: "longitude of recorded location"
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
    description: "time of the event in seconds since the epoch"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id, device.id]
  }
}