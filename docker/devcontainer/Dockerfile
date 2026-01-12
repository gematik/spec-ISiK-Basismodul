FROM mcr.microsoft.com/devcontainers/base:alpine-3.20

# ENV CLOUD_SDK_VERSION=464.0.0
# ENV JAVA_VALIDATOR_VERSION=6.3.25

ARG TARGETPLATFORM

# Backup if a specific version will be needed again
# google-cloud-cli-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

# Download and install gCloud CLI
# This tries to use the architecture specific version
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
    curl -Lo google-cloud-cli-linux.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-arm.tar.gz; \
    elif [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
    curl -Lo google-cloud-cli-linux.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz; \
    else \
    curl -Lo google-cloud-cli-linux.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86.tar.gz; \
    fi \
    && tar -xf google-cloud-cli-linux.tar.gz \
    && ./google-cloud-sdk/install.sh --quiet \
    && rm google-cloud-cli-linux.tar.gz

RUN apk add --no-cache \
    # .NET SDK for Firely Terminal
    dotnet8-sdk \
    # icu-libs \
    # Node.js and NPM for FSH Sushi
    nodejs npm \
    # Java (OpenJDK) and Jeykll for IG Publisher
    openjdk17 jekyll \
    # Additional dependencies
    # jq findutils curl ca-certificates \
    # PlantUML
    graphviz fontconfig

# Switch to the vscode user
USER vscode

# Setup for FHIR Validator
RUN mkdir -p /home/vscode/.fhir/validators
RUN if [ -z ${JAVA_VALIDATOR_VERSION+x} ]; then \
    curl -Lo /home/vscode/.fhir/validators/validator_cli.jar https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar; \
    else \
    curl -Lo /home/vscode/.fhir/validators/validator_cli.jar https://github.com/hapifhir/org.hl7.fhir.core/releases/download/$JAVA_VALIDATOR_VERSION/validator_cli.jar; \
    fi

# Add gcloud to user path
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# Install UV for Python environments
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/home/vscode/.local/bin:${PATH}"

RUN uv tool install git+https://github.com/gematik/fhir-scripts.git

RUN fhirscripts install \
    --sushi \
    --firely-terminal

# Add Firely Terminal to user path
ENV PATH="/home/vscode/.dotnet/tools:${PATH}"
