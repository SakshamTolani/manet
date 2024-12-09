package ethnet.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.StandardHost;

@license(LGPL);
//
// TODO documentation
//
network EthNet
{
    parameters:
        @display("bgb=602,378");
        int numClients = default(4);

    submodules:
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,62;is=l");
        }
        server: StandardHost {
            @display("p=288,123;i=device/device;is=vl");
        }
        client[numClients]: StandardHost {
            @display("p=288,298,row,100;i=device/wifilaptop;is=vl");
        }
    connections:
        for i=0..numClients-1 {
            client[i].ethg++ <--> Eth100M <--> server.ethg++;
        }
}

