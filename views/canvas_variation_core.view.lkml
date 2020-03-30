view: canvas_variation {
  sql_table_name: CANVAS_VARIATION ;;

  dimension: canvas_id {
    hidden: yes
    type: number
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: variant_name {
    hidden: yes
    type: string
    sql: ${TABLE}.variant_name ;;
    primary_key: yes
    description: "Variation of a campaign, differing as defined by the creator."
  }

  dimension_group: canvas_updated_at {
    hidden: yes
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.canvas_updated_at) ;;
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
      fiscal_year
    ]
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [variant_name, canvas.name, canvas.id]
  }
}
