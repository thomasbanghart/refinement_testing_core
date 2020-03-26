include: "//@{CONFIG_PROJECT_NAME}/views/session_event.view.lkml"


view: session_event {
  extends: [session_event_config]
}

###################################################

view: session_event_core {
  sql_table_name: brazedev.SESSION_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
    description: "unique id of this session"
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
    description: "id of the device on which the session occurred"
  }

  dimension: duration {
    type: number
    hidden: yes
    sql: ${TABLE}.duration ;;
    description: "seconds session lasted"
  }

  dimension: duration_tier {
    sql: ${duration}/60 ;;
    type: tier
    style: integer
    tiers: [0, 15, 30, 45, 60, 75, 90, 105, 120]
  }

  dimension: event_type {
    type: string
    label: "Session Type"
    sql: ${TABLE}.event_type ;;
    description: "type of session: First session, Session start, or Session end"
  }

  dimension: external_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: session_id {
    type: number
    hidden: yes
    sql: ${TABLE}.session_id ;;
    description: "id of the session"
  }

  dimension_group: time {
    label: "Session Event"
    group_label: "Dates"
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

  dimension: timezone {
    type: string
    hidden: yes
    sql: ${TABLE}.timezone ;;
    description: "IANA timezone of the user at the time of the event"
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    label: "Session Events"
    drill_fields: [id, device.id]
  }

  measure: avg_session_duration {
    type: average
    sql: ${duration} ;;
  }
}
