import { ChakraProvider } from "@chakra-ui/react"
import { Flex } from '@chakra-ui/layout'
import { Container } from "@chakra-ui/react"
import Sidebar from '../components/Sidebar'
import { QueryClient, QueryClientProvider } from 'react-query';
const queryClient = new QueryClient();


function MyApp({ Component, pageProps }) {
  return (
    <ChakraProvider>
      <QueryClientProvider client={queryClient}>
        <Flex>
          <Sidebar />
          <Container maxW={'9xl'} centerContent>
            <Component  {...pageProps} />
          </Container>
        </Flex>
      </QueryClientProvider>
    </ChakraProvider>
  )
}
export default MyApp