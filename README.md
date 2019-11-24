# android-studio-docker
Android Studio GUI on Docker

**Android Studio Version: 3.5.2.0**

## How To Run

### Basic command:

    docker run -it --rm 
        --net=host 
        -v "$HOME/.Xauthority:/root/.Xauthority:rw" 
        -e DISPLAY="$DISPLAY" 
        beechfuzz/android-studio-docker
        
### Headless Docker Server
If you're running Docker on a server that has no GUI, then you'll need to SSH into the server (with X11 forwarding enabled) and then run the `docker run` command.

1. On the Server, enable X11 Forwarding
    1. Make sure `/etc/ssh/sshd_config` contains the following:

            X11Forwarding yes
    
    2. `SIGHUP` sshd to pick up the change:

            cat /var/run/sshd.pid | xargs kill -1
    
    3. Verify `xauth` is installed

            which xauth
        
        If it's not, then use your package manager to install it.
    
2. SSH into Docker server
    * From Linux:
    
            ssh -X user@<IP_OF_DOCKER_SERVER>
            
    * From Windows (via PuTTY):
        - Windows needs an X server installed; install [XMing](https://sourceforge.net/projects/xming/) and ensure it's running
        - Install PuTTY if you don't already have it installed.
        - In PuTTY, go to 'Connection' > 'SSH' > 'X11' and check the box next to 'Enable X11 Forwarding', then connect to the server
        
3. Run the basic command mentioned above.

