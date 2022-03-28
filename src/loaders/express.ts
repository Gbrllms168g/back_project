import {Application, json, urlencoded} from "express";
import * as express from 'express'
import config from '../config'
import * as morgan from 'morgan'
import * as cors from 'cors'
import indexRouter from "../routes";

export default class ExpressApp {
    private host_values = config.host_values;
    private application: Application

    constructor() {
        this.application = express()
        this.bodyParser()
        this.loadMiddleware()
        this.loadRoutes()
        this.server()
    }

    private bodyParser(){
        this.application.use(json())
        this.application.use(urlencoded({extended:true}))
    }

    private loadRoutes() {
        this.application.use('/', indexRouter)
    }

    private loadMiddleware(){
        this.application.use(cors())
        this.application.use(morgan('dev'))
    }

    private server(){
        this.application.listen(this.host_values.port, () => {
            console.log(`server listening at: ${this.host_values.host}:${this.host_values.port}`)
        })
    }
}