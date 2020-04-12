import Categoria from "../models/Categoria";

class CategoriaController {
    async listar(req, res) {
        const categorias = await Categoria.find();

        return res.json(categorias);
    }

    async obter(req, res) {
        const { id } = req.params;
        const categoria = await Categoria.findById(id);

        return res.json(categoria);
    }

    async inserir(req, res) {
        const { body } = req;

        const categoria = await Categoria.create(body);

        return res.json({
            data: categoria
        });
    }

    async editar(req, res) {
        const { id } = req.params;
        const { body } = req;

        const categoria = await Categoria.findByIdAndUpdate(id, body, {
            new: true
        });

        return res.json(categoria);
    }

    async excluir(req, res) {
        const { id } = req.params;

        await Categoria.findByIdAndDelete(id);

        return res.send();
    }
}

export default new CategoriaController();
