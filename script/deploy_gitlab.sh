#!/bin/bash

# 要求使用者輸入 VM 的外部 IP
read -p "請輸入您的 VM 外部 IP 位址: " VM_IP

# 檢查輸入是否為空
if [ -z "$VM_IP" ]; then
    echo "錯誤: 未輸入 IP 位址，部署中止。"
    exit 1
fi

echo "正在部署 GitLab Server (外部網址: http://$VM_IP)..."

# 執行 Docker 部署指令
sudo docker run -e GITLAB_OMNIBUS_CONFIG="external_url 'http://$VM_IP'; \
prometheus_monitoring['enable'] = false; \
gitlab_kas['enable'] = true;" \
-d -p 443:443 -p 80:80 -p 10022:22 \
--name gitlab \
--restart always \
-v $HOME/gitlab/config:/etc/gitlab \
-v $HOME/gitlab/logs:/var/log/gitlab \
-v $HOME/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce:17.10.1-ce.0

echo "部署指令已發送。請等待數分鐘讓 GitLab 容器完成初始化。"
echo "您可以透過 'docker logs -f gitlab' 查看啟動進度。"