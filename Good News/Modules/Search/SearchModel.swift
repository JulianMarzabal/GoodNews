//
//  SearchModel.swift
//  Good News
//
//  Created by Julian Marzabal on 15/10/2023.
//

import Foundation

struct SearchModel: Decodable {
    let title: String?
    let description: String?
    let content: String?
    let image: String
}
