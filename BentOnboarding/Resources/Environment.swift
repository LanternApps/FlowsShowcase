//
//  Environment.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation
import Defaults

public enum BEEnvironment {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let authURL = "AUTH_URL"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else { fatalError("Env file not found") }
        return dict
    }()

    static let baseURL: URL = {
        guard let rootURLstring = Self.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()

    static let authURL: URL = {
        guard let rootURLstring = Self.infoDictionary[Keys.Plist.authURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
}
