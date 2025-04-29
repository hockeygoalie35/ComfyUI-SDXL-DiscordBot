#!/bin/bash
set -e
CONFIG_FILE="/app/config.properties"
# Check if the config file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Config file not found at $CONFIG_FILE"
  exit 1
fi

# Set defaults if env vars not provided
: "${TOKEN:=default_token}"
: "${SERVER_ADDRESS:=localhost:8188}"

# Update TOKEN inside [BOT] section
sed -i "/^\[BOT\]/,/^\[/ s|^TOKEN=.*|TOKEN=${TOKEN}|" "$CONFIG_FILE"
# Update SERVER_ADDRESS inside [LOCAL] section
sed -i "/^\[LOCAL\]/,/^\[/ s|^SERVER_ADDRESS=.*|SERVER_ADDRESS=${SERVER_ADDRESS}|" "$CONFIG_FILE"

echo "Passed env vars to config\n"
cat "$CONFIG_FILE"

echo "\nStarting the bot...\n"
exec python bot.py