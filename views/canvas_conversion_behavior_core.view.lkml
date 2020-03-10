include: "//@{CONFIG_PROJECT_NAME}/views/canvas_conversion_behavior.view.lkml"


view: canvas_conversion_behavior {
  extends: [canvas_conversion_behavior_config]
}

###################################################

view: canvas_conversion_behavior_core {
  sql_table_name: braze.CANVAS_CONVERSION_BEHAVIOR
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: canvas_id {
    type: number
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: conversion_behavior {
    type: string
    sql: ${TABLE}.conversion_behavior ;;
  }

  dimension: conversion_behavior_index {
    type: number
    sql: ${TABLE}.conversion_behavior_index ;;
  }

  measure: count {
    type: count
    drill_fields: [id, canvas_conversion_event.count]
  }
}
