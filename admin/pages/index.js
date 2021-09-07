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

  function fetchCharData() {
    const apiUrl = 'http://localhost:4567/device_events/charts';
    axios.get(apiUrl).then((resp) => {
      console.log(resp.data)
      setCharts(resp.data)
      setLoading(false);
      setFetched(true)
    });
  }

  function setCharts(responseData) {
    console.log(responseData);
    setCarbon(responseData.find(t => t.label == CARBON_MONOXIDE));
    setTemp(responseData.find(t => t.label == TEMPERATURE));
    setAirHumidity(responseData.find(t => t.label == AIR_HUMIDITY));
  }

  useEffect(() => {
    if(!fetched) {
      fetchCharData();
    }
  }, []);

  useEffect(async () => {
    const interval = setInterval(async () => {
      fetchCharData();
    }, 10000);
    return () => clearInterval(interval);
  }, []);

  if(!fetched) {
    return null;
  }

  const temp_data = buildChartFor(temp, TEMPERATURE)
  const carbon_data = buildChartFor(carbon, CARBON_MONOXIDE)
  const air_humidity_data = buildChartFor(air_humidity, AIR_HUMIDITY)
  
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