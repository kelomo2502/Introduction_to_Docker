# Introduction_to_Docker

## Getting started with docker

- Installing Docker
  We need to launch an ubuntu 20.04 LTS instance and connect to it, then follow the steps below.
  Before installing Docker Engine for the first time on a new host machine, it is necessary to configure the Docker repository. Following this setup, we can proceed to install and update Docker directly from the repository.

- run `sudo apt-get update`
  This a Linux command that refreshes the package list on a Debian-based system, ensuring the latest software information is available for installation.
- run `sudo apt-get install ca-certificates curl gnupg`
  This a Linux command that installs essential packages including certificate authorities, a data transfer tool (curl), and the GNU Privacy Guard for secure communication and package verification.
- run `sudo install -m 0755 -d /etc/apt/keyrings`
  The command above creates a directory (/etc/apt/keyrings) with specific permissions (0755) for storing keyring files, which are used for docker's authentication

- Run the following command to download the Docker GPG key:

  ```bash
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  ```

  This downloads the Docker GPG key using

`sudo chmod a+r /etc/apt/keyrings/docker.gpg`
 Sets read permissions for all users on the Docker GPG key file within the APT keyring directory

- Add repository to Apt sources

  ```bash
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  ```

- The "echo" command creates a Docker APT repository configuration entry for the Ubuntu system, incorporating the system architecture and Docker GPG key, and then "sudo tee /etc/apt/sources.list.d/docker.list &gt; /dev/null" writes this configuration to the "/etc/apt/sources.list.d/docker.list" file.
- run `sudo apt-get update`

  ```bash
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  ```

  Install latest version of docker
  `sudo systemctl status docker`

  Verify that docker has been successfully installed
- By default, after installing docker, it can only be run by root user or using
  `sudo usermod -aG docker ubuntu`
-Let's try run a docker command without the sudo
`docker run hello-world`

- Some very common docker commands include:
`docker ps`
 This command displays a list of running containers. This is useful for monitoring active containers and obtaining information such as container IDs, names, and status.
`docker ps -a`
To view all containers, including those that have stopped, add the
`docker stop`
 This command halts a running container.
`docker pull`
 This  command downloads a Docker image from a registry, such as Docker Hub, to your local machine.
`docker push <your-username/image-name>`
This  command uploads a local Docker image to a registry, making it available for others to pull.
`docker images`
This  command lists all locally available Docker images.
`docker rmi <image-name>`
This  command removes one or more images from the local machine.

These basic Docker commands provide a foundation for working with containers. Understanding how to run, list, stop, pull, push, and manage Docker images is crucial for effective containerization and orchestration. As you delve deeper into Docker, you'll discover additional commands and features that enhance your ability to develop, deploy, and maintain containerized applications.
