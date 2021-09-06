import {
    Table,
    Thead,
    Tbody,
    Tfoot,
    Tr,
    Th,
    Td,
    TableCaption,
  } from "@chakra-ui/react"
import React, { useState, useEffect } from 'react';
import axios from 'axios';

function Devices() {
  const [loading, setLoading] = useState(false);
  const [devices, setDevices] = useState(null);

  useEffect(() => {
    if(!devices) {
      setLoading(true);
      const apiUrl = 'http://localhost:4567/devices';
      axios.get(apiUrl).then((resp) => {
        const devices = resp.data.data;
        setLoading(false);
        setDevices(devices)
      });
    }
  }, [devices]);

  return(
    <Table variant="simple">
      <TableCaption>Device List</TableCaption>
      <Thead>
        <Tr>
          <Th>Device ID</Th>
          <Th>Serial</Th>
          <Th>Registration Date</Th>
          <Th>Creeated at</Th>
        </Tr>
      </Thead>
      <Tbody>
        {devices && devices.map((device)=>
          <Tr>
            <Td>{device.id}</Td>
            <Td>{device.attributes.serial}</Td>
            <Td >{device.attributes.registration_date}</Td>
            <Td >{device.attributes.created_at}</Td>
          </Tr>
        )}
      </Tbody>
    </Table>
  )
}

export default Devices
