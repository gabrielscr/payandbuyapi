import { Schema, model } from "mongoose";

const TaskSchema = new Schema({
  name: {
    type: String
  },
  createdAt: {
    type: Date,
    default: Date.now
  }
});

export default model("Task", TaskSchema);
