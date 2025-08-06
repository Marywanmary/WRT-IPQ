#!/bin/bash
# scripts/build-error-handler.sh
# 编译错误处理脚本

handle_error() {
  local exit_code=$?
  local error_msg=$1
  
  echo "编译过程中发生错误: $error_msg"
  echo "退出码: $exit_code"
  
  # 保存错误日志
  dmesg > build-error-log.txt 2>&1
  echo "错误信息:" >> build-error-log.txt
  echo "$error_msg" >> build-error-log.txt
  
  # 上传错误日志到GitHub Release
  # 注意：需要在工作流中配置GitHub Token
  if [ -n "$GITHUB_TOKEN" ]; then
    echo "上传错误日志到Release..."
    # 这里可以添加上传逻辑
  fi
  
  exit $exit_code
}

# 设置错误处理
trap 'handle_error "未知错误"' ERR
