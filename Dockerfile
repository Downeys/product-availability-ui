# stage1 as builder
FROM node:10-alpine as builder
WORKDIR /app-ui
# copy the package.json to install dependencies
COPY . /app-ui
# Install the dependencies and make the folder
RUN npm install
# Build the project and copy the files
RUN npm run build

FROM nginx:alpine
# Copy from the stage 1
COPY --from=builder /app-ui/build /usr/share/nginx/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
