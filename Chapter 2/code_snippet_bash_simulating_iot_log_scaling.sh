#!/bin/bash



LOG_DIR="/var/iot_logs"

MAX_SIZE=10000  # maximum log lines before rotating



rotate_logs() {

  echo "Rotating logs..."

  mv $LOG_DIR/iot_data.log $LOG_DIR/iot_data_$(date +%F_%T).log

  echo "Log rotation complete."

}



while true; do

  echo "$(date): Sensor reading recorded" >> $LOG_DIR/iot_data.log

  lines=$(wc -l < $LOG_DIR/iot_data.log)

  

  if [ "$lines" -gt "$MAX_SIZE" ]; then

    rotate_logs

  fi

  

  sleep 1

done