view: pruebaview {


  dimension: FECHA {
    type: string
    sql: FORMAT_DATE("%Y%m", ${TABLE}.C_FECHA)  ;;
  }



  dimension: C_FECHA {
    type: date
    sql: ${TABLE}.C_FECHA ;;
  }




  dimension: P_VENTAS {
    type: number
    sql:  ${TABLE}.P_VENTAS ;;
  }

  dimension: V_ID_TIENDA {
    type: number
    sql:  ${TABLE}.V_ID_TIENDA ;;
  }
  dimension: V_ID_PRODUCTO {
    type: number
    sql:  ${TABLE}.V_ID_PRODUCTO ;;
  }
  dimension: V_VENTA {
    type: number
    sql:  ${TABLE}.V_VENTA ;;
  }



  dimension: T_NOMBRE {
    type: string
    sql:  ${TABLE}.T_NOMBRE ;;
  }
  dimension: T_PAIS {
    type: string
    sql:  ${TABLE}.T_PAIS ;;
  }
  dimension: T_CIUDAD {
    type: string
    sql:  ${TABLE}.T_CIUDAD ;;
  }
  dimension: T_ZONA {
    type: string
    sql:  ${TABLE}.T_ZONA ;;
  }





  dimension: PROD_NOMBRE {
    type: string
    sql:  ${TABLE}.PROD_NOMBRE ;;
  }
  dimension: PROD_ID {
    type: number
    sql:  ${TABLE}.PROD_ID ;;
  }
  dimension: PROD_ID_CAT {
    type: number
    sql:  ${TABLE}.PROD_ID_CAT ;;
  }





  dimension: SUB_NOMBRE {
    type: string
    sql:  ${TABLE}.SUB_NOMBRE ;;
  }
  dimension: SUB_ID_PROD {
    type: number
    sql:  ${TABLE}.SUB_ID_PROD ;;
  }
  dimension: SUB_ID_CAT {
    type: number
    sql:  ${TABLE}.SUB_ID_CAT ;;
  }



  dimension: CAT_ID {
    type: number
    sql:  ${TABLE}.CAT_ID ;;
  }
  dimension: CAT_NOMBRE {
    type: string
    sql:  ${TABLE}.CAT_NOMBRE ;;
  }



  derived_table: {
    sql:

SELECT

Calendar.fecha as C_FECHA,
Calendar.mes as C_MES,
Calendar.anio as C_ANIO,
Pronos.Fecha as P_FECHA,
Pronos.Pais as P_PAIS,
Pronos.Tienda as P_TIENDA,
Pronos.Categoria as P_CATEGORIA,
Pronos.Ventas as P_VENTAS,
Ventas.date_sale as V_FECHA,
Ventas.shop_id as V_ID_TIENDA,
Ventas.item_id as V_ID_PRODUCTO,
Ventas.item_price as V_VENTA,
Tienda.shop_name as T_NOMBRE,
Tienda.shop_id as T_ID,
Tienda.shop_country as T_PAIS,
Tienda.shop_city as T_CIUDAD,
Tienda.shop_zone as T_ZONA,
Productos.item_name as PROD_NOMBRE,
Productos.item_id as PROD_ID,
Productos.category_id as PROD_ID_CAT,
Subcat.item_category_name as SUB_NOMBRE,
Subcat.item_category_id as SUB_ID_PROD,
Subcat.main_category_id as SUB_ID_CAT,
Cat.main_category_id as CAT_ID,
Cat.main_category_name as CAT_NOMBRE

FROM `DSET01.stage_dim_time` AS Calendar


LEFT JOIN `DSET01_Analitica.Resultado_Modelo_Demo`
     AS Pronos ON FORMAT_DATE("%Y%m%d", Calendar.fecha) = (FORMAT_DATE('%Y%m%d', PARSE_DATE('%d/%m/%Y',  Pronos.FECHA) ))

LEFT JOIN `DSET01.stage_sales`
     AS Ventas ON (FORMAT_TIMESTAMP('%Y%m%d', Ventas.date_sale )) = FORMAT_DATE("%Y%m%d", Calendar.fecha)

LEFT JOIN `DSET01.stage_shops`
     AS Tienda ON Pronos.Tienda = Tienda.shop_id AND Ventas.shop_id = Tienda.shop_id

LEFT JOIN `DSET01.stage_items`
     AS Productos ON  Productos.item_id = Ventas.item_id

LEFT JOIN `DSET01.stage_item_categories`
     AS Subcat ON  Productos.category_id = Subcat.main_category_id

LEFT JOIN `DSET01.stage_main_categories`
     AS Cat ON  Cat.main_category_id = Subcat.main_category_id


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
