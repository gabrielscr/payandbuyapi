import Perfil from "../models/Perfil";

class PerfilController {
    async obter(req, res) {
        const { id } = req.params;
        const perfil = await Perfil.findById(id);

        return res.json(perfil);
    }

    async inserir(req, res) {
        const { body } = req;

        const perfil = await Perfil.create(body);

        return res.json({
            data: perfil
        });
    }

    async editar(req, res) {
        const { id } = req.params;
        const { body } = req;

        const perfil = await Perfil.findByIdAndUpdate(id, body, {
            new: true
        });

        return res.json(perfil);
    }
}

export default new PerfilController();
