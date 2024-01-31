//
//  Photo.swift
//  FlickrApp-Swift
//
//  Created by Osmancan Akagündüz on 27.01.2024.
//

import Foundation


// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let license: String
    let description: Description
    let dateupload, lastupdate, datetaken: String
    let datetakengranularity: Int
    let datetakenunknown, ownername, iconserver: String
    let iconfarm: Int
    let views, tags, machineTags: String
    let latitude, longitude, accuracy: Accuracy
    let context: Int
    let placeID: PlaceID?
    let woeid: String?
    let geoIsPublic, geoIsContact, geoIsFriend, geoIsFamily: Int?
    let media: Media
    let mediaStatus: MediaStatus
    let urlSq: String
    let heightSq, widthSq: Int
    let urlT: String
    let heightT, widthT: Int
    let urlS: String
    let heightS, widthS: Int
    let urlQ: String
    let heightQ, widthQ: Int
    let urlM: String?
    let heightM, widthM: Int?
    let urlN: String
    let heightN, widthN: Int
    let urlZ: String?
    let heightZ, widthZ: Int?
    let urlC: String?
    let heightC, widthC: Int?
    let urlL: String?
    let heightL, widthL: Int?
    let pathalias: String?
    let originalsecret: String?
    let originalformat: Originalformat?
    let urlO: String?
    let heightO, widthO: Int?
    let oWidth, oHeight: String?

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, license, description, dateupload, lastupdate, datetaken, datetakengranularity, datetakenunknown, ownername, iconserver, iconfarm, views, tags
        case machineTags = "machine_tags"
        case latitude, longitude, accuracy, context
        case placeID = "place_id"
        case woeid
        case geoIsPublic = "geo_is_public"
        case geoIsContact = "geo_is_contact"
        case geoIsFriend = "geo_is_friend"
        case geoIsFamily = "geo_is_family"
        case media
        case mediaStatus = "media_status"
        case urlSq = "url_sq"
        case heightSq = "height_sq"
        case widthSq = "width_sq"
        case urlT = "url_t"
        case heightT = "height_t"
        case widthT = "width_t"
        case urlS = "url_s"
        case heightS = "height_s"
        case widthS = "width_s"
        case urlQ = "url_q"
        case heightQ = "height_q"
        case widthQ = "width_q"
        case urlM = "url_m"
        case heightM = "height_m"
        case widthM = "width_m"
        case urlN = "url_n"
        case heightN = "height_n"
        case widthN = "width_n"
        case urlZ = "url_z"
        case heightZ = "height_z"
        case widthZ = "width_z"
        case urlC = "url_c"
        case heightC = "height_c"
        case widthC = "width_c"
        case urlL = "url_l"
        case heightL = "height_l"
        case widthL = "width_l"
        case pathalias, originalsecret, originalformat
        case urlO = "url_o"
        case heightO = "height_o"
        case widthO = "width_o"
        case oWidth = "o_width"
        case oHeight = "o_height"
    }
}

enum Accuracy: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Accuracy.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Accuracy"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Description
struct Description: Codable {
    let content: String

    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}

enum Media: String, Codable {
    case photo = "photo"
}

enum MediaStatus: String, Codable {
    case ready = "ready"
}

enum Originalformat: String, Codable {
    case jpg = "jpg"
    case png = "png"
}

enum PlaceID: String, Codable {
    case empty = ""
    case s0OUvTTUrzPobQK = "s0oUv_tTUrzPobQK"
    case the7AMp1DQV7WCzSEQ = "7a.Mp1dQV7wCzSeQ"
}
