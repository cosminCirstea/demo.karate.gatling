package performance.simulations

import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.feeder.BatchableFeederBuilder
import io.gatling.core.structure.ScenarioBuilder

class PerfFeederTest extends Simulation {

  val protocol: KarateProtocol = karateProtocol()

  val csvFeeder: BatchableFeederBuilder[String] = csv("users.csv").circular

  val getSingleUsers: ScenarioBuilder = scenario("Get single users in async").feed(csvFeeder).exec(karateFeature("classpath:performance/features/GetSingleUserWithDataFeed.feature"))

  setUp(
    getSingleUsers.inject(
      atOnceUsers(10)
      ).protocols(protocol)
  )
}