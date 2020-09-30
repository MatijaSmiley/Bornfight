//
//  APIManager.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation
import Alamofire

class APIManager: NSObject {

    static func getVenueData(onComplete: @escaping (NetworkResponse<Venue>) -> Void) {
        AF.request(APIRouter.getVenueData).responseData { (response) in
            let statusCode = response.response?.statusCode ?? 0000
            switch response.result {
            case .success(let data):
                guard let customPicks: Venue = try? JSONDecoder().decode(Venue.self, from: data) else {
                    onComplete(.failure(NetworkError(message: ErrorMessage.parse)))
                    return
                }
                onComplete(.success(customPicks))
            case .failure(_):
                onComplete(.failure(NetworkError(message: ErrorMessage.failure(code: statusCode))))
            }
        }
    }
}
