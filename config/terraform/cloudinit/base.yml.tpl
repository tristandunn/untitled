package_update: true
package_upgrade: true

timezone: America/New_York

packages:
  - ca-certificates
  - curl
  - docker.io
  - git
  - vim

users:
  - default

runcmd:
  - "curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash"
