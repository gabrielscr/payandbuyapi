import { Schema, model } from "mongoose";

const UserSchema = new Schema({
    nome: {
        required: true,
        type: String
    },
    foto: {
        type: String
    },
    cep: {
        type: String,
        maxlength: 8
    },
    cidade: {
        type: String
    },
    uf: {
        type: String,
        maxlength: 2
    },
    logradouro: {
        type: String
    },
    numero: {
        type: String
    },
    complemento: {
        type: String
    },
    bairro: {
        type: String
    },
    ddd: {
        type: String,
        maxlength: 2
    },
    celular: {
        type: String,
        maxlength: 9
    },
    dataNascimento: {
        type: String
    },
    cpf: {
        required: true,
        type: String
    },
    email: {
        type: String,
        required: true
    },
    senha: {
        type: String,
        required: true
    },
    criadoEm: {
        type: Date,
        default: Date.now
    }
});

export default model("Usuario", UserSchema);
