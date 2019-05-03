# Docker-Compose + VSCode Remote Development

This application is pretty much a default Rails app. It has a single scaffold to show it works with a database, otherwise the intention is that it runs in Docker Compose and is setup for VSCode.

## How to Run?


### 1) Setup VS Code

Open up folder in VSCode (currently need insiders edition!) with your project

a) Make sure you have the Remote Development plugin installed (https://code.visualstudio.com/blogs/2019/05/02/remote-development#_get-started)
b) Make sure you have the Docker plugin (https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker)

### 2) Start Docker Compose

i) Run `docker-compose -f .devcontainer/docker-compose.yml build`
ii)  Run `docker-compose -f .devcontainer/docker-compose.yml up`

### 3) Start up the connection

VSCode can automatically handle things if the folder you open has a `devcontainer.json` or `.devcontainer/devcontainer.json`. It can handle `docker-compose` too, which is setup in this demo.

Open up the folder, then open the Docker extension. Right click on the web container, and click "Attach Visual Studio Code".

<img width="477" alt="image" src="https://user-images.githubusercontent.com/3074765/57165178-5ba3f480-6dc4-11e9-810c-78d5a5425b81.png"> 

### 4) Use the terminal integrated in vscode like it was a locally running thing

### 5) Open https://localhost:3000

This might take 20-30 seconds to boot.

![VSCode and Docker Compose Running](https://user-images.githubusercontent.com/3074765/57165728-f224e580-6dc5-11e9-8489-1ae602dc7196.png)

## Protip

Add this snippet to your ~/.bash_profile (or zsh, etc) to automatically enable a `COMPOSE_FILE` variable, so you don't need to specify the `-f ...` option on the `docker-compose` commands.

```bash
docker_compose() {
  if [[ -f ".devcontainer/docker-compose.yml" ]] && [[ ! -f "docker-compose.yml" ]]; then
    export COMPOSE_FILE=".devcontainer/docker-compose.yml"
  else
    unset COMPOSE_FILE
  fi
}
trap 'docker_compose' DEBUG
```
