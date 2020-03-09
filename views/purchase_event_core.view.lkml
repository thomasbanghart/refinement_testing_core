include: "//@{CONFIG_PROJECT_NAME}/views/purchase_event.view.lkml"


view: purchase_event {
  extends: [purchase_event_config]
}

###################################################

view: purchase_event_core {
  sql_table_name: braze.PURCHASE_EVENT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
    description: "id for the app on which the user action occurred"
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
    description: "three letter alpha ISO 4217 currency code"
  }

  dimension: device_id {
    type: number
    sql: ${TABLE}.device_id ;;
    description: "id of the device on which the event occurred"
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
    description: "external id of the user"
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    description: "price of product"
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    description: "id of the product purchased"
  }

  dimension: properties {
    type: string
    sql: ${TABLE}.properties ;;
    description: "JSON encoded string of the custom properties for this event"
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
    drill_fields: [id, device.id]
  }
}