FROM node:lts-alpine3.10

WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

# finally we have /app/build <--- all the stuff

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

