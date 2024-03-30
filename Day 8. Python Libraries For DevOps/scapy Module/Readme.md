# scapy Module

Scapy is a powerful Python-based interactive packet manipulation program and library.

It is able to forge or decode packets of a wide number of protocols, send them on the wire, capture them, store or read them using pcap files, match requests and replies, and much more. It is designed to allow fast packet prototyping by using default values that work.

```
from scapy.all import *
#stacking layers
#The / operator has been used as a composition operator between two layers. 
#When doing so, the lower layer can have 
#one or more of its defaults fields overloaded according to the upper layer.
#src - source IP
#dst - destination IP
#Show IP fields
ls(IP, verbose=True)

packet = Ether()/IP(dst="www.hashnode.com")/TCP()
packet.summary()
```

```
from scapy.all import *
#sniff - Sniffing the network is as straightforward as sending and 
#receiving packets. The sniff() function returns a list of Scapy packets
sniff(count=2, prn=lambda p: p.summary())
```

```
from scapy.all import *

#Send/Receive packet
#The sr1() function sends a packet and returns the corresponding answer. 
#srp1() does the same for layer two packets, i.e. Ethernet.
p = sr1(IP(dst="8.8.8.8")/UDP()/DNS(qd=DNSQR()))
p[DNS].an

```
