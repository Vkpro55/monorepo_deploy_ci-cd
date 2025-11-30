# provuide a base image -> OS + bun + nodejs runtime
FROM oven/bun:1

WORKDIR /user/src/app

# COPY ./ ... in your Dockerfile copies from the build context, not from the folder where the Dockerfile lives (unless that folder is the build context).
COPY package.json bun.lock turbo.json ./

# Copy ONLY workspace package.json files for caching
COPY apps/websocket/package.json ./apps/websocket/package.json
COPY packages ./packages

RUN bun install
RUN bun run db:generate

COPY  /apps/websocket ./apps/websocket

EXPOSE 8081

CMD ["bun", "run", "start:websocket"]