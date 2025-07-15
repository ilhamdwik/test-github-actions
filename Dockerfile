
#FROM node:18-alpine AS builder

#WORKDIR /app

#COPY package*.json ./
#RUN npm install --production=false

#COPY . .
#RUN npm run build


#FROM node:18-alpine

#WORKDIR /app

#COPY --from=builder /app/package*.json ./
#RUN npm install --production

#COPY --from=builder /app/dist ./dist

#EXPOSE 3000

#CMD ["node", "dist/main"]


# Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
CMD ["node", "dist/main"]
