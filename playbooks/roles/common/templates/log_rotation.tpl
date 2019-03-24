/var/log/nginx/*.log {
  copytruncate
  missingok
  daily
  rotate 5
  size 200M
}
