FROM oven/bun:1

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
COPY ./bun.lock ./bun.lock
COPY ./turbo.json ./turbo.json

RUN bun install

RUN bun run db:generate

COPY ./apps/websocket ./apps/websocket
COPY ./packages/db  ./packages/db

EXPOSE 8081

CMD ["bun","run","start:websocket"]