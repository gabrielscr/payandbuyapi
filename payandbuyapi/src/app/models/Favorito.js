import { Schema, model } from "mongoose";

const FavoritoSchema = new Schema({
    nome: {
        required: true,
        type: String
    },
    valor: {
        required: true,
        type: String
    },
    banner: {
        required: true,
        type: String
    }
});

export default model("Favorito", FavoritoSchema);
