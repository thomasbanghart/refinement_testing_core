connection: "@{CONNECTION_NAME}"
label: "🔥 Braze Block"

include: "views/*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/views/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
# include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"

explore: campaign {
  extends: [campaign_config]
}

explore: campaign_core {
  extension: required
  join: subscription_event {
    view_label: "Campaign Events"
    sql_on: ${campaign.id} = ${subscription_event.campaign_id}
#       AND ${campaign.updated_at} = ${subscription_event.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: email_event {
    view_label: "Campaign Events"
    sql_on: ${campaign.id} = ${email_event.campaign_id}
#       AND ${campaign.updated_at} = ${email_event.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: webhook_event {
    view_label: "Campaign Events"
    sql_on: ${campaign.id} = ${webhook_event.campaign_id}
#       AND ${campaign.updated_at} = ${webhook_event.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: in_app_message_event {
    view_label: "Campaign Events"
    sql_on: ${campaign.id} = ${in_app_message_event.campaign_id}
#       AND ${campaign.updated_at} = ${in_app_message_event.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: push_notification_event {
    view_label: "Campaign Events"
    sql_on: ${campaign.id} = ${push_notification_event.campaign_id}
#       AND ${campaign.updated_at} = ${push_notification_event.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: campaign_enrollment_event {
    view_label: "Campaign Events"
    sql_on: ${campaign.id} = ${campaign_enrollment_event.campaign_id}
#       AND ${campaign.updated_at} = ${campaign_enrollment_event.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: campaign_tag {
    view_label: "Campaign Extra"
    sql_on: ${campaign.id} = ${campaign_tag.campaign_id}
#       AND ${campaign.updated_at} = ${campaign_tag.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: campaign_conversion_behavior {
    view_label: "Campaign Extra"
    sql_on: ${campaign.id} = ${campaign_conversion_behavior.campaign_id}
#       AND ${campaign.updated_at} = ${campaign_conversion_behavior.campaign_updated_at}
    ;;
    relationship: one_to_many
  }
  join: campaign_conversion_event {
    view_label: "Campaign Extra"
    sql_on: ${campaign_conversion_behavior.campaign_id} = ${campaign_conversion_event.campaign_id}
#       AND ${campaign_conversion_behavior.campaign_updated_at} = ${campaign_conversion_event.campaign_updated_at}
#       AND ${campaign_conversion_behavior.conversion_behavior_index} = ${campaign_conversion_event.conversion_behavior_index}
    ;;
    relationship: one_to_many
  }
  join: card {
    sql_on: ${in_app_message_event.card_id} = ${card.id}
#       AND ${in_app_message_event.card_updated_at} = ${card.updated_at}
    ;;
    relationship: many_to_one
  }
  join: newsfeed_card_event {
    view_label: "Device Events"
    sql_on: ${card.id} = ${newsfeed_card_event.card_id}
#       AND ${card.updated_at} = ${newsfeed_card_event.card_updated_at}
    ;;
    relationship: many_to_one
  }
  join: card_extra {
    view_label: "Card Extra"
    sql_on: ${card.id} = ${card_extra.card_id}
#       AND ${card.updated_at} = ${card_extra.card_updated_at}
    ;;
    relationship: many_to_one
  }
  join: card_tag {
    view_label: "Card Extra"
    sql_on: ${card.id} = ${card_tag.card_id}
#       AND ${card.updated_at} = ${card_tag.card_updated_at}
    ;;
    relationship: many_to_one
  }
  join: device {
    sql_on: ${newsfeed_card_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }
  join: custom_event {
    view_label: "Device Events"
    sql_on: ${device.id} = ${custom_event.device_id} ;;
    relationship: one_to_many
  }
  join: purchase_event {
    view_label: "Device Events"
    sql_on: ${device.id} = ${purchase_event.device_id} ;;
    relationship: one_to_many
  }
  join: location_event {
    view_label: "Device Events"
    sql_on: ${device.id} = ${location_event.device_id} ;;
    relationship: one_to_many
  }
  join: session_event {
    view_label: "Device Events"
    sql_on: ${device.id} = ${session_event.device_id} ;;
    relationship: one_to_many
  }
  join: newsfeed_impression_event {
    view_label: "Device Events"
    sql_on: ${device.id} = ${custom_event.device_id} ;;
    relationship: one_to_many
  }
  join: in_app_message_event2 {
    view_label: "Device Events"
    from: in_app_message_event
    sql_on: ${device.id} = ${in_app_message_event2.device_id} ;;
    relationship: one_to_many
  }
  join: push_notification_event2 {
    view_label: "Device Events"
    from: push_notification_event
    sql_on: ${device.id} = ${push_notification_event2.device_id} ;;
    relationship: one_to_many
  }









}
