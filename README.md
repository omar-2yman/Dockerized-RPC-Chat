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
