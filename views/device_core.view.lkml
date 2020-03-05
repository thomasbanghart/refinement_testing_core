include: "//@{CONFIG_PROJECT_NAME}/views/device.view.lkml"


view: device {
  extends: [device_config]
}

###################################################

view: device_core {
  sql_table_name: braze.DEVICE ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
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
