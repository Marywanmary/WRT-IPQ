#!/bin/bash
# scripts/disk-monitor.sh
# 磁盘空间监控脚本

while true; do
  # 检查根分区可用空间（GB）
  available_space=$(df / | awk 'NR==2 {print $4}')
  available_gb=$((available_space / 1024 / 1024))
  
  echo "当前可用磁盘空间: ${available_gb}GB"
  
  # 如果可用空间小于10GB，发出警告
  if [ $available_gb -lt 10 ]; then
    echo "警告：磁盘空间不足10GB！当前可用: ${available_gb}GB"
    # 可以在这里添加更多警告逻辑，如发送通知等
  fi
  
  # 每15分钟检查一次
  sleep 900
done
