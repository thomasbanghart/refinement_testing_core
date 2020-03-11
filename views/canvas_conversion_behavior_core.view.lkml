include: "//@{CONFIG_PROJECT_NAME}/views/canvas_conversion_behavior.view.lkml"


view: canvas_conversion_behavior {
  extends: [canvas_conversion_behavior_config]
}

###################################################

view: canvas_conversion_behavior_core {
  sql_table_name: brazedev.CANVAS_CONVERSION_BEHAVIOR
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
    hidden: yes
    description: "id of the Canvas if from a canvas"
  }

  dimension_group: canvas_updated_at {
    type: time
    hidden:  yes
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.canvas_updated_at) ;;
    timeframes:
    [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension: conversion_behavior {
    type: string
    sql: ${TABLE}.conversion_behavior ;;
    description: "JSON-encoded string describing the conversion behavior"
  }

  dimension: conversion_behavior_index {
    type: number
    sql: ${TABLE}.conversion_behavior_index ;;
    description: "index of the conversion behavior"
  }

  measure: count {
    type: count
    drill_fields: [id, canvas_conversion_event.count]
  }
}