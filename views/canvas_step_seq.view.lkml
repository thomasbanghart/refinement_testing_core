view: canvas_step_seq {
  sql_table_name: braze.CANVAS_STEP_SEQ ;;

  dimension: canvas_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.canvas_id ;;
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
