# Dockerfile Best Practices

## Advanced Dockerfile Instructions

These are best practices that can help your Docker image more:
- secure
- maintainable
- easier to use

```sh
#Build stage
FROM python:3.9-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

#Final stage
FROM python:3.9-slim

#Create a non-root user
RUN useradd -m appuser

#Install curl for healthcheck
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Dynamically determine Python version and site-packages path
RUN PYTHON_VERSION=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")') && \
    SITE_PACKAGES_PATH="/home/appuser/.local/lib/python${PYTHON_VERSION}/site-packages" && \
    mkdir -p "${SITE_PACKAGES_PATH}" && \
    chown -R appuser:appuser /home/appuser/.local

# Copy site-packages and binaries using the variable
COPY --from=builder /root/.local/lib/python3.9/site-packages "${SITE_PACKAGES_PATH}"
COPY --from=builder /root/.local/bin /home/appuser/.local/bin
COPY app.py .

ENV PATH=/home/appuser/.local/bin:$PATH
ENV ENVIRONMENT=production

#Set the user to run the application
USER appuser

# User ENTRYPOINT with CMD
ENTRYPOINT ["python"]
CMD ["app.py"]

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/ || exit 1

ARG BUILD_VERSION
LABEL maintainer="Your Name <your.email@example.com>"
LABEL version=${BUILD_VERSION:-1.0}
LABEL description="Flask app demo with docker best practices"
```

### Breakdown of concepts:

- `RUN useradd -m appuser`: This creates a new user named `appuser` in the container Running applications as a non-root user is a security best practice. The `-m` flag creates a home directory for the user
- `RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*`: This installs the curl package which is needed for the HEALTHCHECK instruction to work. This also clean up the apt cache to reduce image size
- `RUN PYTHON_VERSION=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")') && ...`: This set of commands dynamically determines the Python version within the container and creates the correct `site-packages` directory for the `appuser`. It also sets the correct permissions for the user's local directory
- `COPY --from=builder /root/.local/lib/python3.9/site-packages "${SITE_PACKAGES_PATH}"`: This instruction copies the isntalled Python packages from the `builder` stage to the dynamically determined `site-packages` path within the final image, ensuring packages are placed in the correct location for the `appuser` to use.
- `COPY --from=builder /root/,local/bin/home/appuser/.local/bin`: This copies executable scripts installed by `pip` from the `builder` stage to the `appuser`'s local `bin` directory
- `ENTRYPOINT ["python"]` with `CMD ["app.py"]`: WHen used together, `ENTRYPOINT` defines the main executable container (in this case, `python`), and `CMD` provides the default arguments to that executable (`app.py`). 
    - This pattern allows for flexibility: users can run the container and execute `app.py` by default, or the can override the `CMD` to run other Python scripts or commands
- `HEALTHCHECK`: This instruction configures a health check for the container. Docker will periodically execute the specified command (`curl -f http://localhost:5000/`) to determine if the container is healthy. 
- `ARG BUILD_VERSION`: This defines a build argument named `BUILD_VERSION`. Build argument allows you to pass values into the Docker image at build time.
- `LABEL version="${BUILD_VerSION:-1.0}"`: This sets a label named `version` on the Docker image. It uses the `BUILD_VERSION` build argument. If `BUILD_VERSION` is provided during the build, its value will be used; otherwise. it defaults to `1.0`

