//
//  AuthService.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import SharedCore
import Combine

struct AuthService {
    private let agent = NetworkAgent()
    
    enum Endpoint: String {
        case smsVerificationStart = "auth/sms/start"
        case smsVerificationFinish = "auth/sms/finish"
        case smsVerificationJoin = "auth/sms/join"
    }
    
    struct SignUpRequest: Codable {
        let phone: String
        let email: String
        let code: String
    }
    
    struct SignUpResponse: Codable {
        
    }
}

extension AuthService {
    
    func signUp(_ auth: SignUpRequest) -> AnyPublisher<SignUpResponse, Error> {
        var request = URLRequest(url: BEEnvironment.authURL.appendingPathComponent(Endpoint.smsVerificationJoin.rawValue))
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(auth)
        return agent
            .run(request)
            .eraseToAnyPublisher()
    }
}
