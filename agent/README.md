## Naming Convention

Naming of jenkins-agent:

IMAGE:

  - jenkins-agent-with-***toolchain***

TAG:

 - ***jenkins-agent*** - ***os*** - ***toolchain-version***

Where:

- `toolchains`: toolchain name, e.g. docker, helm.
- `jenkins-agent` version dropping JDK version. In all cases, using JDK 11, until Jenkins in JDK 17 is officially release.
- `os`: `slim` for alpine, `debian` for debian.
- `toolchain-version`: toolchain version.