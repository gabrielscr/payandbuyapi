import jwt from "jsonwebtoken";

class TokenController {

    verifyToken(req, res, next) {
        const token = req.headers['x-access-token'];
        if (!token) {
            return res.status(401).send({ auth: false, message: 'No token provided' });
        }

        const decoded = jwt.verify(token, "mysecrettoken");
        req.userId = decoded.id;
        next();
    }
}

export default new TokenController();



