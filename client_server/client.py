
import socket
import sys

# Creating  Global variables
MAX_DATA_RECIEVED= 8192
PORT_PORT = 8080
HOST_PORT = 'localhost'

def main():
   
    try:
        # Creating  a socket connection
        soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    except socket.error as voc:
        print("Error  on a  socket: " + voc)
        sys.exit(1)

    try:
        # Connecting  to remote server
        soc.connect((HOST_PORT, PORT_PORT))
    except socket.gaierror as voc:
        print("Address-related error connecting to server: " + voc)
        sys.exit(1)
    except socket.error as voc:
        print("Connection error: " + voc)
        sys.exit(1)

    print("Socket connecting  to a " + HOST_PORT + " the ip " + HOST_PORT)

    # Sending the  data to remote server
    message = "GET / HTTP/1.1rn"
    try:
        soc.sendall(message)
    except socket.error as voc:
        print("Error sending data: " + voc)
        sys.exit(1)

    print("Sent: " + message)

    # Now receiving the  data
    while 1:
        try:
            data = soc.recv(MAX_DATA_RECIEVED)
            break
        except socket.error as voc:
            print("Error receiving data: " + voc)
            sys.exit(1)

    print("Received: " + data)

    # Closing  the socket
    soc.close()

if __name__ == '__main__':
    main()