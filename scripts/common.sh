#!/bin/bash
# scripts/common.sh
# 通用函数脚本

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 打印带颜色的信息
print_info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# 检查命令执行结果
check_result() {
  if [ $? -ne 0 ]; then
    print_error "$1"
    exit 1
  fi
}

# 显示进度条
show_progress() {
  local duration=$1
  local interval=1
  local elapsed=0
  
  while [ $elapsed -lt $duration ]; do
    printf "\r进度: %d/%d 秒" $elapsed $duration
    sleep $interval
    elapsed=$((elapsed + interval))
  done
  printf "\r进度: 完成!          \n"
}
