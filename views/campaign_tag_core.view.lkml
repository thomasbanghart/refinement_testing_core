include: "//@{CONFIG_PROJECT_NAME}/views/campaign_tag.view.lkml"


view: campaign_tag {
  extends: [campaign_tag_config]
}

###################################################

view: campaign_tag_core {
  sql_table_name: braze.CAMPAIGN_TAG ;;

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
    description: "id of the campaign if from a campaign"
  }

  dimension: campaign_updated_at {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign_updated_at ;;
    description: "date last updated as ISO 8601 date"
  }

  dimension: tag {
    type: number
    sql: ${TABLE}.tag ;;
    description: "tag names associated with the campaign"
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [campaign.name, campaign.id]
  }
}
