Logical replication from PostgreSQL to PostgreSQL using Kafka Connectors

```
docker-compose up --build -d
curl -X POST -H 'Content-Type: application/json' http://localhost:8083/connectors -d @source.json
curl -X POST -H 'Content-Type: application/json' http://localhost:8083/connectors -d @sink.json
```

