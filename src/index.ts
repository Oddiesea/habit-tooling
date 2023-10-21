import { Elysia } from "elysia";

const port = 8080;

export const app = new Elysia()
    .get("/", () => "Hello World")
    .listen(port);

console.log(
    `🦊 Server is running at ${app.server?.hostname}:${app.server?.port}`
);