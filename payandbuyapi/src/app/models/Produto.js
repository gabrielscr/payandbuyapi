import { Schema, model } from "mongoose";

const ProdutoSchema = new Schema({
    nome: {
        required: true,
        type: String
    },
    descricaoCurta: {
        required: true,
        type: String
    },
    descricaoLonga: {
        required: true,
        type: String
    },
    valor: {
        required: true,
        type: String
    },
    valorPromocao: {
        type: String
    },
    banner: {
        required: true,
        type: String
    },
    disponivel: {
        type: Boolean
    },
    promocao: {
        type: Boolean
    },
    fotos: [{
        type: String
    }],
    quantidade: {
        type: Number
    },
    criadoEm: {
        type: Date,
        default: Date.now
    }
});

export default model("Produto", ProdutoSchema);
