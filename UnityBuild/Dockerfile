# Container image that runs your code
FROM alpine
#FROM gableroux/unity3d:2019.1.14f1

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["sh", "/entrypoint.sh"]
