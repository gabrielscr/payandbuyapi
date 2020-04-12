import { Schema, model } from "mongoose";

const CategoriaSchema = new Schema({
    descricao: {
        required: true,
        type: String
    },
    foto: {
        type: String
    },
    criadoEm: {
        type: Date,
        default: Date.now
    }
});

export default model("Categoria", CategoriaSchema);
