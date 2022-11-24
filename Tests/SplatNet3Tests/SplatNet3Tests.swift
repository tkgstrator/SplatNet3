import XCTest
@testable import Alamofire
@testable import SplatNet3
@testable import Common

final class SplatNet3Tests: XCTestCase {
    let decoder: JSONDecoder = JSONDecoder()

    func getListContents(_ type: JSONType) -> [URL] {
        Bundle.module.urls(forResourcesWithExtension: "json", subdirectory: "JSON/\(type.rawValue)") ?? []
    }

    func testCoopHistory() throws {
        do {
            let paths: [URL] = getListContents(.CoopHistory)

            for path in paths {
                let data: Data = try Data(contentsOf: path)
                let response = try decoder.decode(CoopHistoryQuery.Response.self, from: data)
                dump(response)
            }
        } catch (let error) {
            print(error)
            throw error
        }
    }

    func testCoopHistoryDetail() throws {
        do {
            let paths: [URL] = getListContents(.CoopHistoryDetail)

            for path in paths {
                let data: Data = try Data(contentsOf: path)
                let _ = try decoder.decode(CoopHistoryDetailQuery.Response.self, from: data)
            }
        } catch (let error) {
            print(error)
            throw error
        }
    }
}

enum JSONType: String, CaseIterable, Codable {
    case CoopHistory
    case CoopHistoryDetail
    case FriendList
    case StageSchedule
    case Schedule
}
