project_name: "block_refinement_testing"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block_refinement_testing_config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "brick-layer"
  export: override_required
}

### If needed TODO Add more constants here

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  #### If needed TODO Add CONFIG constants here that we want overridden by CORE constants

}
