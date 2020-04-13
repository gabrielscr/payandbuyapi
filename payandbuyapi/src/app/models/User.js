import { Schema, model } from "mongoose";
import bcrypt from "bcryptjs";

const UserSchema = new Schema({
    nome: {
        required: true,
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

UserSchema.methods.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
};

UserSchema.methods.validatePassword = function (password) {
    return bcrypt.compare(password, this.senha);
};

export default model("Usuario", UserSchema);
