build:
	docker build -t maxxx00m/uptime-kuma-wireguard:latest .

push:
	docker push maxxx00m/uptime-kuma-wireguard:latest

release: build push