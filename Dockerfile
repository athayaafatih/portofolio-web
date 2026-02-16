FROM node:18 AS build
WORKDIR /app

# Copy package.json & package-lock.json
COPY astrogon/package*.json ./

RUN npm install

# Copy semua source code
COPY astrogon/. .

RUN npm run build

FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

