# The name of this view in Looker is "Resultado Modelo Demo"
view: resultado_modelo_demo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `DSET01_Analitica.Resultado_Modelo_Demo`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Categoria" in Explore.

  dimension: categoria {
    type: number
    sql: ${TABLE}.Categoria ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_categoria {
    type: sum
    sql: ${categoria} ;;
  }

  measure: average_categoria {
    type: average
    sql: ${categoria} ;;
  }

  dimension: fecha {
    type: string
   sql: PARSE_DATE('%d/%m/%Y',  ${TABLE}.FECHA) ;;
#CAST(${TABLE}.Fecha AS DATE)

#from_unixtime(unix_timestamp(’${TABLE}.Fecha’,“YYYY/MM/DD”))
  }


  dimension_group: Fecha_Group {
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
    sql: PARSE_DATE('%d/%m/%Y',  ${TABLE}.FECHA) ;;
  }



 dimension: ID_DATE {
   type: string
   # sql: ${TABLE}.Fecha ;;
   # sql: TO_CHAR(resultado_modelo_demo.Fecha,'YYYY-MM-DD') ;;
   # html: {{ fecha de rendered_value |: "%m/%d/%Y" }} ;;
   # sql: DATE_FORMAT(${TABLE}.Fecha,’%m/%d/%Y’) ;;
   sql: (FORMAT_DATE('%Y%m%d', PARSE_DATE('%d/%m/%Y',  ${TABLE}.FECHA) ));;

  primary_key: yes
 }

  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: tienda {
    type: number
    sql: ${TABLE}.Tienda ;;
  }

  dimension: ventas {
    type: number
    sql: ${TABLE}.Ventas ;;
  }

  measure: total_ventas {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.Ventas  ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
