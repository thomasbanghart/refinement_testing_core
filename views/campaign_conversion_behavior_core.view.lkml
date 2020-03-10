include: "//@{CONFIG_PROJECT_NAME}/views/campaign_conversion_behavior.view.lkml"


view: campaign_conversion_behavior {
  extends: [campaign_conversion_behavior_config]
}

###################################################

view: campaign_conversion_behavior_core {
  sql_table_name: braze.CAMPAIGN_CONVERSION_BEHAVIOR ;;

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    description: "id of the campaign if from a campaign"
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
    description: "date last updated as ISO 8601 date"
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
    drill_fields: [campaign.name, campaign.id]
  }
}
