import socket
import sys
import threading

# Assinging Global variables
MAX_DATA_RECIEVED= 8192
PORT_PORT = 8080
HOST_PORT = 'localhost'
CONNECTIONS = 5
PROXY_MODE = 'proxy'
DIRECT_MODE = 'direct'
CACHE = {}
CACHE_LOCK = threading.Lock()


def main():
    try:
        data = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        data.bind((HOST_PORT, PORT_PORT))
        data.listen(MAX_DATA_RECIEVED)
    except socket.error as e:
        if data:
            data.close()
        print("uneble to open the  socket: " + e)
        sys.exit(1)

    while 1:
        # Getting  the connection from client
        conn, addr = data.accept()
        # Creating  a new thread and return its identifier
        timer = threading.Thread(target=proxy_thread, args=(conn, addr))
        timer.start()

    data.close()

def proxy_thread(conn, addr):
    # Getting the request from browser
    request = conn.recv(MAX_DATA_RECIEVED)
    # Parse the first line
    first_line = request.split('n')[0]
    # Getting the url
    url = first_line.split(' ')[1]
    # Finding  the webserver and port
    http_pos = url.find("://") # find pos of ://
    if (http_pos==-1):
        temp = url
    else:
        temp = url[(http_pos+3):] # get the rest of url
    port_pos = temp.find(":") # find the port pos (if any)
    # Find end of web server
    webserver_pos = temp.find("/")
    if webserver_pos == -1:
        webserver_pos = len(temp)
    webserver = ""
    port = -1
    if (port_pos==-1 or webserver_pos < port_pos): # default port
        port = 80
        webserver = temp[:webserver_pos]
    else: # specific port
        port = int((temp[(port_pos+1):])[:webserver_pos-port_pos-1])
        webserver = temp[:port_pos]
    try:
        # Create a socket to connect to the web server
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((webserver, port))
        s.send(request) # send request to webserver
        while 1:
            # Receive data from web server
            data = s.recv(MAX_DATA_RECIEVED)
            if (len(data) > 0):
                # Send to browser
                conn.send(data)
            else:
                break
        s.close()
        conn.close()
    except socket.error as e:
        if s:
            s.close()
        if conn:
            conn.close()
        sys.exit(1)

if __name__ == '__main__':
    main()

