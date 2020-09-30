//
//  APIRouter.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getVenueData
    
    var path: String {
        switch self {
        case .getVenueData:
            return "/venue/dashboard"
        }
    }
        
    var method: HTTPMethod {
        switch self {
        case .getVenueData:
            return .get
        }
    }
        
    var parameters: [String: Any] {
        switch self {
        case .getVenueData:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Config.Url.baseURL)
        let urlRequest = try URLRequest(url: (url?.appendingPathComponent(path))!, method: method)
        print(urlRequest)      
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
