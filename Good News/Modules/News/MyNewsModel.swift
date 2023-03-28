//
//  infoNewsModel.swift
//  Good News
//
//  Created by Julian Marzabal on 08/01/2023.
//

import Foundation
struct NewsModel: Decodable {
    let title: String?
    let description: String?
    let content: String?
    let image: String
}
