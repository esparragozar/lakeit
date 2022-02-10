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

    relationship: many_to_one

  }

  join:  stage_dim_time {
    type: left_outer
    sql_on: ${stage_dim_time.fecha_date} = ${stage_sales.date_sale_date};;

    relationship: many_to_one

  }

  join:  stage_main_categories {
    type: left_outer
    sql_on:  ${stage_item_categories.main_category_id}  = ${stage_main_categories.main_category_id};;

    relationship: many_to_one

  }


  join:  stage_item_categories {
    type: left_outer
    sql_on: ${stage_items.category_id} = ${stage_item_categories.item_category_id};;

    relationship: many_to_one

  }




    join:  resultado_modelo_demo {
      type: left_outer
      sql_on: ${stage_sales.ID_DATE} = ${resultado_modelo_demo.ID_DATE};;

      relationship: many_to_many

    }





}




explore: Calendario {
from:  stage_dim_time


join: Pronostico {
from: resultado_modelo_demo
  type: left_outer
  sql_on: ${Calendario.ID_DATE} = ${Pronostico.ID_DATE}  ;;
fields: [Pronostico.fecha,Pronostico.ventas]
  relationship: one_to_many

}


  join:  Ventas {
    from:  stage_sales
   type: left_outer
   sql_on: ${Calendario.ID_DATE} = ${Ventas.ID_DATE};;
    fields: [Ventas.item_price,Ventas.date_sale_date]
   relationship: one_to_many

 }



  join:  Tiendas {
    from:  stage_shops
    type: left_outer
    sql_on: ${Tiendas.shop_id} = ${Ventas.shop_id}
    and &${Tiendas.shop_id} = ${Pronostico.tienda};;

    relationship: one_to_many

  }


#
#view_name: stage_sales {
#
#  dimension: ID_DATE {
#    primary_key: no
#
#  }

#}




# join:  stage_sales {
#   type: left_outer
#   sql_on: ${resultado_modelo_demo.ID_DATE} = ${stage_sales.ID_DATE};;
#
#   relationship: many_to_many
#
# }




##  join:  stage_main_categories {
##    type: left_outer
##
##    sql_on: ${resultado_modelo_demo.categoria} = ${stage_main_categories.main_category_id};;
##
##    relationship: many_to_one
##
##  }
##


##  join: stage_item_categories {
##
##    type: left_outer
##    sql_on: ${stage_item_categories.main_category_id} = ${stage_main_categories.main_category_id}
##    and ${stage_item_categories.item_category_id} = ${stage_item_categories.item_category_id};;
##    relationship: many_to_one
##
##  }


  }
