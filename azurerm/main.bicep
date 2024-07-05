

module hadley_resource 'hadley_source_bicep' = {
    name: 'hadley_resource'
    hadley_params
}


output results object = {
  hadley_resource: hadley_resource
}
