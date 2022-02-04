view: stage_dim_time {
  sql_table_name: `DSET01.stage_dim_time`
    ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.anio ;;
  }

  dimension_group: fecha {
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
    sql: ${TABLE}.fecha ;;
  }

  dimension: ID_DATE {
    type: string
    sql: FORMAT_DATE("%Y%m%d", ${TABLE}.fecha) ;;
  }



  dimension: mes {
    type: string
    sql: ${TABLE}.mes ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
