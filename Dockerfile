FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#copy the build from above into the nginx container
COPY --from=builder /app/build /usr/share/nginx/html
#nginx runs its own start command autmatically