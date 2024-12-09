package adhocnetwork.simulations;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.AdhocHost;
import inet.node.inet.WirelessHost;
import inet.mobility.single.RandomWaypointMobility;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
@license(LGPL);


network AdhocNetwork {
    parameters:
        int numNodes = default(10);
        string routingProtocol @enum("AODV","DSDV") = default("AODV");
        
    submodules:
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = true;
        }
        
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=50,50");
        }
        
        node[numNodes]: WirelessHost {
            parameters:
                // Remove direct mobility configuration
                wlan[*].typename = "Ieee80211Interface";
        }
}