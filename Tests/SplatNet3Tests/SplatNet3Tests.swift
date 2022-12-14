import XCTest
@testable import Alamofire
@testable import SplatNet3

final class SplatNet3Tests: XCTestCase {
    let decoder: SPDecoder = SPDecoder()

    func getListContents(_ type: JSONType) -> [URL] {
        return Bundle.module.urls(forResourcesWithExtension: "json", subdirectory: "JSON/\(type.rawValue)") ?? []
    }

    func testCoopHistory() throws {
        do {
            let paths: [URL] = getListContents(.CoopHistory)
            for path in paths {
                print(path)
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
            let paths: [URL] = getListContents(.CoopHistoryDetail).sorted(by: { $0.absoluteString < $1.absoluteString })

            for path in paths {
                try autoreleasepool(invoking: {
                    print(path)
                    let data: Data = try Data(contentsOf: path)
                    let response = try decoder.decode(CoopHistoryDetailQuery.Response.self, from: data)
                })
            }
        } catch (let error) {
            print(error.localizedDescription)
            throw error
        }
    }

    func testFriendList() throws {
    }

    func testStageSchedule() throws {
        do {
            let paths: [URL] = getListContents(.StageSchedule).sorted(by: { $0.absoluteString < $1.absoluteString })

            for path in paths {
                try autoreleasepool(invoking: {
                    print(path)
                    let data: Data = try Data(contentsOf: path)
                    let response = try decoder.decode(StageScheduleQuery.Response.self, from: data)
                })
            }
        } catch (let error) {
            print(error.localizedDescription)
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
