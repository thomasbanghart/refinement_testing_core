include: "//@{CONFIG_PROJECT_NAME}/views/card.view.lkml"


view: card {
  extends: [card_config]
}

###################################################

view: card_core {
  sql_table_name: braze.CARD ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
    description: "whether this Card is archived"
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
    description: "Date created as ISO 8601 date"
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    description: "The card's description"
  }

  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
    description: "whether this Card is a draft"
  }

  dimension: end_at {
    type: string
    sql: ${TABLE}.end_at ;;
    description: "Date card will stop displaying for users as ISO 8601 date"
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
    description: "The card's image URL. Required for 'CAPTIONED_IMAGE' and 'BANNER'"
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
    description: "The status of the export, returns 'success' when completed without errors"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "Card name"
  }

  dimension: publish_at {
    type: string
    sql: ${TABLE}.publish_at ;;
    description: "Date card was published as ISO 8601 date"
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    description: "The card's title"
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
    description: "Date last updated as ISO 8601 date"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      newsfeed_card_event.count,
      card_tag.count,
      in_app_message_event.count,
      card_extra.count
    ]
  }
}
