view: campaign_conversion_behavior {
  sql_table_name: braze.CAMPAIGN_CONVERSION_BEHAVIOR ;;

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: conversion_behavior {
    type: string
    sql: ${TABLE}.conversion_behavior ;;
  }

  dimension: conversion_behavior_index {
    type: number
    sql: ${TABLE}.conversion_behavior_index ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign.name, campaign.id]
  }
}
