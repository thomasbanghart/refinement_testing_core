connection: "brick-layer"

# include all the views
include: "/views/**/*.view"

# datagroup: block-braze_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }
#
# persist_with: block-braze_default_datagroup

explore: campaign {
  join: subscription_event {
    sql_on: ${campaign.id} = ${subscription_event.campaign_id} ;;
    relationship: one_to_many
  }
  join: email_event {
    sql_on: ${campaign.id} = ${email_event.campaign_id} ;;
    relationship: one_to_many
  }
  join: webhook_event {
    sql_on: ${campaign.id} = ${webhook_event.campaign_id} ;;
    relationship: one_to_many
  }
  join: in_app_message_event {
    sql_on: ${campaign.id} = ${in_app_message_event.campaign_id} ;;
    relationship: one_to_many
  }
  join: push_notification_event {
    sql_on: ${campaign.id} = ${push_notification_event.campaign_id} ;;
    relationship: one_to_many
  }
}
