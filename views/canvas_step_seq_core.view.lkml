include: "//@{CONFIG_PROJECT_NAME}/views/canvas_step_seq.view.lkml"


view: canvas_step_seq {
  extends: [canvas_step_seq_config]
}

###################################################

view: canvas_step_seq_core {
  sql_table_name: brazedev.CANVAS_STEP_SEQ ;;

  dimension: canvas_id {
    hidden: yes
    type: number
    sql: ${TABLE}.canvas_id ;;
    description: "id of the Canvas if from a canvas"
  }

  dimension: canvas_step_seq {
    type: number
    sql: ${TABLE}.canvas_step_seq ;;
  }

  dimension_group: canvas_updated_at {
    hidden: yes
    type: time
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

  measure: count {
    type: count
    drill_fields: [canvas.name, canvas.id]
  }
}