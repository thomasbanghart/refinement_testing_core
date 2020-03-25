- dashboard: bogus_research
  title: bogus Research
  layout: newspaper
  elements:
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = subscription_event-campaign_id::0
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = email_event-campaign_id::1
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = webhook_event-campaign_id::2
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = in_app_message_event-campaign_id::3
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: in_app_message_event'
    name: in_app_message_event::in_app_message_event-device_id = in_app_message_device-id::4
    fields: [in_app_message_event.device_id, in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = push_notification_event-campaign_id::5
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: push_notification_event'
    name: push_notification_event::push_notification_event-device_id = push_device-id::6
    fields: [push_notification_event.device_id, push_notification_event.count]
    sorts: [push_notification_event.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = campaign_enrollment_event-campaign_id::7
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = campaign_tag-campaign_id::8
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = campaign_conversion_behavior-campaign_id::9
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign_conversion_behavior'
    name: campaign_conversion_behavior::campaign_conversion_behavior-campaign_id =
      campaign_conversion_event-campaign_id::10
    fields: [campaign_conversion_behavior.campaign_id, campaign_conversion_behavior.count]
    sorts: [campaign_conversion_behavior.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign'
    name: campaign::campaign-id = message_variation-campaign_id::11
    fields: [campaign.id, campaign.count]
    sorts: [campaign.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: in_app_message_event'
    name: in_app_message_event::in_app_message_event-card_id = card-id::12
    fields: [in_app_message_event.card_id, in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: card'
    name: card::card-id = newsfeed_card_event-card_id::13
    fields: [card.id, card.count]
    sorts: [card.count desc]
    col: 2
    width: 6
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: subscription_event'
    name: subscription_event::campaign-id = subscription_event-campaign_id::0
    fields: [subscription_event.campaign_id, subscription_event.count]
    sorts: [subscription_event.count desc]
    col: 16
    width: 6
    series_colors: {subscription_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: email_event'
    name: email_event::campaign-id = email_event-campaign_id::1
    fields: [email_event.campaign_id, email_event.count]
    sorts: [email_event.count desc]
    col: 16
    width: 6
    series_colors: {email_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: webhook_event'
    name: webhook_event::campaign-id = webhook_event-campaign_id::2
    fields: [webhook_event.campaign_id, webhook_event.count]
    sorts: [webhook_event.count desc]
    col: 16
    width: 6
    series_colors: {webhook_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: in_app_message_event'
    name: in_app_message_event::campaign-id = in_app_message_event-campaign_id::3
    fields: [in_app_message_event.campaign_id, in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 16
    width: 6
    series_colors: {in_app_message_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: in_app_message_device'
    name: in_app_message_device::in_app_message_event-device_id = in_app_message_device-id::4
    fields: [in_app_message_device.id, in_app_message_device.count]
    sorts: [in_app_message_device.count desc]
    col: 16
    width: 6
    series_colors: {in_app_message_device.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: push_notification_event'
    name: push_notification_event::campaign-id = push_notification_event-campaign_id::5
    fields: [push_notification_event.campaign_id, push_notification_event.count]
    sorts: [push_notification_event.count desc]
    col: 16
    width: 6
    series_colors: {push_notification_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: push_device'
    name: push_device::push_notification_event-device_id = push_device-id::6
    fields: [push_device.id, push_device.count]
    sorts: [push_device.count desc]
    col: 16
    width: 6
    series_colors: {push_device.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign_enrollment_event'
    name: campaign_enrollment_event::campaign-id = campaign_enrollment_event-campaign_id::7
    fields: [campaign_enrollment_event.campaign_id, campaign_enrollment_event.count]
    sorts: [campaign_enrollment_event.count desc]
    col: 16
    width: 6
    series_colors: {campaign_enrollment_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign_tag'
    name: campaign_tag::campaign-id = campaign_tag-campaign_id::8
    fields: [campaign_tag.campaign_id, campaign_tag.count]
    sorts: [campaign_tag.count desc]
    col: 16
    width: 6
    series_colors: {campaign_tag.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign_conversion_behavior'
    name: campaign_conversion_behavior::campaign-id = campaign_conversion_behavior-campaign_id::9
    fields: [campaign_conversion_behavior.campaign_id, campaign_conversion_behavior.count]
    sorts: [campaign_conversion_behavior.count desc]
    col: 16
    width: 6
    series_colors: {campaign_conversion_behavior.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: campaign_conversion_event'
    name: campaign_conversion_event::campaign_conversion_behavior-campaign_id = campaign_conversion_event-campaign_id::10
    fields: [campaign_conversion_event.campaign_id, campaign_conversion_event.count]
    sorts: [campaign_conversion_event.count desc]
    col: 16
    width: 6
    series_colors: {campaign_conversion_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: message_variation'
    name: message_variation::campaign-id = message_variation-campaign_id::11
    fields: [message_variation.campaign_id, message_variation.count]
    sorts: [message_variation.count desc]
    col: 16
    width: 6
    series_colors: {message_variation.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: card'
    name: card::in_app_message_event-card_id = card-id::12
    fields: [card.id, card.count]
    sorts: [card.count desc]
    col: 16
    width: 6
    series_colors: {card.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'ID Count: newsfeed_card_event'
    name: newsfeed_card_event::card-id = newsfeed_card_event-card_id::13
    fields: [newsfeed_card_event.card_id, newsfeed_card_event.count]
    sorts: [newsfeed_card_event.count desc]
    col: 16
    width: 6
    series_colors: {newsfeed_card_event.count: '#B1399E'}
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = subscription_event.campaign_id'
    name: campaign-id = subscription_event-campaign_id::0
    fields: [campaign.id, subscription_event.campaign_id, campaign.count, subscription_event.count]
    sorts: [subscription_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = email_event.campaign_id'
    name: campaign-id = email_event-campaign_id::1
    fields: [campaign.id, email_event.campaign_id, campaign.count, email_event.count]
    sorts: [email_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = webhook_event.campaign_id'
    name: campaign-id = webhook_event-campaign_id::2
    fields: [campaign.id, webhook_event.campaign_id, campaign.count, webhook_event.count]
    sorts: [webhook_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = in_app_message_event.campaign_id'
    name: campaign-id = in_app_message_event-campaign_id::3
    fields: [campaign.id, in_app_message_event.campaign_id, campaign.count, in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: in_app_message_event.device_id = in_app_message_device.id'
    name: in_app_message_event-device_id = in_app_message_device-id::4
    fields: [in_app_message_event.device_id, in_app_message_device.id, in_app_message_event.count,
      in_app_message_device.count]
    sorts: [in_app_message_device.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = push_notification_event.campaign_id'
    name: campaign-id = push_notification_event-campaign_id::5
    fields: [campaign.id, push_notification_event.campaign_id, campaign.count, push_notification_event.count]
    sorts: [push_notification_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: push_notification_event.device_id = push_device.id'
    name: push_notification_event-device_id = push_device-id::6
    fields: [push_notification_event.device_id, push_device.id, push_notification_event.count,
      push_device.count]
    sorts: [push_device.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = campaign_enrollment_event.campaign_id'
    name: campaign-id = campaign_enrollment_event-campaign_id::7
    fields: [campaign.id, campaign_enrollment_event.campaign_id, campaign.count, campaign_enrollment_event.count]
    sorts: [campaign_enrollment_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = campaign_tag.campaign_id'
    name: campaign-id = campaign_tag-campaign_id::8
    fields: [campaign.id, campaign_tag.campaign_id, campaign.count, campaign_tag.count]
    sorts: [campaign_tag.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = campaign_conversion_behavior.campaign_id'
    name: campaign-id = campaign_conversion_behavior-campaign_id::9
    fields: [campaign.id, campaign_conversion_behavior.campaign_id, campaign.count,
      campaign_conversion_behavior.count]
    sorts: [campaign_conversion_behavior.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign_conversion_behavior.campaign_id = campaign_conversion_event.campaign_id'
    name: campaign_conversion_behavior-campaign_id = campaign_conversion_event-campaign_id::10
    fields: [campaign_conversion_behavior.campaign_id, campaign_conversion_event.campaign_id,
      campaign_conversion_behavior.count, campaign_conversion_event.count]
    sorts: [campaign_conversion_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: campaign.id = message_variation.campaign_id'
    name: campaign-id = message_variation-campaign_id::11
    fields: [campaign.id, message_variation.campaign_id, campaign.count, message_variation.count]
    sorts: [message_variation.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: in_app_message_event.card_id = card.id'
    name: in_app_message_event-card_id = card-id::12
    fields: [in_app_message_event.card_id, card.id, in_app_message_event.count, card.count]
    sorts: [card.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: looker_column
    title: 'Join: card.id = newsfeed_card_event.card_id'
    name: card-id = newsfeed_card_event-card_id::13
    fields: [card.id, newsfeed_card_event.card_id, card.count, newsfeed_card_event.count]
    sorts: [newsfeed_card_event.count desc]
    col: 8
    width: 8
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = subscription_event-campaign_id::0::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = email_event-campaign_id::1::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = webhook_event-campaign_id::2::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = in_app_message_event-campaign_id::3::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: in_app_message_event-device_id = in_app_message_device-id::4::single_val
    fields: [in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = push_notification_event-campaign_id::5::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: push_notification_event-device_id = push_device-id::6::single_val
    fields: [push_notification_event.count]
    sorts: [push_notification_event.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = campaign_enrollment_event-campaign_id::7::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = campaign_tag-campaign_id::8::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = campaign_conversion_behavior-campaign_id::9::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign_conversion_behavior-campaign_id = campaign_conversion_event-campaign_id::10::single_val
    fields: [campaign_conversion_behavior.count]
    sorts: [campaign_conversion_behavior.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = message_variation-campaign_id::11::single_val
    fields: [campaign.count]
    sorts: [campaign.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: in_app_message_event-card_id = card-id::12::single_val
    fields: [in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: card-id = newsfeed_card_event-card_id::13::single_val
    fields: [card.count]
    sorts: [card.count desc]
    col: 0
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = subscription_event-campaign_id::0::single_val_b
    fields: [subscription_event.count]
    sorts: [subscription_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = email_event-campaign_id::1::single_val_b
    fields: [email_event.count]
    sorts: [email_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = webhook_event-campaign_id::2::single_val_b
    fields: [webhook_event.count]
    sorts: [webhook_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = in_app_message_event-campaign_id::3::single_val_b
    fields: [in_app_message_event.count]
    sorts: [in_app_message_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: in_app_message_event-device_id = in_app_message_device-id::4::single_val_b
    fields: [in_app_message_device.count]
    sorts: [in_app_message_device.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = push_notification_event-campaign_id::5::single_val_b
    fields: [push_notification_event.count]
    sorts: [push_notification_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: push_notification_event-device_id = push_device-id::6::single_val_b
    fields: [push_device.count]
    sorts: [push_device.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = campaign_enrollment_event-campaign_id::7::single_val_b
    fields: [campaign_enrollment_event.count]
    sorts: [campaign_enrollment_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = campaign_tag-campaign_id::8::single_val_b
    fields: [campaign_tag.count]
    sorts: [campaign_tag.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = campaign_conversion_behavior-campaign_id::9::single_val_b
    fields: [campaign_conversion_behavior.count]
    sorts: [campaign_conversion_behavior.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign_conversion_behavior-campaign_id = campaign_conversion_event-campaign_id::10::single_val_b
    fields: [campaign_conversion_event.count]
    sorts: [campaign_conversion_event.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: campaign-id = message_variation-campaign_id::11::single_val_b
    fields: [message_variation.count]
    sorts: [message_variation.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: in_app_message_event-card_id = card-id::12::single_val_b
    fields: [card.count]
    sorts: [card.count desc]
    col: 22
    width: 2
  - model: block_braze
    explore: campaign
    type: single_value
    title: Count
    name: card-id = newsfeed_card_event-card_id::13::single_val_b
    fields: [newsfeed_card_event.count]
    sorts: [newsfeed_card_event.count desc]
    col: 22
    width: 2
