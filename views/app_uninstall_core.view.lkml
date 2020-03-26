include: "//@{CONFIG_PROJECT_NAME}/views/app_uninstall.view.lkml"


view: app_uninstall {
  extends: [app_uninstall_config]
}

###################################################

view: app_uninstall_core {
  sql_table_name: APP_UNINSTALL ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the uninstall action occurred"
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description:"braze user id of the user"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}