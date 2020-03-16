explore: canvas_core {
  from: canvas
  extension: required
  join: subscription_event {
#     view_label: "Campaign Events"
  sql_on: ${canvas.id} = ${subscription_event.canvas_id} ;;
#       AND ${canvas.updated_at} = ${subscription_event.canvas_updated_at}
#     ;;
  relationship: one_to_many
}
join: email_event {
#     view_label: "Campaign Events"
sql_on: ${canvas.id} = ${email_event.canvas_id} ;;
#       AND ${canvas.updated_at} = ${email_event.canvas_updated_at}
#     ;;
relationship: one_to_many
}
join: webhook_event {
#     view_label: "Campaign Events"
sql_on: ${canvas.id} = ${webhook_event.canvas_id} ;;
#       AND ${canvas.updated_at} = ${webhook_event.canvas_updated_at}
#     ;;
relationship: one_to_many
}
join: in_app_message_event {
#     view_label: "Campaign Events"
sql_on: ${canvas.id} = ${in_app_message_event.canvas_id} ;;
#       AND ${canvas.updated_at} = ${in_app_message_event.canvas_updated_at}
#     ;;
relationship: one_to_many
}
join: push_notification_event {
#     view_label: "Campaign Events"
sql_on: ${canvas.id} = ${push_notification_event.canvas_id} ;;
#       AND ${canvas.updated_at} = ${push_notification_event.canvas_updated_at}
#     ;;
relationship: one_to_many
}
join: canvas_variation {
  sql_on: ${canvas.id} = ${canvas_variation.canvas_id} ;;
#       AND ${canvas.updated_at} = ${canvas_variation.canvas_updated_at}
#     ;;
  relationship: one_to_many
}
join: canvas_tag {
  sql_on: ${canvas.id} = ${canvas_tag.canvas_id} ;;
#       AND ${canvas.updated_at} = ${canvas_tag.canvas_updated_at}
#     ;;
  relationship: one_to_many
}
join: canvas_step_seq {
  sql_on: ${canvas.id} = ${canvas_step_seq.canvas_id} ;;
#       AND ${canvas.updated_at} = ${canvas_step_seq.canvas_updated_at}
#     ;;
  relationship: one_to_many
}
join: canvas_step {
  sql_on: ${canvas.id} = ${canvas_step.canvas_id} ;;
#       AND ${canvas.updated_at} = ${canvas_step.canvas_updated_at}
#     ;;
  relationship: one_to_many
}
join: message_variation {
  sql_on: ${canvas_step.id} = ${message_variation.canvas_step_id} ;;
#       AND ${canvas_step.canvas_updated_at} = ${message_variation.canvas_step_updated_at}
#     ;;
  relationship: one_to_many
}
join: canvas_entry_event {
  sql_on: ${canvas_step.id} = ${canvas_entry_event.canvas_step_id} ;;
#       AND ${canvas.updated_at} = ${canvas_entry_event.canvas_step_updated_at}
#     ;;
  relationship: one_to_many
# TODO: Does each canvas have exactly one entry event? If so we'll need to make sure that we join them appropriately
#     sql_on: ${canvas.id} = ${canvas_entry_event.canvas_id} ;;
}
join: entry_canvas_step {
  from: canvas_step
  view_label: "Canvas Entry Event"
  sql_on: ${canvas_entry_event.canvas_step_id} = ${entry_canvas_step.id} ;;
#       AND ${canvas_entry_event.updated_at} = ${entry_canvas_step.canvas_updated_at}
#     ;;
  relationship: one_to_many
  fields: [canvas_step_name, id]
}
join: canvas_conversion_event {
  sql_on: ${canvas_step.id} = ${canvas_conversion_event.canvas_step_id} ;;
#       AND ${canvas.updated_at} = ${canvas_conversion_event.canvas_updated_at}
#     ;;
  relationship: one_to_many
}
join: conversion_canvas_step {
  from: canvas_step
  view_label: "Canvas Conversion Event"
  sql_on: ${canvas_conversion_event.canvas_step_id} = ${conversion_canvas_step.id} ;;
#       AND ${canvas_conversion_event.updated_at} = ${conversion_canvas_step.canvas_updated_at}
#     ;;
  relationship: one_to_many
  fields: [canvas_step_name, id]
}
join: canvas_conversion_behavior {
  sql_on: ${canvas_conversion_event.canvas_conversion_behavior_id} = ${canvas_conversion_behavior.id} ;;
  relationship: one_to_many
}
}
