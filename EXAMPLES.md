# findcmd - Practical Examples and Use Cases

This document provides detailed examples of how to use `findcmd` in real-world scenarios.

## Table of Contents

1. [Basic Examples](#basic-examples)
2. [Development Workflows](#development-workflows)
3. [DevOps and System Administration](#devops-and-system-administration)
4. [Database Operations](#database-operations)
5. [Docker and Containers](#docker-and-containers)
6. [Git Operations](#git-operations)
7. [Package Management](#package-management)
8. [Network and SSH](#network-and-ssh)
9. [Advanced Techniques](#advanced-techniques)

## Basic Examples

### Simple Search

Find all commands containing "redis":
```bash
$ findcmd redis

Found 8 command(s) matching: redis

[1] redis-cli -h localhost -p 6379
[2] docker run -d --name redis -p 6379:6379 redis
[3] redis-cli PING
[4] redis-cli SET mykey "Hello"
[5] redis-cli GET mykey
[6] redis-cli INFO
[7] docker exec -it redis redis-cli
[8] redis-cli FLUSHALL
```

### Multi-term Search

Find commands containing both "docker" AND "redis":
```bash
$ findcmd docker redis

Found 3 command(s) matching: docker redis

[1] docker run -d --name redis -p 6379:6379 redis
[2] docker exec -it redis redis-cli
[3] docker logs redis
```

### Case-Sensitive Search

Find exact case matches:
```bash
$ findcmd -c Redis

Found 1 command(s) matching: Redis

[1] docker run -d --name redis -p 6379:6379 redis:latest
```

### Limit Results

Show only the 5 most recent matches:
```bash
$ findcmd -n 5 npm

Found 5 command(s) matching: npm

[1] npm start
[2] npm run build
[3] npm test
[4] npm install express
[5] npm run dev
```

## Development Workflows

### Frontend Development

Find React/Vue/Angular commands:
```bash
# React development
findcmd react
findcmd npm start
findcmd create-react-app

# Vue.js
findcmd vue
findcmd npm run serve

# Angular
findcmd ng serve
findcmd ng generate
```

### Backend Development

Find Node.js/Python/Ruby commands:
```bash
# Node.js
findcmd node
findcmd express
findcmd nodemon

# Python
findcmd python
findcmd flask run
findcmd django

# Ruby
findcmd rails
findcmd bundle exec
```

### Testing Commands

```bash
# Find test commands
findcmd jest
findcmd pytest
findcmd npm test
findcmd -i mocha

# Find specific test files
findcmd test auth
findcmd test user
```

### Build and Deploy

```bash
# Build commands
findcmd npm run build
findcmd webpack
findcmd make

# Deploy commands
findcmd deploy
findcmd push production
findcmd vercel
```

## DevOps and System Administration

### Docker Commands

Find Docker commands:
```bash
# General Docker commands
$ findcmd docker

# Docker Compose
$ findcmd docker-compose

# Docker build commands
$ findcmd docker build

# Interactive selection of Docker commands
$ findcmd -i docker
```

Real-world example:
```bash
$ findcmd -i docker build

Found 12 command(s) matching: docker build

[1] docker build -t myapp:latest .
[2] docker build -t myapp:v1.0 --no-cache .
[3] docker build -f Dockerfile.prod -t myapp:prod .
[4] docker build --build-arg NODE_ENV=production -t myapp .
[5] docker build -t myapp . && docker run -p 8080:80 myapp

Enter number to copy to clipboard (or press Enter to cancel): 3
✓ Copied to clipboard: docker build -f Dockerfile.prod -t myapp:prod .
```

### Kubernetes

```bash
# Find kubectl commands
findcmd kubectl

# Specific Kubernetes operations
findcmd kubectl get pods
findcmd kubectl apply
findcmd kubectl logs
findcmd -i kubectl describe
```

### System Monitoring

```bash
# Find monitoring commands
findcmd htop
findcmd top
findcmd ps aux
findcmd netstat

# Find disk usage commands
findcmd df
findcmd du -h
findcmd ncdu
```

### Service Management

```bash
# Systemd
findcmd systemctl
findcmd systemctl status
findcmd systemctl restart

# Docker services
findcmd docker service
findcmd service
```

## Database Operations

### PostgreSQL

```bash
# Find PostgreSQL commands
$ findcmd psql

Found 7 command(s) matching: psql

[1] psql -U postgres -d mydb
[2] psql -h localhost -U admin -d production
[3] psql mydb < backup.sql
[4] pg_dump mydb > backup.sql
[5] psql -c "SELECT * FROM users;"
[6] psql -U postgres -c "\l"
[7] psql -f schema.sql
```

### MySQL/MariaDB

```bash
# Find MySQL commands
findcmd mysql
findcmd mysqldump
findcmd -i "mysql -u"

# Specific operations
findcmd mysql CREATE
findcmd mysql backup
```

### MongoDB

```bash
# Find MongoDB commands
findcmd mongo
findcmd mongodump
findcmd mongorestore
findcmd -i "db."
```

### Redis

```bash
# Find Redis commands
$ findcmd -i redis-cli

Found 10 command(s) matching: redis-cli

[1] redis-cli PING
[2] redis-cli SET session:123 "data"
[3] redis-cli GET session:123
[4] redis-cli KEYS "*"
[5] redis-cli FLUSHALL
[6] redis-cli -h production-redis -p 6379 -a password INFO
[7] redis-cli --scan --pattern "user:*"
[8] redis-cli MONITOR
[9] redis-cli INFO memory
[10] redis-cli CONFIG GET maxmemory

Enter number to copy to clipboard (or press Enter to cancel): 6
✓ Copied to clipboard: redis-cli -h production-redis -p 6379 -a password INFO
```

## Docker and Containers

### Container Management

```bash
# Find running containers
findcmd docker ps

# Find container logs
findcmd docker logs

# Find exec commands
findcmd -i docker exec

# Find container cleanup commands
findcmd docker rm
findcmd docker prune
```

### Docker Compose

```bash
# Find docker-compose commands
$ findcmd docker-compose

Found 9 command(s) matching: docker-compose

[1] docker-compose up -d
[2] docker-compose down
[3] docker-compose logs -f
[4] docker-compose ps
[5] docker-compose restart
[6] docker-compose build
[7] docker-compose exec web bash
[8] docker-compose -f docker-compose.prod.yml up
[9] docker-compose pull
```

### Image Management

```bash
# Find image commands
findcmd docker pull
findcmd docker push
findcmd docker tag
findcmd -i docker images
```

## Git Operations

### Basic Git Commands

```bash
# Find commit commands
$ findcmd git commit

Found 15 command(s) matching: git commit

[1] git commit -m "Add user authentication"
[2] git commit -am "Fix login bug"
[3] git commit --amend
[4] git commit -m "Update dependencies"
[5] git commit -m "Refactor database queries"
...
```

### Branch Operations

```bash
# Find branch commands
findcmd git branch
findcmd git checkout
findcmd -i "git checkout -b"

# Find merge commands
findcmd git merge
findcmd git rebase
```

### Remote Operations

```bash
# Find push/pull commands
findcmd git push
findcmd git pull
findcmd -i git fetch

# Find specific remote operations
findcmd git push origin
findcmd git pull upstream
```

### Advanced Git

```bash
# Find stash commands
findcmd git stash

# Find reset commands
findcmd git reset

# Find log and history
findcmd git log
findcmd git reflog

# Interactive selection
$ findcmd -i git rebase

Found 5 command(s) matching: git rebase

[1] git rebase main
[2] git rebase -i HEAD~3
[3] git rebase --continue
[4] git rebase --abort
[5] git rebase upstream/main

Enter number to copy to clipboard (or press Enter to cancel): 2
✓ Copied to clipboard: git rebase -i HEAD~3
```

## Package Management

### npm (Node.js)

```bash
# Find npm install commands
$ findcmd npm install

Found 20 command(s) matching: npm install

[1] npm install express
[2] npm install --save-dev jest
[3] npm install -g typescript
[4] npm install react react-dom
[5] npm install @types/node
[6] npm install axios dotenv
...

# Find npm scripts
findcmd npm run
findcmd npm start
findcmd npm test
```

### pip (Python)

```bash
# Find pip commands
findcmd pip install
findcmd -i pip3
findcmd pip freeze
findcmd pip list

# Virtual environments
findcmd venv
findcmd virtualenv
findcmd source venv
```

### yarn

```bash
# Find yarn commands
findcmd yarn add
findcmd yarn install
findcmd yarn start
findcmd -i yarn
```

### System Package Managers

```bash
# apt (Debian/Ubuntu)
findcmd apt install
findcmd apt update
findcmd sudo apt

# yum/dnf (RedHat/Fedora)
findcmd yum install
findcmd dnf install

# brew (macOS)
findcmd brew install
findcmd brew update
findcmd -i brew
```

## Network and SSH

### SSH Connections

```bash
# Find SSH commands
$ findcmd -i ssh

Found 12 command(s) matching: ssh

[1] ssh user@server.com
[2] ssh -i ~/.ssh/id_rsa admin@192.168.1.100
[3] ssh -p 2222 user@remote-server
[4] ssh -L 8080:localhost:80 user@server
[5] ssh -t server "sudo systemctl restart nginx"
[6] ssh-keygen -t rsa -b 4096
[7] ssh-copy-id user@server
...

Enter number to copy to clipboard (or press Enter to cancel): 2
✓ Copied to clipboard: ssh -i ~/.ssh/id_rsa admin@192.168.1.100
```

### SCP and File Transfer

```bash
# Find file transfer commands
findcmd scp
findcmd rsync
findcmd -i sftp

# Specific patterns
findcmd "scp .* @"
findcmd rsync -avz
```

### Network Diagnostics

```bash
# Find network commands
findcmd ping
findcmd curl
findcmd wget
findcmd netstat
findcmd ss
findcmd nmap
```

### API Testing

```bash
# Find curl commands
$ findcmd curl

Found 18 command(s) matching: curl

[1] curl http://localhost:3000/api/users
[2] curl -X POST -H "Content-Type: application/json" -d '{"user":"test"}' http://api.example.com
[3] curl -X GET https://api.github.com/users/username
[4] curl -I https://example.com
[5] curl -u username:password https://api.example.com
...
```

## Advanced Techniques

### Combining with Other Tools

Use `findcmd` with pipes and other commands:

```bash
# Count matching commands
$ findcmd docker | wc -l
45

# Save to file
$ findcmd git > my-git-commands.txt

# Search in results
$ findcmd docker | grep build

# Most recent 10, then search
$ findcmd -n 10 npm | grep install
```

### Creating Workflow Aliases

Add these to your `~/.bashrc` or `~/.zshrc`:

```bash
# Development aliases
alias fdev="findcmd -i npm"
alias ftest="findcmd -i test"
alias fbuild="findcmd -i build"

# Docker aliases
alias fdocker="findcmd -i docker"
alias fcompose="findcmd -i docker-compose"

# Git aliases
alias fgit="findcmd -i git"
alias fcommit="findcmd -i 'git commit'"
alias fpush="findcmd -i 'git push'"

# Database aliases
alias fdb="findcmd -i psql"
alias fredis="findcmd -i redis-cli"

# SSH alias
alias fssh="findcmd -i ssh"

# General interactive search
alias f="findcmd -i"
```

### Complex Searches

```bash
# Find commands with specific file extensions
findcmd ".py"
findcmd ".js"
findcmd ".yml"

# Find commands with specific paths
findcmd "/etc/"
findcmd "~/projects/"

# Find commands with flags
findcmd -- "-d"
findcmd -- "--verbose"

# Find long commands
findcmd | grep ".*{50,}"
```

### Workflow Examples

**Example 1: Deploying an Application**
```bash
# Find your last deployment command
$ findcmd -n 5 deploy

Found 5 command(s) matching: deploy

[1] npm run deploy:production
[2] ./deploy.sh production
[3] git push heroku main
[4] kubectl apply -f deployment.yml
[5] ansible-playbook deploy.yml

# Copy and run the correct one
```

**Example 2: Debugging Production Issues**
```bash
# Find your production SSH command
$ findcmd -i production

[1] ssh admin@production-server
[2] ssh -i prod-key.pem ec2-user@production
...

# Then find the logs command you used before
$ findcmd -i "tail -f"

[1] tail -f /var/log/application.log
[2] tail -f /var/log/nginx/error.log
...
```

**Example 3: Database Maintenance**
```bash
# Find your backup command
$ findcmd -i backup postgres

[1] pg_dump -U postgres mydb > backup_2024.sql
[2] pg_dump -U postgres -Fc mydb > backup.dump
...

# Find your restore command
$ findcmd -i restore postgres

[1] psql mydb < backup_2024.sql
[2] pg_restore -U postgres -d mydb backup.dump
...
```

## Pro Tips

1. **Use Interactive Mode Regularly**: The `-i` flag is your friend for quick command copying
   ```bash
   findcmd -i docker
   ```

2. **Limit Results for Speed**: Use `-n` when you only need recent commands
   ```bash
   findcmd -n 10 git commit
   ```

3. **Multiple Terms for Precision**: Combine terms to narrow down results
   ```bash
   findcmd docker nginx production
   ```

4. **Create Shell Functions**: Make complex searches easier
   ```bash
   # Add to ~/.bashrc or ~/.zshrc
   function flast() {
       findcmd -n 20 -i "$@"
   }

   # Usage: flast docker
   ```

5. **Use with History Settings**: Increase your history size for better results
   ```bash
   # In ~/.bashrc
   export HISTSIZE=10000
   export HISTFILESIZE=20000
   ```

---

**Need more help?** Check out the main [README.md](README.md) for installation and configuration details.
