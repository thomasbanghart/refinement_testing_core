 connection:"brick-layer"             # include all views in the views/ folder in this projectconnection: "@{CONNECTION_NAME}"
label: "🔥 Braze Block"

include: "views/*.view.lkml"
include: "*.explore.lkml"
# include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/views/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
# include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"

explore: campaign {
  extends: [campaign_config]
}

explore: canvas {
  extends: [canvas_config]
}
