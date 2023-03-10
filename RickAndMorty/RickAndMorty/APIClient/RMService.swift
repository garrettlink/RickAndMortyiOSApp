//
//  RMService.swift
//  RickAndMorty
//
//  Created by Garrett Link on 2/12/23.
//

import Foundation

/// Primary API service object to get rick and morty data
final class RMService {
    
    ///  Shared singleton instance
    static let shared = RMService()
    
    
    /// Privateized constructior
    private init () {}
    
    
    /// Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back 
    ///   - compeltion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        compeltion: @escaping (Result<T,Error>) -> Void) {
        
    }
}
