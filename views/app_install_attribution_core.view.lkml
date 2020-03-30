view: app_install_attribution {
  sql_table_name: APP_INSTALL_ATTRIBUTION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    description: "the source of the attribution"
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
