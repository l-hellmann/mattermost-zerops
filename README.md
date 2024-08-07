# Example import.yml
```yaml
project:
  name: mattermost-example
services:
  - hostname: pgdb
    type: postgresql@12
    mode: HA

  - hostname: s3
    type: object-storage
    objectStoragePolicy: public-write # debug
    objectStorageSize: 2

  - hostname: mattermost
    type: ubuntu@22.04
    minContainers: 1
    maxContainers: 1
    buildFromGit: https://github.com/l-hellmann/mattermost-zerops@main
    enableSubdomainAccess: true
```