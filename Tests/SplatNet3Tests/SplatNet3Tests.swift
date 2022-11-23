import XCTest
@testable import Alamofire
@testable import SplatNet3
@testable import Common

final class SplatNet3Tests: XCTestCase {
}

enum JSONType: String, CaseIterable, Codable {
    case CoopHistory
    case CoopHistoryDetail
    case FriendList
    case StageSchedule
    case Schedule
}

extension Data {
    init(fileName: String, type: JSONType) {
        if let path = Bundle.module.url(forResource: "JSON/\(type.rawValue)/\(fileName)", withExtension: "json"),
           let data = try? Data(contentsOf: path)
        {
            self = data
            return
        }
        self = Data("{}".utf8)
    }
}
