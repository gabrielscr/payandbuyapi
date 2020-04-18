import Favorito from "../models/Favorito";

class FavoritoController {
    async listar(_req, res) {
        const favoritos = await Favorito.find();

        return res.json(favoritos);
    }

    async obter(req, res) {
        console.log(req.params);
        const { id } = req.params;
        const favorito = await Favorito.findById(id);

        return res.json(favorito);
    }

    async inserir(req, res) {
        const { body } = req;

        const favorito = await Favorito.create(body);

        return res.json({
            data: favorito
        });
    }

    async editar(req, res) {
        const { id } = req.params;
        const { body } = req;

        const favorito = await Favorito.findByIdAndUpdate(id, body, {
            new: true
        });

        return res.json(favorito);
    }

    async excluir(req, res) {
        const { id } = req.params;

        await Favorito.findByIdAndDelete(id);

        return res.send();
    }
}

export default new FavoritoController();