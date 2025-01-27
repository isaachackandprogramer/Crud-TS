import { accountController } from "../controllers/user/account";
import { Router } from "express";

const router = Router()

router.post("/register", accountController.registerAccount)
router.post("/login", accountController.authController)
router.get("/getUsers", accountController.getUsers)

export {router}