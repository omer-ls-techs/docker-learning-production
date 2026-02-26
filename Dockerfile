FROM node:lts-alpine3.22 AS builder
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx AS runner
COPY --from=builder /app/build /usr/share/nginx/html