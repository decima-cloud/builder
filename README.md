# Builder

Builder is a base Dockerfile designed to streamline the development process by providing a pre-configured environment with commonly used tools and programming languages. This Dockerfile is intended for the community to help get things done faster and more efficiently.

## Features

One of the best/worst feature of this project is that the images are rebuilt every day at midnight so they will always have security patches built in.

- **Multi-architecture support**: Supports both `amd64` and `arm64` architectures.
- **Pre-installed tools**:
  - AWS CLI
  - Google Cloud SDK (gcloud CLI)
  - Azure CLI
  - HashiCorp Vault
  - jq
- **Pre-installed programming languages**:
  - Java (OpenJDK 11)
  - Go
  - Python 3
  - Node.js and npm
  - Ruby
  - Rust
- **Optimized for size**: Uses multi-stage builds to minimize the final image size.

## Supported Platforms

You would download this by doing something like `docker pull ghcr.io/decima-cloud/builder:macOS-amd64`. where the tag could be any supported platform
Builder supports the following platforms:

- **macOS**:
  - amd64
  - arm64
- **Windows**:
  - amd64
  - arm64
- **Linux**:
  - amd64
  - arm64
  - arm64-v8

### Building the Docker Image Locally

To build the Docker image, run the following command:

```sh
docker build -t builder:latest .
```

## Customization

If you need to customize the Dockerfile to include additional tools or dependencies, you can modify the `Dockerfile` directly. Here are some common customizations:

### Adding New Tools

To add a new tool, you can include the installation commands in the build stage of the Dockerfile. For example, to add `wget`, you can modify the `Dockerfile` as follows:

```dockerfile
# Install wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
```

### Adding New Programming Languages

To add a new programming language, you can include the installation commands in the build stage of the Dockerfile. For example, to add Ruby, you can modify the `Dockerfile` as follows(this is just an example ruby is installed already):

```dockerfile
# Install Ruby
RUN apt-get update && apt-get install -y ruby && rm -rf /var/lib/apt/lists/*
```

## Contributing

We welcome contributions from the community! If you have any improvements or new features to add, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them with a descriptive message.
4. Push your changes to your forked repository.
5. Create a pull request to the main repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgements

We would like to thank the open-source community for their contributions and support.

## Contact

If you have any questions or need further assistance, please open an issue in the repository or contact the maintainers.
