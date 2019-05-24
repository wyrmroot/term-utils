#!/bin/bash

#########
# 0 # 1 #
#########
# 2 # 3 #
#########

# Initialize server
session="monitor"
tmux start-server
tmux new-session -d -s $session
tmux set escape-time 100

# Window 0: Quad heads-up display
tmux split-window -v -p 16
tmux split-window -h -t 0
tmux split-window -h -t 2

# Default programs
tmux select-pane -t 3
tmux send-keys "htop" C-m

tmux select-pane -t 1
tmux send-keys "mc" C-m

tmux select-pane -t 2
tmux send-keys "./checkweather.sh" C-m

tmux rename-window quad

# Window 1: bmon
tmux new-window
tmux select-window -t 1
tmux send-keys "bmon" C-m
tmux rename-window network

# Select default pane
tmux select-window -t 0
tmux select-pane -t 0

# Attach to the session
tmux attach-session -t $session
