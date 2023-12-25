#!/bin/bash

# Iterate through each pane in the specified session ('my_session') and send Ctrl + C
session_name="my_session"

for pane_id in $(tmux list-panes -t "$session_name" -F '#{pane_id}'); do
    tmux send-keys -t "$pane_id" C-c
done

for pane_id in $(tmux list-panes -t "$session_name" -F '#{pane_id}'); do
    tmux send-keys -t "$pane_id" C-c
done

for pane_id in $(tmux list-panes -t "$session_name" -F '#{pane_id}'); do
    tmux send-keys -t "$pane_id" C-d
done

for pane_id in $(tmux list-panes -t "$session_name" -F '#{pane_id}'); do
    tmux send-keys -t "$pane_id" C-d
done
