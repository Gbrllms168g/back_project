import TypeORM from './typeorm'
import ExpressApp from './express'

//Inicia el server
export default async function() {
    //Carga la configuracion del conector a la Bd
    const dbInit = new TypeORM()
    await dbInit.connect()
    //Crea la instancia del server
    new ExpressApp()
}