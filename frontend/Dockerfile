##### WORKING DOCKERFILE. #######

FROM node:12.18.3

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]

RUN npm install --production
RUN npx browserslist@latest --update-db

COPY . .

EXPOSE 3000

CMD ["npm", "start"]


