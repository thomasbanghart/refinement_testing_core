connection: "brick-layer"

# include all the views
include: "/views/**/*.view"

# datagroup: block-braze_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }
#
# persist_with: block-braze_default_datagroup

explore: app_install_attribution {}

explore: app_uninstall {}

explore: campaign {}

explore: campaign_conversion_behavior {
  join: campaign {
    type: left_outer
    sql_on: ${campaign_conversion_behavior.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}

explore: campaign_conversion_event {
  join: message_variation {
    type: left_outer
    sql_on: ${campaign_conversion_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${campaign_conversion_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${message_variation.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${canvas_step.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: campaign_enrollment_event {
  join: message_variation {
    type: left_outer
    sql_on: ${campaign_enrollment_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${campaign_enrollment_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${message_variation.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${canvas_step.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: campaign_tag {
  join: campaign {
    type: left_outer
    sql_on: ${campaign_tag.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}

explore: canvas {}

explore: canvas_conversion_behavior {
  join: canvas {
    type: left_outer
    sql_on: ${canvas_conversion_behavior.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: canvas_conversion_event {
  join: canvas_step {
    type: left_outer
    sql_on: ${canvas_conversion_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${canvas_conversion_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: canvas_entry_event {
  join: canvas_step {
    type: left_outer
    sql_on: ${canvas_entry_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${canvas_entry_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: canvas_step {
  join: canvas {
    type: left_outer
    sql_on: ${canvas_step.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: canvas_step_seq {
  join: canvas {
    type: left_outer
    sql_on: ${canvas_step_seq.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: canvas_tag {
  join: canvas {
    type: left_outer
    sql_on: ${canvas_tag.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: canvas_variation {
  join: canvas {
    type: left_outer
    sql_on: ${canvas_variation.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: card {}

explore: card_extra {
  join: card {
    type: left_outer
    sql_on: ${card_extra.card_id} = ${card.id} ;;
    relationship: many_to_one
  }
}

explore: card_tag {
  join: card {
    type: left_outer
    sql_on: ${card_tag.card_id} = ${card.id} ;;
    relationship: many_to_one
  }
}

explore: custom_event {
  join: device {
    type: left_outer
    sql_on: ${custom_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }
}

explore: device {}

explore: email_event {
  join: message_variation {
    type: left_outer
    sql_on: ${email_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${email_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${email_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${email_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}

explore: in_app_message_event {
  join: device {
    type: left_outer
    sql_on: ${in_app_message_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }

  join: message_variation {
    type: left_outer
    sql_on: ${in_app_message_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${in_app_message_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: card {
    type: left_outer
    sql_on: ${in_app_message_event.card_id} = ${card.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${in_app_message_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${in_app_message_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}

explore: location_event {
  join: device {
    type: left_outer
    sql_on: ${location_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }
}

explore: message_variation {
  join: canvas_step {
    type: left_outer
    sql_on: ${message_variation.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${message_variation.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${canvas_step.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }
}

explore: newsfeed_card_event {
  join: device {
    type: left_outer
    sql_on: ${newsfeed_card_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }

  join: card {
    type: left_outer
    sql_on: ${newsfeed_card_event.card_id} = ${card.id} ;;
    relationship: many_to_one
  }
}

explore: newsfeed_impression_event {
  join: device {
    type: left_outer
    sql_on: ${newsfeed_impression_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }
}

explore: purchase_event {
  join: device {
    type: left_outer
    sql_on: ${purchase_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }
}

explore: push_notification_event {
  join: device {
    type: left_outer
    sql_on: ${push_notification_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }

  join: message_variation {
    type: left_outer
    sql_on: ${push_notification_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${push_notification_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${push_notification_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${push_notification_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}

explore: session_event {
  join: device {
    type: left_outer
    sql_on: ${session_event.device_id} = ${device.id} ;;
    relationship: many_to_one
  }
}

explore: subscription_event {
  join: message_variation {
    type: left_outer
    sql_on: ${subscription_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${subscription_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${subscription_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${subscription_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}

explore: webhook_event {
  join: message_variation {
    type: left_outer
    sql_on: ${webhook_event.message_variation_id} = ${message_variation.id} ;;
    relationship: many_to_one
  }

  join: canvas_step {
    type: left_outer
    sql_on: ${webhook_event.canvas_step_id} = ${canvas_step.id} ;;
    relationship: many_to_one
  }

  join: canvas {
    type: left_outer
    sql_on: ${webhook_event.canvas_id} = ${canvas.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    type: left_outer
    sql_on: ${webhook_event.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }
}
