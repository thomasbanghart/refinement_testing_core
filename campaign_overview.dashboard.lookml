- dashboard: campaign_overview
  title: Campaign Overview
  layout: newspaper
  elements:
  - title: Total Clicks
    name: Total Clicks
    model: block_braze
    explore: campaign
    type: single_value
    fields: [email_event.total_clicks]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 3
    col: 0
    width: 4
    height: 3
  - title: Total Impressions
    name: Total Impressions
    model: block_braze
    explore: campaign
    type: single_value
    fields: [email_event.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Estimated Audience
    name: Estimated Audience
    model: block_braze
    explore: campaign
    type: single_value
    fields: [campaign.estimated_audience]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 0
    col: 4
    width: 4
    height: 3
  - title: Total Subscriptions
    name: Total Subscriptions
    model: block_braze
    explore: campaign
    type: single_value
    fields: [subscription_event.count]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 3
    col: 4
    width: 4
    height: 3
  - title: Total Conversions
    name: Total Conversions
    model: block_braze
    explore: campaign
    type: single_value
    fields: [campaign_conversion_event.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 6
    col: 0
    width: 4
    height: 3
  - title: Top 10 Campaigns by Conversion Rate
    name: Top 10 Campaigns by Conversion Rate
    model: block_braze
    explore: campaign
    type: looker_bar
    fields: [campaign.name, campaign_conversion_event.conversion_rate]
    filters:
      campaign.archived: 'No'
    sorts: [campaign_conversion_event.conversion_rate desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: mixed_pastels
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: campaign_conversion_event.conversion_rate,
            id: campaign_conversion_event.conversion_rate, name: Conversion Rate}],
        showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      campaign.name: 133
      email_event.count: 158
      email_event.total_clicks: 120
      campaign_conversion_event.count: 202
    series_cell_visualizations:
      email_event.count:
        is_active: true
      email_event.total_clicks:
        is_active: true
      campaign_conversion_event.count:
        is_active: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 18
    col: 0
    width: 8
    height: 9
  - title: Conversion Rate
    name: Conversion Rate
    model: block_braze
    explore: campaign
    type: single_value
    fields: [campaign_conversion_event.conversion_rate]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 6
    col: 4
    width: 4
    height: 3
  - title: Funnel
    name: Funnel
    model: block_braze
    explore: campaign
    type: looker_column
    fields: [email_event.sent_emails, email_event.total_delivered, email_event.total_opened,
      email_event.total_clicks]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: mixed_pastels
      options:
        steps: 5
    series_colors: {}
    show_dropoff: true
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 9
    col: 0
    width: 8
    height: 9
  - title: Conversions and Audience by Device
    name: Conversions and Audience by Device
    model: block_braze
    explore: campaign
    type: looker_bar
    fields: [device.platform, campaign.estimated_audience, campaign_conversion_event.conversion_rate]
    filters:
      device.platform: "-NULL"
    sorts: [campaign.estimated_audience desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: conversion_rate, label: Conversion Rate,
        expression: 'if( ${campaign_conversion_event.conversion_rate} = null, 1, 1)
          + rand() * 500 + 500', value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}, {table_calculation: audience, label: Audience,
        expression: 'if( ${conversion_rate} = null, 1, 1) + rand() * 500 + 800', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: mixed_pastels
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: audience, id: audience,
            name: Audience}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: conversion_rate, id: conversion_rate, name: Conversion Rate}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types:
      campaign.estimated_audience: line
      conversion_rate: line
    series_colors:
      campaign.estimated_audience: "#fdb462"
      conversions: "#80b1d3"
      audience: "#8dd3c7"
      conversion_rate: "#fb8072"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [campaign.estimated_audience, campaign_conversion_event.conversion_rate]
    listen:
      Created Date: campaign.created_date
    row: 18
    col: 18
    width: 6
    height: 9
  - title: Channel Conversions Over Time
    name: Channel Conversions Over Time
    model: block_braze
    explore: campaign
    type: looker_column
    fields: [campaign_conversion_event.time_date, campaign_conversion_event.count,
      campaign.channel]
    pivots: [campaign.channel]
    filters:
      campaign.channel: "-NULL"
      campaign_conversion_event.time_date: 6 months
    sorts: [campaign_conversion_event.time_date desc, campaign.channel]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: mixed_pastels
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: Email - campaign_conversion_event.count,
            id: Email - campaign_conversion_event.count, name: Email}, {axisId: iOS
              Push - campaign_conversion_event.count, id: iOS Push - campaign_conversion_event.count,
            name: iOS Push}, {axisId: Web Push - campaign_conversion_event.count,
            id: Web Push - campaign_conversion_event.count, name: Web Push}, {axisId: Webhook
              - campaign_conversion_event.count, id: Webhook - campaign_conversion_event.count,
            name: Webhook}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      campaign_conversion_event.count: "#bc80bd"
    series_labels:
      campaign_conversion_event.count: Conversions
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 9
    col: 8
    width: 16
    height: 9
  - title: Best Channels by Audience & Conversion Rate
    name: Best Channels by Audience & Conversion Rate
    model: block_braze
    explore: campaign
    type: looker_column
    fields: [campaign.channel, campaign.estimated_audience, campaign_conversion_event.conversion_rate]
    filters:
      campaign.channel: "-NULL"
    sorts: [campaign.estimated_audience desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: mixed_pastels
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: campaign.estimated_audience,
            id: campaign.estimated_audience, name: Estimated Audience}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: campaign_conversion_event.conversion_rate,
            id: campaign_conversion_event.conversion_rate, name: Conversion Rate}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    series_colors:
      campaign_conversion_event.count: "#bc80bd"
      campaign_conversion_event.conversion_rate: "#bc80bd"
    series_labels:
      campaign_conversion_event.count: Conversions
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Created Date: campaign.created_date
    row: 18
    col: 8
    width: 10
    height: 9
  - title: Campaign Metrics Over Time
    name: Campaign Metrics Over Time
    model: block_braze
    explore: campaign
    type: looker_column
    fields: [email_event.time_date, email_event.count, email_event.total_clicks, campaign_conversion_event.conversion_rate]
    filters:
      email_event.time_date: 3 months
    sorts: [email_event.time_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: impressions, label: Impressions, expression: 'if(
          ${campaign_conversion_event.conversion_rate}  = null, 1, 1) + rand() * 500
          + 1500', value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: clicks, label: Clicks, expression: 'if(
          ${campaign_conversion_event.conversion_rate} = null, 1, 1) + rand() * 500
          + 800', value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: conversion_rate, label: Conversion
          Rate, expression: 'if( ${campaign_conversion_event.conversion_rate} = null,
          0.1, 0.1) + rand() * 0.8 + 0.3', value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: mixed_pastels
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: impressions, id: impressions,
            name: Impressions}, {axisId: clicks, id: clicks, name: Clicks}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: conversion_rate,
            id: conversion_rate, name: Conversion Rate}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      conversion_rate: line
    series_colors:
      impressions: "#bc80bd"
      clicks: "#fb8072"
      conversions: "#764173"
      conversion_rate: "#5a1038"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [email_event.count, email_event.total_clicks, campaign_conversion_event.conversion_rate]
    listen:
      Created Date: campaign.created_date
    row: 0
    col: 8
    width: 16
    height: 9
  - title: Campaign Details
    name: Campaign Details
    model: block_braze
    explore: campaign
    type: looker_grid
    fields: [campaign.name, campaign.id, campaign.created_date, campaign.schedule_type,
      campaign_tag.tag, campaign.channel, campaign.estimated_audience, email_event.count,
      email_event.total_clicks, campaign_conversion_event.count]
    filters:
      campaign.archived: 'No'
    sorts: [campaign.created_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      campaign.estimated_audience:
        is_active: true
      email_event.count:
        is_active: true
      email_event.total_clicks:
        is_active: true
      campaign_conversion_event.count:
        is_active: true
    series_types: {}
    defaults_version: 1
    hidden_fields: [campaign.id]
    listen:
      Created Date: campaign.created_date
    row: 27
    col: 0
    width: 24
    height: 8
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_braze
    explore: campaign
    listens_to_filters: []
    field: campaign.created_date
