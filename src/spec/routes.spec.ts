import { expect, describe, it, test } from "bun:test";
import { app } from "../"



describe('GET /', () => {
    it('returns correct response', async () => {
        const response = await app.handle(
            new Request('http://localhost/')
        ).then(res => res.text())

        expect(response).toBe('Hello World')
    })
})