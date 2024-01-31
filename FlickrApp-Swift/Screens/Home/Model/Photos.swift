
import Foundation

struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

