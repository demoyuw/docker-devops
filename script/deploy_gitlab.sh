sudo docker run -e GITLAB_OMNIBUS_CONFIG="external_url 'http://$1';prometheus_monitoring['enable'] = false;gitlab_kas['enable'] = true;" -d -p 443:443 -p 80:80 -p 10022:22 --name gitlab --restart always -v $HOME/gitlab/config:/etc/gitlab -v $HOME/gitlab/logs:/var/log/gitlab -v $HOME/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:17.10.1-ce.0

