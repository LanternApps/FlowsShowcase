//
//  User.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let email: String
    let birth: Date
    let phone: String
}
