#!/bin/bash

VM1=192.168.1.117
VM2=192.168.1.101
VM3=192.168.1.131
VM4=192.168.1.113
VM5=192.168.1.130

# Create a new tmux session named "my_session"
tmux new-session -d -s my_session

# Split the window into two vertical panes
tmux split-window -h

# Split the left pane into two horizontal panes
tmux select-pane -t 0
tmux split-window -v
tmux split-window -v
tmux select-pane -t 0
tmux split-window -v
tmux split-window -v

# Split the right pane into three horizontal panes
tmux select-pane -t 5
tmux split-window -v
tmux split-window -v
tmux select-pane -t 5
tmux split-window -v
tmux split-window -v
tmux select-pane -t 9
tmux split-window -v

# tmux send-keys -t 0 "ssh user@${VM1} cd open5gs && bash" C-m
# tmux send-keys -t 0  "ssh -o \"RemoteCommand=cd open5gs && ./install/bin/open5gs-nrfd && bash\" vm1" C-m
tmux send-keys -t 0  "ssh -o \"RemoteCommand=cd open5gs && bash\" vm1" C-m
tmux send-keys -t 0  "./install/bin/open5gs-nrfd" C-m

tmux send-keys -t 1  "ssh -o \"RemoteCommand=cd open5gs && sleep 2 && bash\" vm1" C-m
tmux send-keys -t 1  "./install/bin/open5gs-scpd" C-m

tmux send-keys -t 2  "ssh -o \"RemoteCommand=cd open5gs && sleep 4 && bash\" vm1" C-m
tmux send-keys -t 2  "./install/bin/open5gs-amfd" C-m

tmux send-keys -t 3  "ssh -o \"RemoteCommand=cd open5gs && sleep 6 && bash\" vm1" C-m
tmux send-keys -t 3  "./install/bin/open5gs-smfd -c install/etc/open5gs/smf1.yaml" C-m

tmux send-keys -t 4  "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 4  "./install/bin/open5gs-smfd -c install/etc/open5gs/smf2.yaml" C-m

tmux send-keys -t 5  "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 5  "./install/bin/open5gs-ausfd" C-m

tmux send-keys -t 6  "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 6  "./install/bin/open5gs-udmd" C-m

tmux send-keys -t 7  "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 7  "./install/bin/open5gs-udrd" C-m

tmux send-keys -t 8  "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 8  "./install/bin/open5gs-pcfd" C-m

tmux send-keys -t 9  "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 9  "./install/bin/open5gs-nssfd" C-m

tmux send-keys -t 10 "ssh -o \"RemoteCommand=cd open5gs && sleep 8 && bash\" vm1" C-m
tmux send-keys -t 10 "./install/bin/open5gs-bsfd" C-m

# for window 2
tmux new-window -t my_session -n "Second Window"
tmux select-window -t my_session:1

# Split the window into two vertical panes
tmux split-window -h

# Split the left pane into two horizontal panes
tmux select-pane -t 0
tmux split-window -v

# Split the right pane into three horizontal panes
tmux select-pane -t 2
tmux split-window -v
tmux split-window -v

# Set commands for panes in Window 2
tmux send-keys -t my_session:1.0 "ssh -o \"RemoteCommand=cd open5gs && bash\" vm2" C-m
tmux send-keys -t my_session:1.0 "./install/bin/open5gs-upfd"

tmux send-keys -t my_session:1.1 "ssh -o \"RemoteCommand=cd open5gs && bash\" vm3" C-m
tmux send-keys -t my_session:1.1 "./install/bin/open5gs-upfd"

tmux send-keys -t my_session:1.2 "ssh -o \"RemoteCommand=cd UERANSIM && bash\" vm4" C-m
tmux send-keys -t my_session:1.2 "build/nr-gnb -c config/open5gs-gnb.yaml"

tmux send-keys -t my_session:1.3 "ssh -o \"RemoteCommand=cd UERANSIM && bash\" vm5" C-m
tmux send-keys -t my_session:1.3 "sudo build/nr-ue -c config/open5gs-ue-sd1.yaml"

tmux send-keys -t my_session:1.4 "ssh -o \"RemoteCommand=cd UERANSIM && bash\" vm5" C-m
tmux send-keys -t my_session:1.4 "ip a"


# Attach to the t11 mux session
tmux attach-session -t my_session

# tmux display-message -p '#P'
# tmux kill-session -t my_session


