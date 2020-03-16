include: "//@{CONFIG_PROJECT_NAME}/views/campaign_stats.view.lkml"

view: campaign_stats {
  extends: [campaign_stats_config]
}

############################

view: campaign_stats_core {
  derived_table: {
    explore_source: campaign {
      column: updated { field: campaign.updated_raw }
      column: conversions { field: campaign_conversion_event.count }
      column: estimated_audience {}
      column: name {}
      column: campaign_id { field: campaign.id }
      column: enrollment { field: campaign_enrollment_event.count }
      column: subscriptions { field: subscription_event.count }
      column: days_time_to_conversion { field: campaign_enrollment_event.days_to_conversion }

      filters: [campaign.estimated_audience: "NOT NULL"]
    }

    sql_trigger_value: SELECT CURRENT_DATE() ;;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    sql: CAST(${campaign_id} as STRING) ||' '|| CAST(${updated_raw} as STRING);;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
  }

  dimension_group: updated {
    hidden: yes
    type: time
    timeframes: [date, month, raw, time]
  }

  dimension: conversions {
    hidden: yes
    type: number
  }

  dimension: estimated_audience {
    hidden: yes
    type: number
  }

  dimension: name {
    hidden: yes
    description: "campaign name"
  }

  dimension: enrollment {
    hidden: yes
    type: number
  }

  dimension: subscription {
    hidden: yes
    type: number
  }

  dimension: days_time_to_conversion {
    hidden: yes
    type: number
  }

  measure: conversion_rate {
    group_label: "Average Metrics"
    label: "Average Conversion Rate"
    type: number
    sql: SUM(${conversions})/SUM(${estimated_audience}) ;;
    value_format_name: percent_1
  }

  measure: average_conversions {
    group_label: "Average Metrics"
    label: "Average Number of Conversion Events"
    type: average
    sql: (${conversions}) ;;
    value_format_name: decimal_1
  }

  measure: average_estimated_audience {
    group_label: "Average Metrics"
    label: "Average Estimated Audience"
    type: average
    sql: (${estimated_audience}) ;;
    value_format_name: decimal_1
  }

  measure: average_days_to_conversion {
    group_label: "Average Metrics"
    label: "Average Number of Days Until Conversion Event"
    type: average
    sql: (${days_time_to_conversion}) ;;
  }

}
