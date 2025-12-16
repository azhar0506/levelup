# Multi-stage build

Multi-stage builds allow you to use multiple FROM statements in your Dockerfile. Useful for:
- creating smaller final images by copying only the necessary artifacts from one stage to another

## Docker file with multi-stage build example 1

```sh
# Build stage
FROM golang:1.14-alpine AS builder

WORKDIR /app 

COPY main.go .

RUN go build -o app

# Final Stage
FROM alpine

COPY --from=builder /app/app .

CMD ["./app"]

```

- `FROM golang:1.14-alpine AS builder`: Use Go image. The `AS build` give the stage a name so we can copy artifcats from it later
- `WORKDIR /app`: Sets the working directory inside the container for subsequent commands
- `COPY main.go .`: Brings the source code into the container
- `RUN go build -o app`: Compiles `main.go` and create a binary called app. `go build` will create an executable file `-o` specifies the output file name for the compiled binary
- `FROM alpine`: This is the second stage, this creates a minimal image with no Go tools
- `COPY --from=builder /app/app .`: Copies only from the compiled binary from the builder stage into the final image. 




## Docker file with multi-stage build example 2
```sh
# Build stage
FROM python:3.9-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.9-slim

WORKDIR /app

# Copy only the installed packages from the builder stage
COPY --from=builder /root/.local /root/.local
COPY app.py .

ENV PATH=/root/.local/bin:$PATH
ENV ENVIRONMENT=production

CMD ["python", "app.py"]

EXPOSE 5000

LABEL maintainer="Your Name <your.email@example.com>"
LABEL version="1.0"
LABEL description="Flask app demo with multi-stage build"
```

1. `Build Stage`
    - Python 3.9-slim image is our base image
    - Install python dependencies in this stage using `pip install --user`
        - This installs packages in the user's home directory.

2. `Final Stage`
    - Start with another Python 3.9-slim image.
    - Copy only the installed packages from the `builder` stagem specfically from `/root/.local` where `pip install --user` placed them
    - Copy to our application code
    - Add the local bin directory to the PATH so Python can find the installed packages.
    - We set up the rest of our container (ENV, CMD, EXPOSE, LABEL)


Q: Where does the first stage go? Surely it would be double the size rather than smaller?

A: 

1. builder stage: FROM python:3.9-slim AS builder
2. Final stage: FROM python:3.9-slim (without an AS name, making it the default last stage)

The First Stage (builder) is a Temporary Build Environment:

- The builder stage only exists during the image build process

