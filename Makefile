.ONESHELL:
.SILENT:
SHELL := /bin/bash
# .SHELLFLAGS := -ec

SOURCE := resume.html
DEST := $(shell basename ${SOURCE} .html).pdf

.PHONY: ${DEST}
${DEST}:
	weasyprint ${SOURCE} $(shell basename ${SOURCE} .html).pdf

.PHONY: devserver
devserver:
	# evince $(shell basename ${SOURCE} .html).pdf &

	while true;
	do
		inotifywait -e modify *
		make ${DEST}
	done

clean:

	rm ${SOURCE}.pdf
