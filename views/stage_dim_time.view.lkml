view: stage_dim_time {
  sql_table_name: `DSET01.stage_dim_time`
    ;;

  dimension: anio {
    type: date
    sql: ${TABLE}.anio ;;
  }

  dimension_group: fecha {
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
    sql: ${TABLE}.fecha ;;
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
