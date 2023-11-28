//
//  Storage.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//

import Foundation
class NewsStorage {
    static var shared: NewsStorage = NewsStorage()
    var isSelected: Bool = false
    private init() {
        }
}
