import { Line } from "react-chartjs-2";
import { Container } from "@chakra-ui/react"
import React, { useState, useEffect } from 'react';
import axios from 'axios';

function buildChartFor(typeChartObject, label) {
  return {
    labels: typeChartObject?.input_labels || [],
    datasets: [
     {
       label: typeChartObject?.label || label,
        data: typeChartObject?.data || [],
        fill: true,
        backgroundColor: "rgba(75,192,192,0.2)",
        borderColor: "rgba(75,192,192,1)"
      }
    ]
  }
}

function Main() {
  const TEMPERATURE = 'TEMPERATURE'
  const CARBON_MONOXIDE = 'CARBON_MONOXIDE'
  const AIR_HUMIDITY = 'AIR_HUMIDITY'
  const [loading, setLoading] = useState(false);
  const [temp, setTemp] = useState(null);
  const [air_humidity, setAirHumidity] = useState(null);
  const [carbon, setCarbon] = useState(null);
  const [fetched, setFetched] = useState(false);

  useEffect(() => {
    if(!fetched) {
      setLoading(true);
      const apiUrl = 'http://localhost:4567/device_events/charts';
      axios.get(apiUrl).then((resp) => {
        const responseData = resp.data;

        setCarbon(responseData.find(t => t.label == CARBON_MONOXIDE));
        setTemp(responseData.find(t => t.label == TEMPERATURE));
        setAirHumidity(responseData.find(t => t.label == AIR_HUMIDITY));
        setFetched(true)
      });
    }
  }, [temp, air_humidity, carbon]);

  if(!fetched) {
    return null;
  }

  const temp_data = buildChartFor(temp, TEMPERATURE)
  const carbon_data = buildChartFor(carbon, CARBON_MONOXIDE)
  const air_humidity_data = buildChartFor(air_humidity_data, AIR_HUMIDITY)
  
  return (
    <Container maxW={'7xl'} centerContent>
      <br/>
      <Line data={temp_data} />
      <br/>
      <Line data={carbon_data} />
      <br/>
      <Line data={air_humidity_data} />
    </Container>
  );
}

export default Main