#!/bin/sh
docker-compose build m68k_base_service
docker-compose run m68k_rust_deps_service
docker-compose run m68k_rust_service
docker-compose run m68k_rust_test_service