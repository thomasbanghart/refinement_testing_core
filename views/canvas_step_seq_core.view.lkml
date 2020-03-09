include: "//@{CONFIG_PROJECT_NAME}/views/canvas_step_seq.view.lkml"


view: canvas_step_seq {
  extends: [canvas_step_seq_config]
}

###################################################

view: canvas_step_seq_core {
  sql_table_name: braze.CANVAS_STEP_SEQ ;;

  dimension: canvas_id {
    type: number
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a canvas"
  }

  dimension: canvas_step_seq {
    type: number
    sql: ${TABLE}.canvas_step_seq ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [canvas.name, canvas.id]
  }
}
