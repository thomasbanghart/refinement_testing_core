view: card_extra {
  sql_table_name: CARD_EXTRA ;;

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
    hidden: yes
  }

  dimension: card_updated_at {
    type: string
    hidden: yes
    sql: ${TABLE}.card_updated_at ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [card.name, card.id]
  }
}
