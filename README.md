# Zerops x Mattermost
[Mattermost](https://mattermost.com/) is self-hosted communication platform. [Zerops](https://zerops.io) makes it easy to deploy Mattermost.

### Prerequisites
- Zerops account - [sign up here](https://app.zerops.io/registration) with up to $65 free credit

### Deploy your Mattermost to Zerops
Locate "Import project" in the menu in the top left corner and paste in following yaml:

```yaml
project:
  name: mattermost
services:
  - hostname: pgdb
    type: postgresql@12
    mode: HA
    priority: 10

  - hostname: s3
    type: object-storage
    objectStoragePolicy: private
    objectStorageSize: 2 #GB
    priority: 10

  - hostname: backend
    type: ubuntu@22.04
    minContainers: 1
    maxContainers: 1
    buildFromGit: https://github.com/l-hellmann/mattermost-zerops@main
    enableSubdomainAccess: true
    priority: 1
```