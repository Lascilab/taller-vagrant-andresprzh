sudo apt update
sudo apt install haproxy=1.6.\* -y
sudo bash -c 'echo "ENABLED=1" > /etc/default/haproxy'
sudo mv /etc/haproxy/haproxy.cfg{,.original}
sudo bash -c 'sudo echo "global
    log /dev/log   local0
    log 127.0.0.1   local1 notice
    stats socket /run/haproxy/admin.sock mode 660 level admin
    stats timeout 30s
    maxconn 4096
    user haproxy
    group haproxy
    daemon

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    retries 3
    option redispatch
    maxconn 2000
    timeout connect 5000
    timeout client  50000
    timeout server  50000

listen webfarm
bind 0.0.0.0:80
    mode http
    stats enable
    stats uri /haproxy?stats
    balance roundrobin
    option httpclose
    option forwardfor
    server web01 192.168.200.3:80 check
    server web02 192.168.200.4:80 check" > /etc/haproxy/haproxy.cfg'
sudo service haproxy restart