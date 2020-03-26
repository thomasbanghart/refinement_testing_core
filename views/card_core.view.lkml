include: "//@{CONFIG_PROJECT_NAME}/views/card.view.lkml"


view: card {
  extends: [card_config]
}

###################################################

view: card_core {
  sql_table_name: brazedev.CARD ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
    description: "whether this Card is archived"
  }

  dimension_group: careated {
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

  dimension_group: ended {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.ended_at) ;;
    description: "Date card will stop displaying for users"
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

  dimension_group: published {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.publish_at) ;;
    description: "Date card was published"
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


  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
    description: "The card's title"
  }

  dimension_group: updated {
    type: time
    sql: PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', ${TABLE}.updated_at) ;;
    description: "Date last updated"
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