#Підготовка нової гілки
$ git checkout -b GL
$ git tag git_hook
$ git push origin git_hook
$ git push --set-upstream origin GL

#Установка gitleaks
$ cd ~
$ git clone https://github.com/gitleaks/gitleaks.git
$ cd gitleaks
$ make build
$ cp gitleaks /usr/local/bin
$ gitleaks detect --source . --log-opts="--all"

#Установка пакета pre-commit
$ sudo apt-get install pre-commit
$ pre-commit --version
$ touch .pre-commit-config.yaml
$ pre-commit install

#Add a pre-commit configuration
create a file named .pre-commit-config.yaml
you can generate a very basic configuration using pre-commit sample-config
