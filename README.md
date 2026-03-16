# Docker Run Action

A GitHub Action for running commands inside Docker containers as part of your workflow. This is a Tenstorrent fork of [addnab/docker-run-action](https://github.com/addnab/docker-run-action).

## Overview

This action enables you to:
- Run specific workflow steps inside a Docker container
- Execute commands in images built by previous workflow steps
- Use private Docker images with authentication
- Customize the shell and execution environment

This fork uses an Ubuntu-based Docker environment (instead of Alpine) to better support Tenstorrent's infrastructure and tooling requirements.

## Getting Started

Add this action to your GitHub workflow:

```yaml
- name: Run command in Docker
  uses: tenstorrent/docker-run-action@v3
  with:
    image: ubuntu:22.04
    run: echo "Hello from Docker!"
```

## Usage

### Basic Example

```yaml
- name: Checkout code
  uses: actions/checkout@v4
  
- name: Run in Docker
  uses: tenstorrent/docker-run-action@v3
  with:
    image: ubuntu:22.04
    run: |
      echo "Running inside container"
      ls -la
```

### Run a Privately-Owned Image

```yaml
- uses: tenstorrent/docker-run-action@v3
  with:
    username: ${{ secrets.DOCKER_USERNAME }}
    password: ${{ secrets.DOCKER_PASSWORD }}
    registry: gcr.io
    image: private-image:latest
    run: echo "hello world"
```

### Run an Image Built by a Previous Step

```yaml
- name: Build Docker image
  uses: docker/build-push-action@v6
  with:
    tags: test-image:latest
    push: false
    
- name: Run the built image
  uses: tenstorrent/docker-run-action@v3
  with:
    image: test-image:latest
    run: echo "hello world"
```

### Mount Workspace and Use Environment Variables

```yaml
- name: Checkout 
  uses: actions/checkout@v4 # Required to mount the GitHub Workspace
  
- name: Run with mounted volume
  uses: tenstorrent/docker-run-action@v3
  with:
    username: ${{ secrets.DOCKER_USERNAME }}
    password: ${{ secrets.DOCKER_PASSWORD }}
    registry: gcr.io
    image: my-image:latest
    options: -v ${{ github.workspace }}:/work -e MY_VAR=123
    run: |
      echo "Running Script"
      /work/run-script.sh
```

### Use a Specific Shell

By default, commands run in `sh`. You can specify a different shell (must be installed in the container):

```yaml
- uses: tenstorrent/docker-run-action@v3
  with:
    image: ubuntu:22.04
    shell: bash
    run: |
      echo "first line"
      echo "second line"
```

## Options

For all available input options, see [action.yml](action.yml).

Common inputs:

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `image` | Docker image name | Yes | - |
| `run` | Commands to execute | Yes | - |
| `shell` | Shell to use for execution | No | `sh` |
| `registry` | Docker registry URL | No | Docker Hub |
| `username` | Registry username | No | - |
| `password` | Registry password | No | - |
| `options` | Additional docker run options | No | - |

## Tenstorrent Modifications

This fork includes the following changes from the upstream [addnab/docker-run-action](https://github.com/addnab/docker-run-action):

### Base Image Change
- **Original:** Alpine-based Docker image (`docker:20.10`)
- **Modified:** Ubuntu-based image (`mirror.gcr.io/ubuntu:22.04`)
- **Reason:** Better compatibility with Tenstorrent infrastructure and tooling, avoiding Docker Hub rate limits

### Package Management
- **Original:** Alpine package manager (`apk`)
- **Modified:** Debian/Ubuntu package manager (`apt`)

### Command Handling
- Modified entrypoint script to handle multiline commands using intermediate file processing

These modifications maintain compatibility with the original action's interface while providing enhanced reliability for Tenstorrent's use cases.

## Requirements

- GitHub Actions environment
- Docker support in the GitHub runner (available in `ubuntu-latest` and other standard runners)

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details on:
- Reporting bugs
- Suggesting features
- Submitting pull requests

Pull requests are reviewed weekly. For bugs and feature requests, please use [GitHub Issues](https://github.com/tenstorrent/docker-run-action/issues).

## License

This project has dual licensing:

- **Original code:** Licensed under the MIT License by Abdud Dayan Adeeb. See [LICENSE](LICENSE) file for full text.
- **Tenstorrent modifications ONLY:** Licensed under the Apache License 2.0. See [LICENSE-APACHE-2.0](LICENSE-APACHE-2.0) file for full text and [NOTICE](NOTICE) file for details on what constitutes Tenstorrent modifications.

For additional information about the Apache 2.0 license and its application to Tenstorrent modifications, see [LICENSE_understanding.txt](LICENSE_understanding.txt).

### Upstream Project

This is a fork of [addnab/docker-run-action](https://github.com/addnab/docker-run-action). We are grateful to Abdud Dayan Adeeb for creating and maintaining the original project.
