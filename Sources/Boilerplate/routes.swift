import Vapor
import Foundation

public func routes(_ router: Router) throws {
    router.get("ping") { req in
        return "123" as StaticString
    }

    router.get("json") { req in
        return ["foo": "bar"]
    }

    router.get("client") { req in
        return try req.make(FoundationClient.self).get("http://vapor.codes").map(to: String.self) { res in
            return String(data: res.http.body?.data ?? Data(), encoding: .ascii) ?? ""
        }
    }
}
