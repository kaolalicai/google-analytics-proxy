FROM node:8-alpine as dependence
WORKDIR /app
RUN echo http://mirrors.aliyun.com/alpine/v3.4/main/ > /etc/apk/repositories && \
	echo http://mirrors.aliyun.com/alpine/v3.4/community/ >> /etc/apk/repositories

COPY package.json .
RUN npm install node-gyp -g --registry=https://registry.npm.taobao.org --build-from-source --disturl=https://npm.taobao.org/mirrors/node & \
	npm install --registry=https://registry.npm.taobao.org

FROM node:8-alpine as prod
WORKDIR /app
COPY --from=dependence /app/node_modules ./node_modules
COPY . .
EXPOSE 3001
CMD ["npm","start"]
