view: stage_items {
  sql_table_name: `DSET01.stage_items`
    ;;

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }

  measure: conteo_prod {
    type: count


  }
}
