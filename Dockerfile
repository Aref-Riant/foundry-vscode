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

RUN code-server --install-extension dbaeumer.vscode-eslint \
                && code-server --install-extension esbenp.prettier-vscode \
                && code-server --install-extension christian-kohler.npm-intellisense \
                && code-server --install-extension christian-kohler.path-intellisense \
                && code-server --install-extension CoenraadS.bracket-pair-colorizer \
                && code-server --install-extension davidanson.vscode-markdownlint \
                && code-server --install-extension donjayamanne.githistory \
                && code-server --install-extension eamodio.gitlens \
                && code-server --install-extension editorconfig.editorconfig \
                && code-server --install-extension eg2.vscode-npm-script \
                && code-server --install-extension esbenp.prettier-vscode \
                && code-server --install-extension foxundermoon.shell-format \
                && code-server --install-extension ibm.output-colorizer \
                && code-server --install-extension jebbs.plantuml \
                && code-server --install-extension joelday.docthis \
                && code-server --install-extension kisstkondoros.vscode-gutter-preview \
                && code-server --install-extension mikestead.dotenv \
                && code-server --install-extension monokai.theme-monokai-pro-vscode \
                && code-server --install-extension naumovs.color-highlight \
                && code-server --install-extension pkief.material-icon-theme \
                && code-server --install-extension tintinweb.solidity-metrics \
                && code-server --install-extension streetsidesoftware.code-spell-checker \
                && code-server --install-extension timonwong.shellcheck \
                && code-server --install-extension wayou.vscode-todo-highlight \
                && code-server --install-extension yzhang.markdown-all-in-one \
                && code-server --install-extension zhuangtongfa.Material-theme \
                && code-server --install-extension juanblanco.solidity
