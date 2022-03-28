import {Router} from "express";
import {Request, Response} from "express";
import USERCONTROLLER from "../controller/users";
import {validateUpdate} from "../middleware/Validate_Update.Middleware";

//Genera las rutas para las peticiones
const indexRouter = Router()

//Retorna la lista de usuarios dados de alta
indexRouter.get('/',  USERCONTROLLER.get_list_users)

indexRouter.route('/user/:id')
    //retorna el usuario con informacion detallada
    .get(USERCONTROLLER.get_account_details)
    //actualiza el usuario
    .patch(validateUpdate, USERCONTROLLER.update_user)
    //elimina usuario
    .delete(USERCONTROLLER.delete_user)


export default indexRouter