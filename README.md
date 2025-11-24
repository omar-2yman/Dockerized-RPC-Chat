# Dockerized RPC Chatroom (Go)

This assignment extends the simple **Go RPC chatroom** by packaging the server inside a **Docker container**, running it locally, testing it with the Go client, and finally publishing the Docker image on **Docker Hub**.

> **Docker Hub Image:**
> `https://hub.docker.com/r/omar2yman/rpc-chat-server`

---

## Features

### ✅ RPC Server

* Stores all chat messages **in-memory**.
* Exposes RPC methods:

  * `AddMessage` — adds a new message
  * `GetHistory` — returns the full chat history
* Runs inside a **Docker container** on port `1234`.

### ✅ RPC Client

* Connects to the server using `localhost:1234`
* Sends user messages
* Receives and prints the entire chat history
* Keeps running until terminated manually

---

## How to Run (Dockerized Server + Local Client)

### 1) Run the Server (Docker)

```bash
docker pull omar2yman/rpc-chat-server:v1
docker run --rm -p 1234:1234 omar2yman/rpc-chat-server:v1
```

The server listens on:

```text
localhost:1234
```

---

### 2) Run the Client (Go)

Open another terminal in the project folder:

```bash
go run client.go
```

Example interaction:

```text
Enter message: Hello
--- Chat History ---
You: Hello
--------------------
```

---

## Dockerfile (Used for This Assignment)

```dockerfile
FROM golang:1.22-alpine

WORKDIR /app

COPY server.go .

RUN go build -o server server.go

ENV CHAT_PORT=1234

EXPOSE 1234

CMD ["./server"]
```

---

## Image Build and Publish

### 1) Build the image

```bash
docker build -t omar2yman/rpc-chat-server:v1 .
```

### 2) Login to Docker Hub

```bash
docker login
```

### 3) Push the image

```bash
docker push omar2yman/rpc-chat-server:v1
```
