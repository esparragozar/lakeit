# Define the database connection to be used for this model.
connection: "looker_dset01"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: dset01_analitica_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dset01_analitica_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Dset01 Analitica"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: resultado_modelo_demo {
  join:  stage_sales {
    type: left_outer
    sql_on: ${resultado_modelo_demo.fecha} = MIN(${stage_sales.date_sale_date});;

    relationship: many_to_many

  }


}
  # join: stage_sales {

  #   type: left_outer
  #   sql_on: ${resultado_modelo_demo.fecha} = ${stage_sales.date_sale_date};;

  #   relationship: many_to_many

  # }


  # join:  stage_main_categories {
  #   type: left_outer

  #   sql_on: ${resultado_modelo_demo.categoria} = ${stage_main_categories.main_category_id};;

  #   relationship: many_to_one

  # }



  # join:  stage_dim_time {
  #   type: left_outer

  #   sql_on: ${resultado_modelo_demo.fecha} = ${stage_dim_time.fecha_date};;

  #   relationship: many_to_one

  # }



  # join: stage_item_categories {

  #   type: left_outer
  #   sql_on: ${stage_item_categories.main_category_id} = ${stage_main_categories.main_category_id} ;;
  #   relationship: many_to_one

  # }




  # join: stage_sales {

  #   type: left_outer
  #   sql_on: ${stage_shops.shop_id} = ${stage_sales.shop_id};;

  #   relationship: many_to_one

  # }





explore: resultado_modelo_demo_arima_plus {
  join: resultado_modelo_demo_arima_plus__seasonal_periods {
    view_label: "Resultado Modelo Demo Arima Plus: Seasonal Periods"
    sql: LEFT JOIN UNNEST(${resultado_modelo_demo_arima_plus.seasonal_periods}) as resultado_modelo_demo_arima_plus__seasonal_periods ;;
    relationship: one_to_many
  }
}
