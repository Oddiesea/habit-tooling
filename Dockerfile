FROM oven/bun
WORKDIR /app
COPY package.json package.json
COPY src src
COPY bun.lockb bunlockb

RUN bun build ./src/index.ts --outdir ./build --target bun --minify

RUN bun install
EXPOSE 8080
CMD ["bun", "src/index.ts"]

# ---- Base Node ----
FROM oven/bun AS base
# set working directory
WORKDIR /app
# copy project files
COPY package.json package.json
COPY src src
COPY bun.lockb bunlockb

# ---- Dependencies ----
FROM base AS build
RUN bun install
RUN bun run transpile

# Copy compiled ts dist and configure run command
FROM oven/bun AS prod
COPY --from=build /app/src/* .
EXPOSE 8080
CMD ["bun","index.js"]