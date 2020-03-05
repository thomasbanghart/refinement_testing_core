include: "//@{CONFIG_PROJECT_NAME}/views/newsfeed_impression_event.view.lkml"


view: newsfeed_impression_event {
  extends: [newsfeed_impression_event_config]
}

###################################################

view: newsfeed_impression_event_core {
  sql_table_name: braze.NEWSFEED_IMPRESSION_EVENT ;;
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

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, device.id]
  }
}
