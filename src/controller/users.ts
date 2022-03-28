import SQLACCESS from "../repository/sql_access";
import {Request, Response} from "express";

export default class USERCONTROLLER {

    static async get_list_users(req: Request, res: Response){
        const active_clients = await SQLACCESS.get_active_clients()
        const inactive_clients = await SQLACCESS.get_inactive_clients()
        //Retorna la lista de usuarios activos e inactivos
        if (active_clients || inactive_clients){
            return res.json({msg: "succes", data: {active: active_clients, inactive: inactive_clients} }).status(200)
        } else if (!active_clients && !inactive_clients) {
            return res.json({msg: "not users were found", data: []}).status(404)
        }
    }

    static async update_user(req: Request, res: Response){
        const {id, name, ap, am, rfc, curp} = req.body
        const rfc_format = /^[a-zA-Z]{3,4}(\d{6})((\D|\d){2,3})?$/;
        const curp_format = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/
        // valida que el rfc y la curp coincidan con sus formatos
        if (rfc_format.test(rfc) && curp_format.test(curp) ) {
            const response = await SQLACCESS.update_user(id, name, ap, am, rfc, curp)
            //Si hay respuesta retorna que se actualizo el usuario
            if (response){
                return res.json({success: true, msg: 'Usuario actualizado correctamente'})
            } else {
                return res.json({success: false, msg: 'No se pudo actualizar el usuario'})
            }
        } else {
            //Si no coinciden retorna el error que los formatos no son validos
            return res.json({success: false, msg: 'Los formatos de rfc y curp deben coincidir'})
        }

    }

    static async get_account_details(req: Request, res: Response) {
        const id = parseInt(req.params.id)
        const user = await SQLACCESS.get_account_details(id)
        //Retorna la cuenta del usuario por id
        return res.json(user).status(200)
    }

    static async delete_user(req: Request, res: Response){
        const id = parseInt(req.params.id)
        const result = await SQLACCESS.delete_user(id)
        //Elimina el usuario por Id
        if (result){
            return res.json({success: true, msg: 'Usuario eliminado correctamente'})
        } else {
            return res.json({success: false, msg: 'No se pudo eliminar el usuario'})
        }
    }

}