#!/bin/bash

# Set the source and destination directories
SRC_DIR=/path/to/source
DEST_DIR=/path/to/destination

# Create the destination directory if it doesn't exist
mkdir -p $DEST_DIR

# Create a backup file name based on the current date and time
BACKUP_FILE="backup-$(date +%Y-%m-%d-%H%M%S).tar.gz"

# Create the backup archive
tar -czf $DEST_DIR/$BACKUP_FILE $SRC_DIR

# Print a message to confirm that the backup is complete
echo "Backup of $SRC_DIR completed. Backup file is located at $DEST_DIR/$BACKUP_FILE"
