This Repo created to run pipelines where docker container needed.


There are 2 options:

## Docker-compose

This option tested on WSL2<br />

The Docker Compose file sets up a Jenkins server.<br />
It uses the jenkinsci/blueocean image to create a Jenkins container, and exposes ports 8080 and 50000.<br />
It then mounts two volumes:
- jenkins_data 
- and the local Jenkinsfile 
and sets two environment variables. Sets the user to root.

## Dockerfile


install and configure a Jenkins server with the Blue Ocean plugin. It first copies a Jenkinsfile from the jenkinsci/blueocean repository into the jenkins_home directory. Then, it updates and installs several packages, such as apt-transport-https, ca-certificates, curl, gnupg2, and software-properties-common. Next, it adds the Docker repository to the apt sources list and installs Docker CE. Finally, it adds the jenkins user to the docker group and sets environment variables for Java options and Jenkins plugins. It also exposes ports 8080 and 50000 for communication with other services. Finally, it runs the Jenkins startup script to start up the server.

**You can build the image using the following command:**

```
docker build -t myjenkins .
```

This will create an image with the name `myjenkins`

You can then run a container from the newly created image by running

```
docker run -p 8080:8080 -p 50000:50000 myjenkins
```

## Jenkinsfile with docker-compose

Once you have the Jenkinsfile located in the correct place and the pipeline configured to use it. You will be able to use the Jenkinsfile in Jenkins by creating a new pipeline project. Here are the steps to create a new pipeline project in Jenkins and use the Jenkinsfile:

    Log in to Jenkins and navigate to the Jenkins homepage.

    Click on the "New Item" link on the left sidebar.

    Enter a name for your new pipeline project and select "Pipeline" as the project type.

    In the "Pipeline" section, select "Pipeline script from SCM" as the "Definition" option.

    In the "SCM" section, select the appropriate source control management (SCM) system for your project. If your Jenkinsfile is located in the same repo as your code, you can select the same SCM you are using for your code.

    In the "Repository URL" field, enter the URL of the repository that contains your Jenkinsfile.

    In the "Script Path" field, enter the path to your Jenkinsfile. If you are using a relative path, you should use "Jenkinsfile" as the script path.

    Click the "Save" button to create the pipeline project.

    Once the pipeline project is created, you can navigate to the project's page and click on the "Build Now" button to run the pipeline.

    You can check the build's progress and logs by clicking on the build number in the "Build History" section.

Please note that if you have any issues, you can check the Jenkins logs for additional information about what went wrong.

It's also important to note that Jenkins also allows you to define the Jenkinsfile directly in the pipeline configuration, this can be done by selecting the "Pipeline script" option instead of "Pipeline script from SCM" in the pipeline configuration.