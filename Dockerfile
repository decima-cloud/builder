# Stage 1: Build stage
FROM ubuntu as builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    gnupg \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    jq \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "amd64" ]; then \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    elif [ "$ARCH" = "arm64" ]; then \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
    else \
    echo "Unsupported architecture: $ARCH"; exit 1; \
    fi && \
    unzip awscliv2.zip && \
    ./aws/install

# Install gcloud CLI
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update && apt-get install -y google-cloud-sdk

# Install HashiCorp Vault
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update && apt-get install -y vault

# Bug found here -> https://github.com/hashicorp/vault/issues/10924
RUN setcap -r /usr/bin/vault

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install programming languages
RUN apt-get update --fix-missing && apt-get install -y \
    openjdk-11-jdk \
    openjdk-11-jre-headless \
    golang-go \
    python3 \
    python3-pip \
    nodejs \
    npm \
    ruby \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set python3 as default python
RUN export python=python3 && export pip=pip3

# Set PATH for AWS CLI and Rust
ENV PATH="/usr/local/aws-cli/v2/current/bin:$PATH"
ENV PATH="/root/.cargo/bin:$PATH"

# Verify installations
RUN aws --version \
    && gcloud --version \
    && vault --version \
    && az --version \
    && jq --version \
    && java -version \
    && go version \
    && python3 --version \
    && node --version \
    && npm --version \
    && ruby --version \
    && rustc --version

# Clean up unnecessary files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
