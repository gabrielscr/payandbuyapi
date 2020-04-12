import { Router } from "express";

import TaskController from "./app/controllers/TaskController";
import AuthController from "./app/controllers/AuthController";
import CategoriaController from "./app/controllers/CategoriaController";

const routes = Router();

/* Tasks */
routes.get("/tasks", TaskController.index);
routes.get("/tasks/:id", TaskController.show);
routes.post("/tasks/create", TaskController.store);
routes.put("/tasks/:id", TaskController.update);
routes.delete("/tasks/:id", TaskController.destroy);

/* User */
routes.post("/logar", AuthController.signin);
routes.post("/criarConta", AuthController.signup);
routes.get("/logout", AuthController.logout);

/* Categorias */
routes.get("/categorias", CategoriaController.listar);
routes.get("/categoria/:id", CategoriaController.obter);
routes.post("/categoria/inserir", CategoriaController.inserir);
routes.put("/categoria/editar/:id", CategoriaController.editar);
routes.delete("/categoria/excluir/:id", CategoriaController.excluir);

export default routes;
