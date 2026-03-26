#!/bin/bash

# Automate IoT Data Export for Analysis in Athena



DATABASE="iot_data_analytics"

TABLE="sensor_readings"

S3_PATH="s3://iot-sensor-data/processed/"



# Create Athena table if it doesn't exist

aws athena start-query-execution \

  --query-string "CREATE EXTERNAL TABLE IF NOT EXISTS $TABLE (

    device_id string,

    timestamp string,

    temperature float,

    humidity float

  )

  ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'

  LOCATION '$S3_PATH';" \

  --result-configuration OutputLocation=s3://athena-query-results/



echo "Athena table for IoT data created successfully!"