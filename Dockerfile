FROM node:12.14
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


# build will end up in /app/build

FROM nginx
# previous blocks all complete

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
# take build copy to nginx specified folder