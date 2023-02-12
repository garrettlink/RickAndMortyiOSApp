//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Garrett Link on 2/12/23.
//

import Foundation

/// Object that represents a single API call 
final class RMRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path componentes for API, if nay
    private let pathComponents: Set<String>
    
    /// Query components for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Contructed URL for API request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    /// Computed and contruted API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Deisred API method
    public let httpMethod = "GET"
    
    //MARK: - Public
    
    /// Conttruct Request
    /// - Parameters:
    ///   - endpoint: Targete endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
