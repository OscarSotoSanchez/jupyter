NAME   := oscarsotosanchez/jupyter-notebook
TAG    ?= basic
IMG    := ${NAME}:${TAG}

build:
	@docker build -f "${TAG}/${TAG}.Dockerfile" -t ${IMG} ./${TAG}

push:
	@docker push ${IMG}

login:
	@docker login -u "${DOCKERHUB_USERNAME}" -p "${DOCKERHUB_PASS}"

run:
	$(eval NAME_CONTAINER ?= jupyter)
	$(eval NOTEBOOK_DIR ?= `pwd`)
	@docker run -d --rm --name "${NAME_CONTAINER}" -v "${NOTEBOOK_DIR}:/workdir/notebooks" -e "NOTEBOOK_SECRET=${NOTEBOOK_SECRET}" -p 8888:8888 ${IMG}
