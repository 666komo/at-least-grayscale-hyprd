#!/bin/bash

# Configuration
CACHE_DIR="$HOME/.cache/autoupdate"
CACHE_FILE="$CACHE_DIR/last_update"
LOG_FILE="$CACHE_DIR/update.log"

# Ensure the cache directory exists
mkdir -p "$CACHE_DIR"

# Log function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Notify function
notify() {
    notify-send "System Update" "$1" -u normal -i system-software-update
}

# Perform the update
log "Starting system update..."
notify "Starting system update..."
if paru -Syu --noconfirm; then
    log "Update completed successfully."
    notify "System update completed successfully."
    date '+%Y-%m-%d %H:%M:%S' > "$CACHE_FILE"
else
    log "Update failed."
    notify "System update failed. Check the log for details." -u critical
fi

