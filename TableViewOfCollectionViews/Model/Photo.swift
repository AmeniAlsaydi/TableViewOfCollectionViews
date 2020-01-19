//
//  Photo.swift
//  TableViewOfCollectionViews
//
//  Created by Amy Alsaydi on 1/18/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//


import Foundation

struct PhotoSearch: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let photo: [Photo]
}

struct Photo: Codable {
let title: String
let url_m: String?
let description: Description?
}

struct Description: Codable {
    let _content: String
}
