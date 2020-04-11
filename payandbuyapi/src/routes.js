import { Router } from "express";

import TaskController from "./app/controllers/TaskController";
import AuthController from "./app/controllers/AuthController";

const routes = Router();

/* Tasks */
routes.get("/tasks", TaskController.index);
routes.get("/tasks/:id", TaskController.show);
routes.post("/tasks/create", TaskController.store);
routes.put("/tasks/:id", TaskController.update);
routes.delete("/tasks/:id", TaskController.destroy);

/* User */
routes.post("/signin", AuthController.signin);
routes.post("/signup", AuthController.signup);
routes.get("/logout", AuthController.logout);

export default routes;
