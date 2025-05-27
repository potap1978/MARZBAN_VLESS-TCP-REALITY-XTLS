CERT_DIR="/root"
CERT_NAME="vless"
DAYS_VALID=3650
mkdir -p "$CERT_DIR"
CERT_PATH="$CERT_DIR/$CERT_NAME-PUB_KEY.crt"
KEY_PATH="$CERT_DIR/$CERT_NAME-PRIVAT_KEY.key"

openssl req -x509 -nodes -days $DAYS_VALID -newkey rsa:4096 \
  -keyout "$KEY_PATH" \
  -out "$CERT_PATH" \
  -subj "/C=RU/ST=State/L=City/O=Organization/OU=Department/CN=Potap.rulez"

if [ $? -eq 0 ]; then
  echo "SSL CERTIFICATE PATH: $CERT_PATH"
  echo "SSL KEY PATH: $KEY_PATH"
else
  exit 1
fi
