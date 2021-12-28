connection: "looker_dset01"

# include all the views
include: "/views/**/*.view"

datagroup: dset01_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dset01_project_default_datagroup

#explore: raw_sales {}
#explore: raw_shops {}
#explore: raw_items {}
#explore: raw_item_categories {}



explore: stage_sales {

  join: stage_shops {

    type: left_outer
    sql_on: ${stage_shops.shop_id} = ${stage_sales.shop_id};;

    relationship: many_to_one

  }

  join:  stage_items {
    type: left_outer
    sql_on: ${stage_items.item_id} = ${stage_sales.item_id};;

    relationship: one_to_many

  }

  join:  stage_dim_time {
    type: left_outer
    sql_on: ${stage_dim_time.fecha_date} = ${stage_sales.date_sale_date};;

    relationship: many_to_one

  }



  join:  stage_item_categories {
    type: left_outer
    sql_on: ${stage_items.category_id} = ${stage_item_categories.item_category_id};;

    relationship: many_to_one

  }


  join:  stage_main_categories {
    type: left_outer
    sql_on: ${stage_main_categories.main_category_id} = ${stage_item_categories.main_category_id};;

    relationship: many_to_one

  }




}


explore: stage_items {

  join:  stage_item_categories {
    type: left_outer
    sql_on: ${stage_items.category_id} = ${stage_item_categories.item_category_id};;

    relationship: one_to_many

  }

}
explore: stage_item_categories {
  join:  stage_main_categories {
    type: left_outer
    sql_on: ${stage_main_categories.main_category_id} = ${stage_item_categories.main_category_id};;

    relationship: one_to_many

}

}

#explore: stage_main_categories {}

#explore: stage_sales {}

#explore: stage_shops {}
