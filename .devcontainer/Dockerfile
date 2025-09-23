FROM mcr.microsoft.com/devcontainers/base:alpine-3.20

# Setzen der Umgebungsvariablen
ENV FIRELY_TERMINAL_VERSION=3.1.0
ENV JAVA_VALIDATOR_VERSION=6.0.11
ENV SUSHI_VERSION=3.8.0
ENV CLOUD_SDK_VERSION=464.0.0

# Google Cloud SDK herunterladen und installieren
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xf google-cloud-cli-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh --quiet && \
    rm google-cloud-cli-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

# Installieren der notwendige Tools
# Add Microsoft's .NET SDK repository and install .NET SDK
RUN wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 6.0 --install-dir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/local/bin \
    && rm dotnet-install.sh

# Install ICU libraries
RUN apk add --no-cache icu-libs

# Install Node.js and npm
RUN apk add --no-cache nodejs npm

# Install Java (OpenJDK)
RUN apk add --no-cache openjdk11

# Install py-pip
RUN apk add --no-cache py-pip py3-yaml pipx
RUN pipx ensurepath

# Install Firely Terminal as vscode user
# Switch to the vscode user
USER vscode

RUN pipx install gsutil
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# Install Firely Terminal
RUN dotnet tool install --global Firely.Terminal --version $FIRELY_TERMINAL_VERSION

# Add .NET tools to PATH for vscode user
ENV PATH="/home/vscode/.dotnet/tools:${PATH}"

# Switch back to root user to perform remaining installations
USER root

RUN npm install -g fsh-sushi@$SUSHI_VERSION

# Installieren der zusätzliche Abhängigkeiten
RUN apk update && apk add --no-cache jq findutils curl ca-certificates

# Setup for FHIR Validator
RUN mkdir -p /home/vscode/.fhir/validators/
RUN wget -q https://github.com/hapifhir/org.hl7.fhir.core/releases/download/$JAVA_VALIDATOR_VERSION/validator_cli.jar -O /home/vscode/.fhir/validators/validator_cli.jar

# Set ownership
RUN mkdir -p /home/vscode/.fhir/packages && \
    chown -R vscode:vscode /home/vscode/.fhir/packages

RUN mkdir -p /home/vscode/.fhir/settings/
COPY codfsh-config.yaml /home/vscode/.fhir/settings/codfsh-config.yaml

# Setup scripts
RUN mkdir /scripts
RUN curl -L https://raw.githubusercontent.com/gematik/fhir-scripts/refs/heads/main/scripts/fhir_scripts.sh -o /scripts/fhir_scripts.sh && chmod +x /scripts/fhir_scripts.sh

# Setzen des Arbeitsverzeichnis
WORKDIR /workspace

COPY . /workspace

CMD [ "/bin/bash" ]
