MAJOR?=0
MINOR?=1

VERSION=$(MAJOR).$(MINOR)

APP_NAME = dw_op
HUB_NAMESPACE = drachenwald
IMAGE_NAME = ${APP_NAME}

#################################
# Docker targets
#################################
.PHONY: build

build:
	@docker build -t ${HUB_NAMESPACE}/${IMAGE_NAME}:${VERSION} -f ./Dockerfile .

