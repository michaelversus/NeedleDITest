//
//  FourSquareClient.swift
//  FourSquareClient
//
//  Created by MIC KARAGIORGOS on 7/21/21.
//

import Foundation
import SimpleNetworking

struct FourSquareConfig {
    private static let clientID = "JL2YSVJVRB5550LDMOMJKPAWLL4XAF4CG5VX0E0PGQCRUQKU"
    private static let clientSecret = "WAMBVZXDTTMXAE0LC4LXFOTLUA5IBBSJYLKQSV2N4TULFJSB"
    static let secrets = [
        "client_id": FourSquareConfig.clientID,
        "client_secret": FourSquareConfig.clientSecret
    ]
}

protocol RequestProtocol {
    var baseURLString: String { get }
    var path: String { get }
    var url: URL { get }
    var queryWithSecrets: [String: String] { get }
    var query: [String: String] { get }
}

extension RequestProtocol {
    var baseURLString: String {
        "https://api.foursquare.com"
    }
    
    var url: URL {
        URL(string: baseURLString + path)!
    }
    
    var queryWithSecrets: [String: String] {
        FourSquareConfig.secrets.merging(query) { (_, new) in new }
    }
}

public struct VenuesExploreRequest: RequestProtocol {
    let path = "/v2/venues/explore"
    let date: Int
    let lon: Double
    let lat: Double
    let category: String
    let limit: Int
    
    public init(
        date: Int,
        lat: Double,
        lon: Double,
        category: String,
        limit: Int
    ) {
        self.date = date
        self.lat = lat
        self.lon = lon
        self.category = category
        self.limit = limit
    }
    
    var query: [String: String] {
        [
            "v": "\(date)",
            "ll": "\(lat),\(lon)",
            "query": category,
            "limit": "\(limit)"
        ]
    }
}

public struct VenuesExploreResponse: Decodable {
    let response: Response
    
    public struct Response: Decodable {
        let headerLocation: String
        let headerFullLocation: String
        let headerLocationGranularity: String
        let query: String
        let totalResults: Int
    }
}

public protocol FoursquareAPIProtocol {
    static func venues(request: VenuesExploreRequest) -> Endpoint<VenuesExploreResponse>
}

public enum FoursquareAPI: FoursquareAPIProtocol {
    public static func venues(request: VenuesExploreRequest) -> Endpoint<VenuesExploreResponse> {
        Endpoint<VenuesExploreResponse>(
            json: .get,
            url: request.url,
            query: request.queryWithSecrets
        )
    }
}
