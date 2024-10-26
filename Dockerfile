FROM node:lts-alpine
ENV NODE_ENV=production
ENV MONGO_URI=mongodb+srv://aliyaghini:JDrVufhfcVpekQYs@cluster0test.pt7tw.mongodb.net/
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
