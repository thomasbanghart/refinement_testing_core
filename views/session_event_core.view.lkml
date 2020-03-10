include: "//@{CONFIG_PROJECT_NAME}/views/session_event.view.lkml"


view: session_event {
  extends: [session_event_config]
}

###################################################

view: session_event_core {
  sql_table_name: braze.SESSION_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "unique id of this session"
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the session occurred"
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
    description: "seconds session lasted"
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
    description: "type of session: First session, Session start, or Session end"
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
    description: "id of the session"
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
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id, device.id]
  }

  measure: avg_session_duration {
    type: average
    sql: ${duration} ;;
  }
}
