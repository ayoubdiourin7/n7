import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;
public class LoadBalancer extends Thread {

    static String hosts[] = {"localhost", "localhost"};
    static int ports[] = {8081,8082};
    static int nbHosts = 2;
    static Random rand = new Random();
    Socket socketClient;

   public LoadBalancer(Socket s) {
        this.socketClient = s;
    }
    public void rnu(){
        try {
            byte[] buffer = new byte[1024];
            int nbRead ;
            // Read the request from the client
            nbRead = socketClient.getInputStream().read(buffer);

            // establish a connection with a random host
            int host = rand.nextInt(nbHosts);
            Socket socketHost  = new Socket(hosts[host], ports[host]);

            // send the request geted from the client to the host
            socketHost.getOutputStream().write(buffer, 0, nbRead);

            // read the response from the host
            nbRead = socketHost.getInputStream().read(buffer);

            // send the response geted from the host to the client
            socketClient.getOutputStream().write(buffer, 0, nbRead);

            // close the sockets
            socketHost.close();
            socketClient.close();


        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {
        ServerSocket s = new ServerSocket(8080);
        while (true) {
            Thread t = new LoadBalancer(s.accept());
            System.out.println("New client connected");
            t.start();
        }
    }
}