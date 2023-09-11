FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as runner
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# nginx does not need a start command

