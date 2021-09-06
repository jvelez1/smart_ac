import { ChakraProvider } from "@chakra-ui/react"
import { Flex } from '@chakra-ui/layout'
import Sidebar from '../components/Sidebar'

function MyApp({ Component, pageProps }) {
  return (
    <ChakraProvider>
      <Flex>
        <Sidebar />
      </Flex>
      <Component {...pageProps} />
    </ChakraProvider>
  )
}
export default MyApp