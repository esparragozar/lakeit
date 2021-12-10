view: stage_shops {
  sql_table_name: `DSET01.stage_shops`
    ;;

  dimension: shop_city {
    type: string
    sql: ${TABLE}.shop_city ;;
  }

  dimension: shop_country {
    type: string
    sql: ${TABLE}.shop_country ;;
  }

  dimension: shop_id {
    type: number
    sql: ${TABLE}.shop_id ;;
  }

  dimension: shop_name {
    type: string
    sql: ${TABLE}.shop_name ;;
  }

  dimension: shop_zone {
    type: string
    sql: ${TABLE}.shop_zone ;;
  }

  measure: count {
    type: count
    drill_fields: [shop_name]
  }
}
