FROM node:18 AS build
WORKDIR /app

# copy package dulu
COPY astrogon/ ./

RUN npm install
RUN npm run build


FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
