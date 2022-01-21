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
   # sql: ${TABLE}.Fecha ;;
    sql: to_char(${TABLE}.Fecha, 'YYYY-MM-DD')
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

  measure: count {
    type: count
    drill_fields: []
  }
}