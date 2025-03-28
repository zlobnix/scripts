#!/bin/bash
#-------------------------
#Lnix script to backup folder by config file
#________________________

CONFIG_FILE_JSON="backup_config.json"

if ! command -v jq &> /dev/null; then
	echo "Error: jq is not installed. Please install jq to use this script."
	exit 1
fi

BACKUP_COUNT=$(jq '.backups | length' "$CONFIG_FILE_JSON")

for ((i=0; i<BACKUP_COUNT; i++)); do
	BACKUP_NAME=$(jq -r ".backups[$i].backup_name" "$CONFIG_FILE_JSON")
	SOURCE_FOLDER=$(jq -r ".backups[$i].source_folder" "$CONFIG_FILE_JSON")
	TARGET_FOLDER=$(jq -r ".backups[$i].target_folder" "$CONFIG_FILE_JSON")

	echo "---Start backup: $BACKUP_NAME"

	if [ ! -d "$SOURCE_FOLDER" ]; then
		echo "---Skipping $BACKUP_NAME: Source folder $SOURCE_FOLDER does not exist."
		continue # i=i+1
	fi

	if [ ! -d "$TARGET_FOLDER" ]; then
		echo "For $BACKUP_NAME: Target folder $TARGET_FOLDER does not exit, creating..."
		mkdir -p $TARGET_FOLDER
	fi

	TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
	BACKUP_FILE="$TARGET_FOLDER/$BACKUP_NAME-$TIMESTAMP.tar.gz"

	#Creating Backup!!!
	echo "---Backing up $SOURCE_FOLDER to $BACKUP_FILE..."
	tar -czf "$BACKUP_FILE" -C "$SOURCE_FOLDER" .
	if [ $? -eq 0 ]; then
		echo "---Backup $BACKUP_NAME completed successfully."
	else
		echo "---Backup $BACKUP_NAME failed."
	fi

	echo "---Finish backup: $BACKUP_NAME"


done
