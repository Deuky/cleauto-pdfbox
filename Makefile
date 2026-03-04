java ?= $(shell type java > /dev/null || echo "install-java")
wget ?= $(shell type wget > /dev/null || echo "install-wget")
memory_space ?= 16
pdfbox_version ?= 3.0.6

ARG_CERTFILE ?= $(if $(wildcard $(CERTFILE)),-certFile $(CERTFILE)) 

configure: dependencies

build: pdfbox-app.jar

install: 

start:
	java -Xmx$(memory_space)m -jar pdfbox-app.jar $(COMMAND) $(ARG_CERTFILE) --input $(INPUT) --output $(OUTPUT) $(ARGS)

pdfbox-app.jar:
	wget https://archive.apache.org/dist/pdfbox/$(pdfbox_version)/pdfbox-app-$(pdfbox_version).jar -O $@

dependencies: $(java) $(wget)

install-%:
	echo "Please install $* to proceed with the build process."
