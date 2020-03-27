include: "//@{CONFIG_PROJECT_NAME}/views/device.view.lkml"


view: device {
  extends: [device_config]
}

###################################################

view: device_core {
  sql_table_name: DEVICE ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
    description: "hardware model of the device"
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
    description: "os version of device used for the action"
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
    description: "platform of the device (iOS, Android, web, etc.)"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      push_notification_event.count,
      purchase_event.count,
      newsfeed_card_event.count,
      custom_event.count,
      location_event.count,
      in_app_message_event.count,
      session_event.count,
      newsfeed_impression_event.count
    ]
  }
}