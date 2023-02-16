#!/bin/bash

# Define the user to add or delete
USERNAME=johndoe

# Define the password for the new user
PASSWORD=secretpassword

# Define the home directory for the new user
HOME_DIR=/home/$USERNAME

# Add the user
add_user() {
  # Check if the user already exists
  if id "$USERNAME" >/dev/null 2>&1; then
    echo "User $USERNAME already exists"
  else
    # Create the user with the specified password and home directory
    useradd --create-home --home-dir $HOME_DIR --shell /bin/bash $USERNAME
    echo "$USERNAME:$PASSWORD" | chpasswd
    echo "User $USERNAME created with password $PASSWORD"
  fi
}

# Delete the user
delete_user() {
  # Check if the user exists
  if id "$USERNAME" >/dev/null 2>&1; then
    # Delete the user and their home directory
    userdel -r $USERNAME
    echo "User $USERNAME deleted"
  else
    echo "User $USERNAME does not exist"
  fi
}

# Run the specified action (add or delete user)
if [ "$1" = "add" ]; then
  add_user
elif [ "$1" = "delete" ]; then
  delete_user
else
  echo "Usage: $0 [add|delete]"
fi
