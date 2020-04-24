import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import KituraOpenAPI

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()

    public init() throws {
        Persistence.setUp()
        // Configure logging
        initializeLogging()
        // Run the metrics initializer
        initializeMetrics(router: router)
        
    }

    func postInit() throws {
        // Endpoints
        initializeHealthRoutes(app: self)
        initializeGetRoutes(app: self)
        initializeEntryRoutes(app: self)
        initializeBasicAuth(app: self)
        initializeUserRoutes(app: self)
        initializeCountDaysRoutes(app: self)
        initializeReflectionRoute(app: self)
        
        KituraOpenAPI.addEndpoints(to: router)
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}
