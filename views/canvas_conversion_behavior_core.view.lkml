include: "//@{CONFIG_PROJECT_NAME}/views/canvas_conversion_behavior.view.lkml"


view: canvas_conversion_behavior {
  extends: [canvas_conversion_behavior_config]
}

###################################################

view: canvas_conversion_behavior_core {
  sql_table_name: braze.CANVAS_CONVERSION_BEHAVIOR ;;

  dimension: canvas_id {
    type: number
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a canvas"
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
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
    drill_fields: [canvas.name, canvas.id]
  }
}
