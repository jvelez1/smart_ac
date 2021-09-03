import React from "react";
 // javascipt plugin for creating charts
 import Chart from "chart.js";
 // react plugin used to create charts
 import { Line, Bar, Doughnut, Pie } from "react-chartjs-2";
 // reactstrap components
 import { Card, CardHeader, CardBody } from "reactstrap";

 const data = {
  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
  datasets: [
    {
      label: 'My First dataset',
      fill: false,
      lineTension: 0.1,
      backgroundColor: 'rgba(75,192,192,0.4)',
      borderColor: 'rgba(75,192,192,1)',
      borderCapStyle: 'butt',
      borderDash: [],
      borderDashOffset: 0.0,
      borderJoinStyle: 'miter',
      pointBorderColor: 'rgba(75,192,192,1)',
      pointBackgroundColor: '#fff',
      pointBorderWidth: 1,
      pointHoverRadius: 5,
      pointHoverBackgroundColor: 'rgba(75,192,192,1)',
      pointHoverBorderColor: 'rgba(220,220,220,1)',
      pointHoverBorderWidth: 2,
      pointRadius: 1,
      pointHitRadius: 10,
      data: [65, 59, 80, 81, 56, 55, 40]
    }
  ]
};

const TempLine = () => {
  return (
    <>
      <Card>
        <CardHeader>
          <h5 className="h3 mb-0">Line chart</h5>
        </CardHeader>
        <CardBody>
          <div className="chart">
            <Line
              data={data}
              id="aja"
              className="chart-canvas"
            />
          </div>
        </CardBody>
      </Card>
    </>
  );
}

 export default TempLine;