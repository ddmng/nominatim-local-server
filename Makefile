build:
	docker build -t registry.mclab.lan:5000/p1/nominatim:italy 1.0/

run:
	docker run --rm -d --name nominatim -p 8888:8080 registry.mclab.lan:5000/p1/nominatim:italy
