# The name of this view in Looker is "Resultado Modelo Demo Arima Plus"
view: resultado_modelo_demo_arima_plus {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `DSET01_Analitica.Resultado_Modelo_Demo_ARIMA_PLUS`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Aic" in Explore.

  dimension: aic {
    type: number
    sql: ${TABLE}.AIC ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_aic {
    type: sum
    sql: ${aic} ;;
  }

  measure: average_aic {
    type: average
    sql: ${aic} ;;
  }

  dimension: categoria {
    type: number
    sql: ${TABLE}.Categoria ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  dimension: has_drift {
    type: yesno
    sql: ${TABLE}.has_drift ;;
  }

  dimension: has_holiday_effect {
    type: yesno
    sql: ${TABLE}.has_holiday_effect ;;
  }

  dimension: has_spikes_and_dips {
    type: yesno
    sql: ${TABLE}.has_spikes_and_dips ;;
  }

  dimension: has_step_changes {
    type: yesno
    sql: ${TABLE}.has_step_changes ;;
  }

  dimension: log_likelihood {
    type: number
    sql: ${TABLE}.log_likelihood ;;
  }

  dimension: non_seasonal_d {
    type: number
    sql: ${TABLE}.non_seasonal_d ;;
  }

  dimension: non_seasonal_p {
    type: number
    sql: ${TABLE}.non_seasonal_p ;;
  }

  dimension: non_seasonal_q {
    type: number
    sql: ${TABLE}.non_seasonal_q ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: seasonal_periods {
    hidden: yes
    sql: ${TABLE}.seasonal_periods ;;
  }

  dimension: tienda {
    type: number
    sql: ${TABLE}.Tienda ;;
  }

  dimension: variance {
    type: number
    sql: ${TABLE}.variance ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Resultado Modelo Demo Arima Plus Seasonal Periods"
view: resultado_modelo_demo_arima_plus__seasonal_periods {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Resultado Modelo Demo Arima Plus Seasonal Periods" in Explore.

  dimension: resultado_modelo_demo_arima_plus__seasonal_periods {
    type: string
    sql: resultado_modelo_demo_arima_plus__seasonal_periods ;;
  }
}
