include: "//@{CONFIG_PROJECT_NAME}/views/custom_event.view.lkml"


view: custom_event {
  extends: [custom_event_config]
}

###################################################

view: custom_event_core {
  sql_table_name: braze.CUSTOM_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the event occurred"
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external ID of the user"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "name of custom event"
  }

  dimension: properties {
    type: string
    sql: ${TABLE}.properties ;;
    description: "JSON encoded string of the custom properties for this event"
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description:"braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id, name, device.id]
  }
}