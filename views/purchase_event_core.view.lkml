include: "//@{CONFIG_PROJECT_NAME}/views/purchase_event.view.lkml"


view: purchase_event {
  extends: [purchase_event_config]
}

###################################################

view: purchase_event_core {
  sql_table_name: brazedev.PURCHASE_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: app_id {
    type: number
    hidden: yes
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: currency {
    type: string
    hidden: yes
    sql: ${TABLE}.currency ;;
    description: "three letter alpha ISO 4217 currency code"
  }

  dimension: device_id {
    type: number
    hidden: yes
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the event occurred"
  }

  dimension: external_user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: price {
    type: number
    hidden: yes
    sql: ${TABLE}.price ;;
    description: "price of product"
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
    description: "id of the product purchased"
  }

  dimension: properties {
    type: string
    hidden: yes
    sql: ${TABLE}.properties ;;
    description: "JSON encoded string of the custom properties for this event"
  }

  dimension_group: time {
    label: "Purchase Event"
    group_label: "Dates"
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.time) ;;
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
      fiscal_year]
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "braze user id of the user"
  }

  measure: count {
    label: "Purchase Events"
    type: count
    drill_fields: [id, device.id]
  }
}
