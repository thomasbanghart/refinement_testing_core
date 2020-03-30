#include: "//@{CONFIG_PROJECT_NAME}/views/campaign.view.lkml"

#
# view: campaign {
#   extends: [campaign_config]
# }
#
# ###################################################

view: campaign {
  sql_table_name: CAMPAIGN ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
    description: "whether this Campaign is archived"
  }

  dimension: channel_android_push {
    label: "Android push"
    hidden: yes
    type: yesno
    sql: ${TABLE}.channel_android_push ;;
    description: "Are android push events associated with campaign?"
  }

  dimension: channel_email {
    label: "Email"
    hidden: yes
    type: string
    sql: ${TABLE}.channel_email ;;
    description: "Are email events associated with campaign?"
  }

  dimension: channel_ios_push {
    label: "iOS push"
    hidden: yes
    type: yesno
    sql: ${TABLE}.channel_ios_push ;;
    description: "Are IOS push events associated with campaign?"
  }

  dimension: channel_web_push {
    label: "Web push"
    hidden: yes
    type: yesno
    sql: ${TABLE}.channel_web_push ;;
    description: "Are web_push events associated with campaign?"
  }

  dimension: channel_webhook {
    label: "Webhook"
    type: yesno
    hidden: yes
    sql: ${TABLE}.channel_webhook ;;
    description: "Are webhook events associated with campaign?"
  }

  dimension: channel {
    type: string
    sql: CASE
          WHEN ${channel_email} = TRUE THEN 'Email'
          WHEN ${channel_ios_push} = TRUE THEN 'iOS Push'
          WHEN ${channel_web_push} = TRUE THEN 'Web Push'
          WHEN ${channel_webhook} = TRUE THEN 'Webhook'
          WHEN ${channel_android_push} = TRUE THEN 'Android Push'
        ELSE NULL END
        ;;
  }

  dimension_group: created {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.created_at) ;;
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

  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
    description: "whether this Campaign is a draft"
  }

  dimension: error {
    type: yesno
    sql: ${TABLE}.error ;;
  }

  dimension: first_sent {
    type: string
    sql: ${TABLE}.first_sent ;;
    description: "date and hour of first sent as ISO 8601 date"
  }

  dimension: last_sent {
    type: string
    sql: ${TABLE}.last_sent ;;
    description: "date and hour of last sent as ISO 8601 date"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "campaign name"
    link: {
      label: "Campaign Lookup Dashboard"
      url: "/dashboards/block_braze::campaign_lookup?Campaign Name={{ value }}"
    }
  }

  dimension: schedule_type {
    type: string
    sql: ${TABLE}.schedule_type ;;
    description: "type of scheduling action"

  }

  dimension_group: updated {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.updated_at) ;;
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year]
  }

  dimension_group: today {
    type: time
    sql: CURRENT_TIMESTAMP() ;;
    timeframes:
    [
      raw,
      date,
      week,
      week_of_year,
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
    type: count
    drill_fields: [detail*]
  }

  measure: estimated_audience {
    type: number
    sql: ${email_event.count} + ${subscription_event.count} + ${webhook_event.count} + ${subscription_event.count}
      + ${in_app_message_event.count} + ${push_notification_event.count};;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      push_notification_event.count,
      email_event.count,
      message_variation.count,
      campaign_enrollment_event.count,
      campaign_conversion_behavior.count,
      webhook_event.count,
      in_app_message_event.count,
      campaign_tag.count,
      campaign_conversion_event.count,
      subscription_event.count
    ]
  }
}
