import {check} from "express-validator";
import {Request, Response, NextFunction} from "express";
import {validateResult} from "./Validate_Result";

export const validateUpdate = [
    check('name')
        .exists()
        .not()
        .isEmpty(),
    check('ap')
        .exists()
        .not()
        .isEmpty(),
    check('am')
        .exists()
        .not()
        .isEmpty(),
    check('rfc')
        .exists()
        .not()
        .isEmpty(),
    check('curp')
        .exists()
        .not()
        .isEmpty(),
    (req:Request, res:Response, next: NextFunction) => {
        validateResult(req, res, next())
    }
]