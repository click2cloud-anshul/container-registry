FROM golang:alpine


# Move to working directory /build
WORKDIR /simplego
RUN apk add git
RUN go get -u github.com/gorilla/mux
ADD . /simplego
# Copy the code into the container
COPY . .

# Build the application
RUN go build -o main .

# Export necessary port
EXPOSE 12345

# Command to run when starting the container
CMD ["/simplego/main"]