import User from "../models/User";
import jwt from "jsonwebtoken";

class AuthController {

    async signup(req, res) {
        try {
            const { username, email, senha } = req.body;

            console.log("body");
            console.log(req.body);

            const user = new User({
                username,
                email,
                senha
            });

            const verificarSeExiste = await User.findOne({ email: req.body.email });

            if (verificarSeExiste) {
                return res.status(500).send("Usuário já existe.");
            }

            user.senha = await user.encryptPassword(senha);

            await user.save();

            const token = jwt.sign({ id: user.id }, "mysecrettoken", {
                expiresIn: 60 * 60 * 24
            });

            res.json({ auth: true, token });

        } catch (e) {
            console.log(e)
            res.status(500).send('Ocorreu um problema.');
        }
    }

    async signin(req, res) {
        try {
            const user = await User.findOne({ email: req.body.email })
            if (!user) {
                return res.status(404).send('O e-mail não existe.');
            }
            const validPassword = await user.validatePassword(req.body.senha, user.senha);
            if (!validPassword) {
                return res.status(401).send({ auth: false, token: null });
            }
            const token = jwt.sign({ id: user._id }, "mysecrettoken", {
                expiresIn: '24h'
            });
            res.status(200).json({ auth: true, token });
        } catch (e) {
            console.log(e)
            res.status(500).send('Ocorreu um problema ao se logar.');
        }
    }

    logout(_req, res) {
        res.status(200).send({ auth: false, token: null });
    }
}

export default new AuthController();