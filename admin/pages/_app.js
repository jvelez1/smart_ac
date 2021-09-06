import { ChakraProvider } from "@chakra-ui/react"
import { Flex } from '@chakra-ui/layout'
import { Container } from "@chakra-ui/react"
import Sidebar from '../components/Sidebar'
import Login from "./login"
import React, { useState, useEffect } from 'react';

function MyApp({ Component, pageProps }) {
  const [token, setToken] = useState(null);

  useEffect(() => {
    if(sessionStorage != 'undefined') {
      const tokenString = sessionStorage.getItem('token');
      const userToken = JSON.parse(tokenString);      
      setToken(userToken?.token);
    }
  }, []);

  if(!token) {
    return (
      <ChakraProvider>
        <Login setToken={setToken}/>
      </ChakraProvider>
    )
  }

  return (
    <ChakraProvider>
      <Flex>
        <Sidebar />
        <Container maxW={'9xl'} centerContent>
          <Component  {...pageProps} />
        </Container>
      </Flex>
    </ChakraProvider>
  )
}
export default MyApp