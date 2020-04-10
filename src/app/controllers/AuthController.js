import User from "../models/User";
import jwt from "jsonwebtoken";

class AuthController {

    async signup(req, res) {
        console.log("CARALHO");
        try {
            const { username, email, password } = req.body;

            const user = new User({
                username,
                email,
                password
            });

            const verificarSeExiste = await User.findOne({ email: req.body.email });

            if (verificarSeExiste) {
                return res.status(500).send("Usuário já existe.");
            }

            user.password = await user.encryptPassword(password);

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
                return res.status(404).send("The email doesn't exists")
            }
            const validPassword = await user.validatePassword(req.body.password, user.password);
            if (!validPassword) {
                return res.status(401).send({ auth: false, token: null });
            }
            const token = jwt.sign({ id: user._id }, config.secret, {
                expiresIn: '24h'
            });
            res.status(200).json({ auth: true, token });
        } catch (e) {
            console.log(e)
            res.status(500).send('There was a problem signin');
        }
    }

    logout(_req, res) {
        res.status(200).send({ auth: false, token: null });
    }
}

export default new AuthController();