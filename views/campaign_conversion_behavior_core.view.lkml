include: "//@{CONFIG_PROJECT_NAME}/views/campaign_conversion_behavior.view.lkml"


view: campaign_conversion_behavior {
  extends: [campaign_conversion_behavior_config]
}

###################################################

view: campaign_conversion_behavior_core {
  sql_table_name: brazedev.CAMPAIGN_CONVERSION_BEHAVIOR ;;

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
    description: "id of the campaign if from a campaign"
  }

  dimension_group: updated {
    hidden: yes
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.updated_at) ;;
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

  dimension: conversion_behavior {
    type: string
    sql: ${TABLE}.conversion_behavior ;;
    description: "JSON-encoded string describing the conversion behavior"
  }

  dimension: conversion_behavior_index {
    type: number
    sql: ${TABLE}.conversion_behavior_index ;;
    description: "index of the conversion behavior"
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [campaign.name, campaign.id]
  }
}