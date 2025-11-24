# Dockerized RPC Chatroom (Go)

This assignment extends the simple **Go RPC chatroom** by packaging the server inside a **Docker container**, running it locally, testing it with the Go client, and finally publishing the Docker image on **Docker Hub**.

> **Docker Hub Image:** > [https://hub.docker.com/r/omar2yman/rpc-chat-server](https://hub.docker.com/r/omar2yman/rpc-chat-server)

---

## Features

### ✅ RPC Server
- Stores all chat messages **in-memory** using a thread-safe slice.
- Exposes RPC methods:
  - `SendMessage` — Receives a message and returns the full history.
- Runs inside a **Docker container** on port `12345`.

### ✅ RPC Client
- Connects to the server via TCP on `localhost:12345`.
- Asks for the **user's name** upon joining.
- Sends formatted messages (Name: Message).
- Receives and displays the updated chat history.

---

## How to Run (Dockerized Server + Local Client)

### 1) Run the Server (Docker)

You don't need Go installed to run the server. Pull it directly from Docker Hub:

```bash
docker pull omar2yman/rpc-chat-server:v1
docker run -p 12345:12345 omar2yman/rpc-chat-server:v1
````

The server listens on:

```
localhost:12345
```

-----

### 2\) Run the Client (Go)

Open another terminal in the project folder to start the client:

```bash
go run client.go
```

**Example interaction:**

```text
Enter your name: Omar
Welcome Omar! You've joined the chat.

Enter message: Hello World!
--- Chat History ---
Omar: Hello World!
--------------------
```

-----

## Dockerfile (Used for This Assignment)

This is the configuration used to build the server image:

```dockerfile
# 1. Use a lightweight base image containing Go
FROM golang:alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy go.mod and source code files
COPY go.mod ./
COPY server.go ./
# Copying all go files is safe
COPY *.go ./

# 4. Build the Go application
RUN go build -o server server.go

# 5. Expose the port the app runs on
EXPOSE 12345

# 6. Command to run the executable
CMD ["./server"]
```

-----

## Image Build and Publish Steps

These are the commands used to create and push the image:

### 1\) Build the image

```bash
docker build -t rpc-chat-server .
```

### 2\) Tag the image

```bash
docker tag rpc-chat-server omar2yman/rpc-chat-server:v1
```

### 3\) Login to Docker Hub

```bash
docker login
```

### 4\) Push the image

```bash
docker push omar2yman/rpc-chat-server:v1
```
