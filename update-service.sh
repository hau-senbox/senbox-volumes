#!/bin/bash
# ==========================================
# 🧰 SCRIPT: Update & Restart Docker Services
# Author: ChatGPT
# ==========================================

# Danh sách service (thư mục)
SERVICES=(
  "cart-service"
  "chat-service"
  "classroom-service"
  "colortime-service"
  "department-service"
  "event-service"
  "food-service"
  "holiday-service"
  "inventory-service"
  "media-service"
  "order-service"
  "portal-service"
  "product-service"
  "report-service"
  "senbox-api"
  "services-management"
  "term-service"
  "todo-service"
  "wallet-service"
)

# Hàm cập nhật một service
update_service() {
  SERVICE_DIR=$1
  CONTAINER_NAME=$2

  echo "------------------------------------------"
  echo "🔄 ĐANG CẬP NHẬT: $SERVICE_DIR (container: $CONTAINER_NAME)"
  echo "------------------------------------------"

  if [ ! -d "../$SERVICE_DIR" ]; then
    echo "❌ Không tìm thấy thư mục ../$SERVICE_DIR"
    return
  fi

  cd "../$SERVICE_DIR" || return

  echo "📦 Git pulling latest code..."
  git pull || { echo "⚠️  Git pull lỗi ở $SERVICE_DIR"; cd ../senbox-volumes || return; return; }

  cd ../senbox-volumes || return

  echo "🛑 Dừng container $CONTAINER_NAME ..."
  docker compose down "$CONTAINER_NAME" >/dev/null 2>&1

  echo "🧹 Xóa image cũ: senbox-volumes-$CONTAINER_NAME ..."
  docker rmi "senbox-volumes-$CONTAINER_NAME" >/dev/null 2>&1 || true

  echo "🚀 Khởi động lại container $CONTAINER_NAME ..."
  docker compose up -d "$CONTAINER_NAME"

  echo "✅ Hoàn tất cập nhật: $SERVICE_DIR ($CONTAINER_NAME)"
  echo
}

# Hiển thị menu
echo "=========================================="
echo "        🛠️  CHỌN SERVICE CẦN CẬP NHẬT"
echo "=========================================="
i=1
for svc in "${SERVICES[@]}"; do
  printf "%2d) %s\n" "$i" "$svc"
  ((i++))
done
echo " A) TẤT CẢ SERVICE"
echo "------------------------------------------"
read -p "👉 Nhập số (1-${#SERVICES[@]}) hoặc 'A': " choice

# Xử lý lựa chọn
if [[ "$choice" =~ ^[0-9]+$ ]]; then
  idx=$((choice - 1))
  if [ $idx -ge 0 ] && [ $idx -lt ${#SERVICES[@]} ]; then
    SERVICE_DIR="${SERVICES[$idx]}"
    # Mapping tên container đặc biệt
    if [ "$SERVICE_DIR" == "senbox-api" ]; then
      CONTAINER_NAME="go-main-service"
    else
      CONTAINER_NAME="$SERVICE_DIR"
    fi
    update_service "$SERVICE_DIR" "$CONTAINER_NAME"
  else
    echo "❌ Số không hợp lệ."
  fi
elif [[ "$choice" =~ ^[Aa]$ ]]; then
  echo "⚙️  Cập nhật tất cả service..."
  for svc in "${SERVICES[@]}"; do
    if [ "$svc" == "senbox-api" ]; then
      update_service "$svc" "go-main-service"
    else
      update_service "$svc" "$svc"
    fi
  done
else
  echo "❌ Lựa chọn không hợp lệ."
fi
