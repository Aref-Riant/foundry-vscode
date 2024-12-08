# foundry-vscode
VS Code and Foundry on single Docker image

# Build:
docker build -t foundry-vscode:latest .
* Approximate image dize: 3GB

# Use:

## Pull:
`docker pull docker.io/arefkh/foundry-vscode:latest`

## Run:
`docker run --rm -it -p 8080:8080 --name foundry-vscode arefkh/foundry-vscode:latest`

## Password:
`docker exec foundry-vscode cat /home/coder/.config/code-server/config.yaml | grep password`


** ToDo:
* make image smaller
