import { ChakraProvider } from "@chakra-ui/react"
import { Flex } from '@chakra-ui/layout'
import { Container } from "@chakra-ui/react"
import Sidebar from '../components/Sidebar'

function MyApp({ Component, pageProps }) {
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