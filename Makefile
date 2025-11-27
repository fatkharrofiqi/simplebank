createdb:
	docker exec -it postgresdb createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgresdb dropdb simple_bank

migrateup:
	 migrate --path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose up 

migrateup1:
	 migrate --path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose up 1

migratedown:
	 migrate --path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose down

migratedown1:
	 migrate --path db/migration -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/fatkharrofiqi/simplebank/db/sqlc Store

.PHONY: createdb dropdb migrateup migratedown sqlc test server mock migratedown1 migrateup1
