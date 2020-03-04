explore: campaign_core {
  extension: required 
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