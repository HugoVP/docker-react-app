FROM node:alpine AS build-phase
LABEL maintainer HugoVP dev@paleo.host
WORKDIR /app
COPY ./ ./
RUN npm install
RUN npm run build

FROM nginx AS run-phase
COPY --from=build-phase /app/build /usr/share/nginx/html