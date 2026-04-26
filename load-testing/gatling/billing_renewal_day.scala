import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class BillingRenewalDay extends Simulation {
  val httpProtocol = http.baseUrl(System.getenv("API")).acceptHeader("application/json")
  val scn = scenario("renewal").exec(http("renewal").post("/v1/billing/renew").body(StringBody("""{"user_id":"u-1"}""")).asJson)
  setUp(scn.inject(rampUsersPerSec(50) to 5000 during (10 minutes), constantUsersPerSec(5000) during (1 hour))).protocols(httpProtocol)
}
