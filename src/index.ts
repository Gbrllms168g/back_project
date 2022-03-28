import loaders from './loaders'

async function start() {
    await loaders()
    console.log('Server ready')
}

start()