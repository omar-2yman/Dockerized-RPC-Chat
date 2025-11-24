# 1. Use a lightweight base image containing Go
FROM golang:alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy go.mod and source code files
COPY go.mod ./
COPY server.go ./
# We don't strictly need client.go on the server image, but copying all .go files is fine
COPY *.go ./

# 4. Build the Go application
# We are building the server specifically
RUN go build -o server server.go

# 5. Expose the port the app runs on
EXPOSE 12345

# 6. Command to run the executable
CMD ["./server"]