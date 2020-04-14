import User from "../models/User";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";

class AuthController {

    async signup(req, res) {
        try {
            const { nome, cpf, email, senha } = req.body;

            const user = new User({
                nome,
                cpf,
                email,
                senha
            });

            const verificarSeExiste = await User.findOne({ email: req.body.email });

            const verificarSeExisteCpf = await User.findOne({ cpf: req.body.cpf });

            if (verificarSeExisteCpf) {
                return res.status(500).send("Usuário já cadastrado com esse CPF.");
            }

            if (verificarSeExiste) {
                return res.status(500).send("Usuário já cadastrado com esse e-mail.");
            }

            const salt = await bcrypt.genSalt(10);
            user.senha = await bcrypt.hash(senha, salt);

            await user.save();

            const token = jwt.sign({ id: user.id }, "mysecrettoken", {
                expiresIn: 60 * 60 * 24
            });

            res.json({ auth: true, token });

        } catch (e) {
            console.log(e);
            res.status(500).send('Ocorreu um problema.');
        }
    }

    async signin(req, res) {
        try {
            let user = await User.findOne({ email: req.body.email })

            if (!user) {
                return res.status(404).send('O e-mail não existe.');
            }

            let validPassword = await bcrypt.compare(req.body.senha, user.senha);

            if (!validPassword) {
                return res.status(401).send("Sua senha é inválida.");
            }

            let token = jwt.sign({ id: user._id }, "mysecrettoken", {
                expiresIn: '24h'
            });
            res.status(200).json({ auth: true, token });
        } catch (e) {

            res.status(500).send('Ocorreu um problema ao se logar.');
        }
    }

    logout(_req, res) {
        res.status(200).send({ auth: false, token: null });
    }
}

export default new AuthController();