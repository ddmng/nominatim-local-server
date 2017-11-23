build-base:
	docker build -f 1.0/Dockerfile-base -t rdaneel/nominatim:base 1.0/

build-andorra:
	docker build -f 1.0/Dockerfile-andorra -t rdaneel/nominatim:andorra 1.0/

run-andorra:
	docker run --rm -d --name nominatim -p 8888:8080 rdaneel/nominatim:andorra
