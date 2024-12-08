FROM codercom/code-server:latest

#RUN curl -L https://foundry.paradigm.xyz | bash &&  bash source /home/coder/.bashrc && bash foundryup

USER root
# Update the package lists
RUN apt-get update -y && apt-get install -y \
    curl \
    git \
    unzip \
    wget \
    build-essential \
    libssl-dev \
    libgmp-dev \
    libz3-dev \
    python3 \
    python3-pip

USER coder
# Install Rust and Cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add Rust to the PATH
ENV PATH="/home/coder/.cargo/bin:$PATH"

# Install Foundry
RUN cargo install --git https://github.com/foundry-rs/foundry --profile release --locked forge cast chisel anvil
USER coder
