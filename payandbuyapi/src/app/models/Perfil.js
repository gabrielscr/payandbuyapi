import { Schema, model } from "mongoose";

const PerfilSchema = new Schema({
    nome: {
        required: true,
        type: String
    },
    foto: {
        type: String
    },
    cep: {
        type: String,
        maxlength: 8,
        required: true
    },
    cidade: {
        type: String,
        required: true
    },
    uf: {
        type: String,
        maxlength: 2,
        required: true
    },
    logradouro: {
        type: String,
        required: true
    },
    numero: {
        type: String,
        required: true
    },
    complemento: {
        type: String,
        required: true
    },
    bairro: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    ddd: {
        type: String,
        required: true,
        maxlength: 2
    },
    celular: {
        type: String,
        required: true,
        maxlength: 9
    },
    dataNascimento: {
        type: Date,
        required: true,
        default: Date.now
    },
    criadoEm: {
        type: Date,
        default: Date.now
    }
});

export default model("Perfil", PerfilSchema);
