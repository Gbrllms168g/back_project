import {getManager} from "typeorm";

export default class SQLACCESS {

    static async get_active_clients() {
        const query = `CALL get_active_clients()`
        const  result = await getManager().connection.query(query)
        const result_String = JSON.stringify(result)
        const json = JSON.parse(result_String)
        return json
    }

    static async get_inactive_clients() {
        const query = `CALL get_inactive_clients()`
        const  result = await getManager().connection.query(query)
        const result_String = JSON.stringify(result)
        const json = JSON.parse(result_String)
        return json
    }

    static async update_user(id: number, name: string, p_last_name: string, m_last_name: string, rfc: string, curp: string) {
        const query = "call update_user(?, ?, ?, ?, ?, ?);"
        const  result = await getManager().connection.query(query, [id, name, p_last_name, m_last_name, rfc, curp])
        const result_String = JSON.stringify(result)
        const json = JSON.parse(result_String)
        return json
    }

    static async get_selected_user(id: number) {
        const  query = "CALL get_selected_user(?)"
        const  result = await getManager().connection.query(query, [id])
        const result_String = JSON.stringify(result)
        const json = JSON.parse(result_String)
        return json[0]
    }

    static async delete_user(id: number) {
        const  query = "CALL delete_user(?);"
        const  result = await getManager().connection.query(query, [id])
        const result_String = JSON.stringify(result)
        const json = JSON.parse(result_String)
        return json
    }

    static async get_account_details(id: number) {
        const  query = "CALL get_account_details(?);"
        const  result = await getManager().connection.query(query, [id])
        const result_String = JSON.stringify(result)
        const json = JSON.parse(result_String)
        return json[0]
    }


}