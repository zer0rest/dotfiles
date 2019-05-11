#!/bin/bash

# Script that sets up my tmux environment if the last session was killed because
# of a reboot or something.

# Check if there is any active sessions on the tmux server. If there is, attach
# to it. Else set up the environment from the beginning
# In this case we check if there is a session named after the $session_name variable
# That's also the name our script will use to create a new session.

tmux has-session -t $USER

if [ $? -eq 0 ]
then
  echo "There is an acive session with the name $USER, attaching to it."
  tmux attach-session -t $USER
else
  echo "No active sessions, creating a new one..."

  # Create a new session and detach (-d) from it
  # Tmux is started with the -2 flag to use 256 colours
  tmux -2 new-session -d -s $USER

  # I prefer #1 to be irc and #2 the box I'm on
  tmux new-window -n irc -t $USER:0 -k
  tmux send-keys -t $USER:0 "ssh zer0rest@tiger.vps.zer0rest.net" Enter
  tmux new-window -n home -t $USER:1

  # If the f argument is passed set up the full blown environment instead of a more
  # minimal one
  FULL="f"

  if [ $1 == $FULL ]
  then
    tmux new-window -n dog -t $USER:2
    tmux new-window -n deer -t $USE:3
    tmux new-window -n ladybird -t $USER:4
    tmux new-window -n dolphin -t $USER:5
    tmux new-window -n octopus -t $USER:6
    tmux new-window -n otter -t $USER:7
    tmux new-window -n pie -t $USER:8
    tmux new-window -n walrus -t $USER:9

    tmux send-keys -t $USER:2 "ssh zer0rest@dog.lamdc01.zer0rest.net" Enter
    tmux send-keys -t $USER:3 "ssh zer0rest@deer.lamdc01.zer0rest.net" Enter
    tmux send-keys -t $USER:4 "ssh zer0rest@ladybird.lamdc01.zer0rest.net" Enter
    tmux send-keys -t $USER:5 "ssh zer0rest@dolphin.lamdc01.zer0rest.net" Enter
    tmux send-keys -t $USER:6 "ssh zer0rest@octopus.vps.zer0rest.net" Enter
    tmux send-keys -t $USER:7 "ssh zer0rest@otter.lamdc01.zer0rest.net" Enter
    tmux send-keys -t $USER:8 "ssh zer0rest@pie.lamdc01.zer0rest.net" Enter
    tmux send-keys -t $USER:9 "ssh zer0rest@walrus.lamdc01.zer0rest.net" Enter

  fi

  tmux attach-session -t $USER

fi
