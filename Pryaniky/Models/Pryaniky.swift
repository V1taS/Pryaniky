//
//  Pryaniky.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 04.02.2021.
//

import Foundation

struct Pryaniky: Decodable {
    let data: [DataList]?
    let view: [String]?
}

struct DataList: Decodable {
    let name: String?
    let data: InternalData?
}

struct InternalData: Decodable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
    
    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

struct Variant: Decodable {
    let id: Int
    let text: String
}
