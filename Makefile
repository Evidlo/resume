.ONESHELL:
.SILENT:
SHELL := /bin/bash
# .SHELLFLAGS := -ec

TEX_SOURCE := resume.html

all:

	# evince $(shell basename ${TEX_SOURCE} .html).pdf &

	while true;
	do
		inotifywait -e modify *
		weasyprint ${TEX_SOURCE} $(shell basename ${TEX_SOURCE} .html).pdf
	done

clean:

	rm ${TEX_SOURCE}.pdf
