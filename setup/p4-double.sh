ip link add name h1 type veth peer name s1-eth0
ip link add name h2 type veth peer name s2-eth0
ip link add name s1-eth1 type veth peer name s2-eth1
ip link set s1-eth0 address 00:00:00:00:00:01
ip link set s2-eth0 address 00:00:00:00:00:02
ip link set s1-eth1 address 00:00:00:00:01:01
ip link set s2-eth1 address 00:00:00:00:02:02
ip netns add h1
ip netns add h2
ip link set h1 netns h1
ip link set h2 netns h2
ip link set s1-eth0 up
ip link set s2-eth0 up
ip link set s1-eth1 up
ip link set s2-eth1 up
ip netns exec h1 ip a add 10.0.1.10/24 dev h1
ip netns exec h2 ip a add 10.0.2.20/24 dev h2
ip netns exec h1 ip link set h1 address 08:00:00:00:00:01
ip netns exec h2 ip link set h2 address 08:00:00:00:00:02
ip netns exec h1 ip link set h1 up
ip netns exec h2 ip link set h2 up
ip netns exec h1 arp -s 10.0.1.1 00:00:00:00:00:01
ip netns exec h2 arp -s 10.0.2.1 00:00:00:00:00:02
ip netns exec h1 ip r add default via 10.0.1.1 dev h1
ip netns exec h2 ip r add default via 10.0.2.1 dev h2

