# Builder

Builder is a base Dockerfile designed to streamline the development process by providing a pre-configured environment with commonly used tools and programming languages. This Dockerfile is intended for the community to help get things done faster and more efficiently.

## Features

- **Multi-architecture support**: Supports both `amd64` and `arm64` architectures.
- **Pre-installed tools**:
  - AWS CLI
  - Google Cloud SDK (gcloud CLI)
  - HashiCorp Vault
  - jq
- **Pre-installed programming languages**:
  - Java (OpenJDK 11)
  - Go
  - Python 3
  - Node.js and npm
- **Optimized for size**: Uses multi-stage builds to minimize the final image size.

## Usage

### Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t builder:latest .
```

### Running the Docker Container

To run a container from the built image, use the following command:

```sh
docker run -it builder:latest
```

### Verifying Installed Tools

The Dockerfile includes a step to verify the installation of all tools and programming languages. You can run the following commands inside the container to check the versions:

```sh
aws --version
gcloud --version
vault --version
jq --version
java -version
go version
python3 --version
node --version
npm --version
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

To add a new programming language, you can include the installation commands in the build stage of the Dockerfile. For example, to add Ruby, you can modify the `Dockerfile` as follows:

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
