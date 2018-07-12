NAME=gap
REGISTRY=r.p.cailve.cn
TAG = latest

build:
	echo building ${NAME}:${TAG}
	docker build -t ${REGISTRY}/${NAME}:${TAG} .
	docker push "${REGISTRY}/${NAME}:${TAG}"
