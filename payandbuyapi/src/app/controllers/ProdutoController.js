import Produto from "../models/Produto";

class ProdutoController {
    async listar(req, res) {
        const produtos = await Produto.find();

        return res.json(produtos);
    }

    async obter(req, res) {
        console.log(req.params);
        const { id } = req.params;
        const produto = await Produto.findById(id);

        return res.json(produto);
    }

    async inserir(req, res) {
        const { body } = req;

        const produto = await Produto.create(body);

        return res.json({
            data: produto
        });
    }

    async editar(req, res) {
        const { id } = req.params;
        const { body } = req;

        const produto = await Produto.findByIdAndUpdate(id, body, {
            new: true
        });

        return res.json(produto);
    }

    async excluir(req, res) {
        const { id } = req.params;

        await Produto.findByIdAndDelete(id);

        return res.send();
    }
}

export default new ProdutoController();
