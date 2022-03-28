import {validationResult} from 'express-validator'

export const validateResult = (req, res, next) => {
    try {
        validationResult(req).throw()
        return next
    } catch (err) {
        // res.json({errors: err.array()}).statusCode(403)
        return err
    }
}
