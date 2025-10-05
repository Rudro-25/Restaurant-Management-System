# Use an official Golang image as the base image
FROM golang:1.23-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the rest of the application code into the container
COPY . .

# Build the Go application
RUN go build -o main .

# Expose the port your app is running on (e.g., 8080)
EXPOSE 8080

# Run the application
CMD ["./main"]
