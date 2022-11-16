package PermissionControllerTest;

import static io.gatling.javaapi.core.CoreDsl.*;
import static io.gatling.javaapi.http.HttpDsl.*;

import io.gatling.javaapi.core.*;
import io.gatling.javaapi.http.*;

// import io.gatling.javaapi.core.*;
// import io.gatling.javaapi.http.*;
import org.apache.commons.lang3.RandomStringUtils;

import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.function.Supplier;
import java.util.stream.Stream;


public class PermissionController extends Simulation{

    private HttpProtocolBuilder httpProtocol =
    http.baseUrl("http://localhost:8094/security")
    .acceptHeader("application/json")
    .contentTypeHeader("application/json");


    private static Iterator<Map<String, Object>> customFeeder =
    Stream.generate((Supplier<Map<String, Object>>) () -> {
        Random rand = new Random();
        
        long version=rand.nextInt(10 - 1 + 1) + 1;
        String name="Test Permision_"+RandomStringUtils.randomAlphanumeric(5);
        String permission_parent="TestTeam _"+RandomStringUtils.randomAlphanumeric(5);
        String description="Team Menu _"+RandomStringUtils.randomAlphanumeric(5);
        
        HashMap<String, Object> hmap = new HashMap<String, Object>();
                hmap.put("Version", version);
                hmap.put("name", name);
                hmap.put("permission_parent", permission_parent);
                hmap.put("description", description);
                return hmap;
    }
        ).iterator();
    
    
    private static ChainBuilder createPermissionController =
    feed(customFeeder)
            .exec(http("Create PermissionController")
                        .post("/permissions/create")
                        .check(bodyString().saveAs("responseBody")))
                .exec(session -> {
                    System.out.println(session.getString("responseBody"));
                    return session;
                });
    
    private ScenarioBuilder scn = scenario("Permission Testting")
                .repeat(5).on(
                    exec(createPermissionController)
                    .pause(1)
                );
        
    
    {
    setUp(
        scn.injectOpen(atOnceUsers(1))
        ).protocols(httpProtocol);
                }
}