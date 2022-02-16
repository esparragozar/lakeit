view: analitica {




  dimension_group: Grupo_fecha {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.C_FECHA ;;
  }



  dimension: id_aniomes {
    type: number
    sql: ${TABLE}.id_aniomes ;;
  }


  dimension: mes {
    type: string
    sql: ${TABLE}.mes ;;
  }
  dimension: anio {
    type: number
    sql: ${TABLE}.anio ;;
  }
  dimension: tienda {
    type: string
    sql: ${TABLE}.tienda ;;
  }
  dimension: pais {
    type: string
    sql: ${TABLE}.pais ;;
  }
  dimension: categoria {
    type: string
    sql: ${TABLE}.categoria ;;
  }
  dimension: tot_pronos {
    type: number
    sql: ${TABLE}.tot_pronos ;;
  }

  dimension: tot_ventas {
    type: number
    sql: ${TABLE}.tot_ventas ;;
  }




  derived_table: {
    sql:



SELECT

(FORMAT_TIMESTAMP('%Y%m', Ventas.date_sale )) as  id_aniomes,
Calendar.mes,
Calendar.anio,
tiendas.shop_name as tienda,
tiendas.shop_country as pais,
cat.main_category_name as categoria,
sum(ifnull(pronos.ventas,0)) as tot_pronos,
sum(ventas.item_price) as tot_ventas


 FROM  `DSET01.stage_dim_time` as Calendar

left join  `DSET01.stage_sales` as ventas
on FORMAT_DATE("%Y%m%d", Calendar.fecha) = (FORMAT_TIMESTAMP('%Y%m%d', ventas.date_sale  ))

left join `DSET01.stage_shops` as tiendas
on  ventas.shop_id = tiendas.shop_id

left join `DSET01.stage_items` as prod
on prod.item_id = ventas.item_id

left join `DSET01.stage_item_categories` as sub
on sub.item_category_id = prod.category_id

left join `DSET01.stage_main_categories` as cat
on cat.main_category_id = sub.main_category_id



left join `DSET01_Analitica.Resultado_Modelo_Demo` as Pronos
on (FORMAT_DATE('%Y%m', PARSE_DATE('%d/%m/%Y',  Pronos.FECHA) )) = FORMAT_DATE("%Y%m", Calendar.fecha)
and Pronos.Tienda = tiendas.shop_id
and Pronos.pais = tiendas.shop_country
and Pronos.Categoria = cat.main_category_id



group by
(FORMAT_TIMESTAMP('%Y%m', Ventas.date_sale )),
ventas.shop_id,
tiendas.shop_id,
tiendas.shop_name,
tiendas.shop_country,
cat.main_category_name,
Calendar.mes,
Calendar.anio


;;



  }




  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: pruebaview {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
