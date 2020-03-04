include: "//@{CONFIG_PROJECT_NAME}/campaign_tag.view.lkml" 
        
        
view: campaign_tag {
  extends: [campaign_tag_config]
}

###################################################
        
view: campaign_tag_core {
  sql_table_name: braze.CAMPAIGN_TAG ;;

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_updated_at {
    type: string
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: tag {
    type: number
    sql: ${TABLE}.tag ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign.name, campaign.id]
  }
}
