java ?= $(shell type -s java || echo "install-java")
wget ?= $(shell type -s wget || echo "install-wget")

configure: dependencies

build: pdfbox-app.jar

install: 

start:
	java -jar pdfbox-app.jar

pdfbox-app.jar:
	wget https://archive.apache.org/dist/pdfbox/3.0.6/pdfbox-app-3.0.6.jar -O $@

dependencies: $(java) $(wget)

install-%:
	echo "Please install $* to proceed with the build process."