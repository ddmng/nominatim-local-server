build:
	docker build -t registry.mclab.lan:5000/p1/nominatim:italy .

run:
	docker run --rm -d --name nominatim -p 8888:8080 registry.mclab.lan:5000/p1/nominatim:italy
