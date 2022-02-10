view: stage_sales {
  sql_table_name: `DSET01.stage_sales`
    ;;

  dimension_group: _partitiondate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: date_block_num {
    type: number
    sql: ${TABLE}.date_block_num ;;
  }

  dimension_group: date_sale {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_sale ;;
  }

  dimension: item_cnt_day {
    type: number
    sql: ${TABLE}.item_cnt_day ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_price {
    type: number
    sql: ${TABLE}.item_price ;;
  }

  dimension: shop_id {
    type: number
    sql: ${TABLE}.shop_id ;;
  }

  dimension: ID_DATE {
    type: string
    sql: (FORMAT_TIMESTAMP('%Y%m%d', ${TABLE}.date_sale  ));;

    primary_key: no
  }


  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.item_price  ;;
  }
}
