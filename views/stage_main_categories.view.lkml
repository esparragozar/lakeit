view: stage_main_categories {
  sql_table_name: `DSET01.stage_main_categories`
    ;;

  dimension: main_category_id {
    type: number
    sql: ${TABLE}.main_category_id ;;
  }

  dimension: main_category_name {
    type: string
    sql: ${TABLE}.main_category_name ;;

  }

  measure: count {
    type: count
    drill_fields: [main_category_name]
  }
}
