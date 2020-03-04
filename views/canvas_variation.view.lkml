view: canvas_variation {
  sql_table_name: braze.CANVAS_VARIATION ;;

  dimension: canvas_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: variant_name {
    type: number
    sql: ${TABLE}.variant_name ;;
  }

  measure: count {
    type: count
    drill_fields: [variant_name, canvas.name, canvas.id]
  }
}
