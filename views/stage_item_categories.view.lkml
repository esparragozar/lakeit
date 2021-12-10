view: stage_item_categories {
  sql_table_name: `DSET01.stage_item_categories`
    ;;

  dimension: item_category_id {
    type: number
    sql: ${TABLE}.item_category_id ;;
  }

  dimension: item_category_name {
    type: string
    sql: ${TABLE}.item_category_name ;;
  }

  dimension: main_category_id {
    type: number
    sql: ${TABLE}.main_category_id ;;
  }

  measure: count {
    type: count
    drill_fields: [item_category_name]
  }
}
