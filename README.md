```yaml
project:
  name: mattermost
services:
  - hostname: pgdb
    type: postgresql@12
    mode: HA
    verticalAutoscaling:
      minVCpu: 1
      maxVCpu: 20
      minRam: 1
      maxRam: 32
      minDisk: 1
      maxDisk: 100
  - hostname: mattermost
    type: ubuntu@22.04
    envVariables:
      connectionString: postgres://${pgdb_user}:${pgdb_password}@${pgdb_hostname}:${pg_port}?sslmode=disable&connect_timeout=10&binary_parameters=yes
    ports:
      - port: 8065
        httpSupport: true
    verticalAutoscaling:
      minVCpu: 1
      maxVCpu: 20
      minRam: 0.25
      maxRam: 32
      minDisk: 1
      maxDisk: 100
    minContainers: 1
    maxContainers: 1
    buildFromGit: https://github.com/l-hellmann/mattermost@main
```