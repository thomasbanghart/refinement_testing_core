include: "//@{CONFIG_PROJECT_NAME}/views/canvas_tag.view.lkml"


view: canvas_tag {
  extends: [canvas_tag_config]
}

###################################################

view: canvas_tag_core {
  sql_table_name: braze.CANVAS_TAG ;;

  dimension: canvas_id {
    type: number
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: tag {
    type: number
    sql: ${TABLE}.tag ;;
  }

  measure: count {
    type: count
    drill_fields: [canvas.name, canvas.id]
  }
}
