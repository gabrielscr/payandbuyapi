import Task from "../models/Task";

class TaskController {
  async index(req, res) {
    const tasks = await Task.find();

    return res.json(tasks);
  }

  async show(req, res) {
    const { id } = req.params;
    const task = await Task.findById(id);

    return res.json(task);
  }

  async store(req, res) {
    const { body } = req;
    const task = await Task.create(body);

    return res.json(task);
  }

  async update(req, res) {
    const { id } = req.params;
    const { body } = req;

    const task = await Task.findByIdAndUpdate(id, body, {
      new: true
    });

    return res.json(task);
  }

  async destroy(req, res) {
    const { id } = req.params;

    await Task.findByIdAndDelete(id);

    return res.send();
  }
}

export default new TaskController();
