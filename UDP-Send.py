import socket
import time
import random
import string
import argparse

UDP_IP = "127.0.0.1"
UDP_PORT = 9001
NUMSENT = 0

parser = argparse.ArgumentParser()
parser.add_argument("NumBytes", help="Number of random bytes to transmit", type=int)
parser.add_argument("SleepTime", help="Time in ms to sleep in-between messages", type=float)
args=parser.parse_args()

if args.NumBytes > 1023:
    print "Number of bytes too large, must be less than 1024"
    quit()

print "UDP target IP:", UDP_IP
print "UDP target port:", UDP_PORT
print "Number of bytes:", args.NumBytes
print "Sleep time in seconds:", args.SleepTime / 1000

sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP

while(1):
	
    MESSAGE = "recv,%d,0,0,%d,0,0,0,0,0,%d,0,0,%d,%d" % (random.randint(1,4),NUMSENT,random.randint(30,70)*-1,random.randint(2,4),NUMSENT)
#    MESSAGE = ''.join([random.choice(string.ascii_letters + string.digits) for n in xrange(args.NumBytes)])
    print MESSAGE
    sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))
    NUMSENT += 1
    print NUMSENT
    time.sleep(1/args.SleepTime )
