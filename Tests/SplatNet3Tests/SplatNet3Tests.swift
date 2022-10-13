import XCTest
@testable import Alamofire
@testable import SplatNet3
@testable import Common

final class SplatNet3Tests: XCTestCase {
    let sessionToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJzdDpzY3AiOlswLDgsOSwxNywyM10sImlhdCI6MTY2MjcyMTg5OCwidHlwIjoic2Vzc2lvbl90b2tlbiIsInN1YiI6ImE4MzZhMWQ0NjI1YWZhYjQiLCJleHAiOjE3MjU3OTM4OTgsImF1ZCI6IjcxYjk2M2MxYjdiNmQxMTkiLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTc4NzkxMDI4Mn0.UUZ8l4neAp0nZPbcQU7EoUUo02GVI6pg1OeijE9zp1o"
    let iksmSession: String = "3b78964054c63dcb76275fb2123acbf06cd74acb"
    let bulletToken: String = "rdVwS9CqHMzdtY006X7zUz9P3iYFqwhOppZW_q6fn6ZOPW641sTAa1l5le3DNApqiyXQ3bx_-5sSmQTecVZmN-jvxp75TqHj3KRH7ZPXA3qIPEte7nJ3yc08R5U="
    let splatoonAccessToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IktTaS1qeGNBMi1ieGE1dVJJakxyczh1T3dubyIsImprdSI6Imh0dHBzOi8vYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldC92MS9XZWJTZXJ2aWNlL0NlcnRpZmljYXRlL0xpc3QifQ.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsImF1ZCI6IjY2MzM2NzcyOTE1NTI3NjgiLCJleHAiOjE2NjU0NjYyMTksImlhdCI6MTY2NTQ0MjgxOSwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsImp0aSI6IjZkMDZhY2I0LTQxMDQtNDA5NS05NGQxLTExYWQ0NTIxYjFiNiIsInN1YiI6NDczNzM2MDgzMTM4MTUwNCwibGlua3MiOnsibmV0d29ya1NlcnZpY2VBY2NvdW50Ijp7ImlkIjoiM2Y4OWMzNzkxYzQzZWE1NyJ9fSwidHlwIjoiaWRfdG9rZW4iLCJtZW1iZXJzaGlwIjp7ImFjdGl2ZSI6dHJ1ZX19.FQzZ8UcGvPsjCsc8tbUarALvqimqUT_hnvkHC6stCStwPYsLcLfCdUmZbKWnLRIs5C5fCIREXrbE_9C2TWU9HsdWXreLy7SVgNWTrzbsPwJtVFtht8tasbHYU9RSLEMDYDjzassHA7oTwgSDtDPbEW-vyYYhtKASaNDiB3Df4gO2xGXIhnYiSVwxQFcWm4yDhYikQIvdnZQTNWUn7P_JWsnLvMrwwSod_VErnxgKvMMxDO5EbOxpcn4zcv2SmfFTbAHJFB3Nqm20cJxXodsZsSrgc4MNIScQmlx9hTj0Gr0qE44GTdHVlUxuQ7k_1Mq5GjXbfIRdJDBOJ_Ct-wqZ5g"
    let splatoonToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsIm1lbWJlcnNoaXAiOnsiYWN0aXZlIjp0cnVlfSwiYXVkIjoiZjQxN2UxdGlianFkOTFjaDk5dTQ5aXd6NXNuOWNoeTMiLCJleHAiOjE2NjE2MTY5NDQsImlhdCI6MTY2MTYwOTc0NCwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsInN1YiI6NjQ0NTQ1NzE2OTk3MzI0OCwidHlwIjoiaWRfdG9rZW4ifQ.951ll7aJpVJcBmbTenskx9JoOrWfKULh_wvejTRNo4g"
    let nickname: String = "にだいめえむいーです"
    let friendCode: String = "1384-4712-4713"
    let thumbnailURL: URL = URL(unsafeString: "https://cdn-image-e0d67c509fb203858ebcb2fe3f88c2aa.baas.nintendo.com/1/1f2fabc4585aa4d7")
    let nsaid: String = "91d160aa84e88da6"

    let session: SplatNet3 = SplatNet3()

    let decoder: JSONDecoder = {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func testAppVersion() async throws {
        let response: Version.Response = try await session.getVersionFromAppStore()
        print(response)
    }

    func testExpiredIn() async throws {
        do {
            let jwt: JWT = try JWT(gameWebToken: splatoonAccessToken)
            print(jwt)
        } catch(let error) {
            print(error)
            throw error
        }
    }

    func testVersion() async throws {
        let account: UserInfo = UserInfo(
            nickname: nickname,
            membership: true,
            friendCode: friendCode,
            thumbnailURL: thumbnailURL,
            nsaid: nsaid,
            iksmSession: iksmSession,
            bulletToken: bulletToken,
            sessionToken: sessionToken,
            gameServiceToken: splatoonToken,
            gameWebToken: splatoonAccessToken,
            timeInterval: 0
        )
        let session: SplatNet3 = SplatNet3(account: account)
        let request: WebVersion = WebVersion()
        let response: WebVersion.Response = try await session.request(request)
        print(response)
    }

    func testAllCoopSchedule() async throws {
        do {
            let request: CoopSchedule = CoopSchedule()
            let response: [CoopSchedule.Response] = try await session.request(request)
            print(response)
        } catch(let error) {
            print(error)
            throw error
        }
    }

    func testLoadJSONForCoopHistoryDetail() throws {
        let data = Data(fileName: "000000", type: .CoopHistoryDetail)
        let result: CoopHistoryDetail.Response = try decoder.decode(CoopHistoryDetail.Response.self, from: data)
        print(result)
    }

    func testLoadJSONForCoopSchedule() throws {
        for fileName in ["000000", "000001"] {
            let data = Data(fileName: fileName, type: .Schedule)
            let result: [CoopSchedule.Response] = try decoder.decode([CoopSchedule.Response].self, from: data)
            print(result)
        }
    }

    func testLoadJSONForFriendList() throws {
        let data = Data(fileName: "000000", type: .FriendList)
        let result: FriendList.Response = try decoder.decode(FriendList.Response.self, from: data)
        print(result)
    }

    func testLoadJSONForCoopHistory() throws {
        let data = Data(fileName: "000000", type: .CoopHistory)
        let result: CoopHistory.Response = try decoder.decode(CoopHistory.Response.self, from: data)
        let nodes: [String] = result.data.coopResult.historyGroups.nodes.compactMap({ $0.startTime })
        dump(nodes)
    }

    func testLoadJSONForStageSchedule() async throws {
        do {
            let data = Data(fileName: "000000", type: .StageSchedule)
            let result: StageSchedule.Response = try decoder.decode(StageSchedule.Response.self, from: data)
            dump(result.data.coopGroupingSchedule.regularSchedules.nodes.map({ $0.asSplatNet2() }))
        } catch (let error) {
            print(error)
            throw error
        }
    }

    func testHistoryRecord() async throws {
        do {
            let account: UserInfo = UserInfo(
                nickname: nickname,
                membership: true,
                friendCode: friendCode,
                thumbnailURL: thumbnailURL,
                nsaid: nsaid,
                iksmSession: iksmSession,
                bulletToken: bulletToken,
                sessionToken: sessionToken,
                gameServiceToken: splatoonToken,
                gameWebToken: splatoonAccessToken,
                timeInterval: 0
            )
        let session: SplatNet3 = SplatNet3(account: account)
        let response = try await session.publish(HistoryRecord())
        } catch (let error) {
            print(error)
            throw error
        }
    }

    func testCoopResult() async throws {
        let account: UserInfo = UserInfo(
            nickname: nickname,
            membership: true,
            friendCode: friendCode,
            thumbnailURL: thumbnailURL,
            nsaid: nsaid,
            iksmSession: iksmSession,
            bulletToken: bulletToken,
            sessionToken: sessionToken,
            gameServiceToken: splatoonToken,
            gameWebToken: splatoonAccessToken,
            timeInterval: 0
        )
        let session: SplatNet3 = SplatNet3(account: account)
        let results: CoopHistory.Response = try await session.publish(CoopHistory())
        guard let lastPlayedId: String = results.data.coopResult.historyGroups.nodes.last?.historyDetails.nodes.last?.id else {
            throw Failure.API(error: NXError.API.content)
        }
        let request: CoopHistoryDetail = CoopHistoryDetail(id: lastPlayedId)

        do {
            let result: CoopHistoryDetail.Response = (try await session.publish(request))
        } catch(let error) {
            print(error)
            throw error
        }
    }

    func testCoopHistoryAsElement() async throws {
        do {
            let account: UserInfo = UserInfo(
                nickname: nickname,
                membership: true,
                friendCode: friendCode,
                thumbnailURL: thumbnailURL,
                nsaid: nsaid,
                iksmSession: iksmSession,
                bulletToken: bulletToken,
                sessionToken: sessionToken,
                gameServiceToken: splatoonToken,
                gameWebToken: splatoonAccessToken,
                timeInterval: 0
            )
            let session: SplatNet3 = SplatNet3(account: account)
            let resultId: String = "Q29vcEhpc3RvcnlEZXRhaWwtdS1hZ213am55Z2h2emJhYXZ0NW1tbToyMDIyMDkyM1QxMjI4MDNfMTdmYTQ2MDItODRmMy00YzIyLTg0MGMtMTVlNzBmODA2NDBl"
            let elements: [CoopHistoryElement] = try await session.getCoopResultIds(resultId: nil)
            print(elements.count)
            for element in elements {
                let result: SplatNet2.Result = try await session.getCoopResult(element: element)
                print(result.id.playTime)
            }
        } catch (let error) {
            print(error)
            throw error
        }
    }

    func testCoopHistory() async throws {
        do {
            let account: UserInfo = UserInfo(
                nickname: nickname,
                membership: true,
                friendCode: friendCode,
                thumbnailURL: thumbnailURL,
                nsaid: nsaid,
                iksmSession: iksmSession,
                bulletToken: bulletToken,
                sessionToken: sessionToken,
                gameServiceToken: splatoonToken,
                gameWebToken: splatoonAccessToken,
                timeInterval: 0
            )
            let session: SplatNet3 = SplatNet3(account: account)
            let request: CoopHistory = CoopHistory()
            let response: CoopHistory.Response = try await session.publish(request)
            print(response)
        } catch (let error) {
            print(error.localizedDescription)
            throw error
        }
    }

    func testFriendList() async throws {
        do {
            let account: UserInfo = UserInfo(
                nickname: nickname,
                membership: true,
                friendCode: friendCode,
                thumbnailURL: thumbnailURL,
                nsaid: nsaid,
                iksmSession: iksmSession,
                bulletToken: bulletToken,
                sessionToken: sessionToken,
                gameServiceToken: splatoonToken,
                gameWebToken: splatoonAccessToken,
                timeInterval: 0
            )
            let session: SplatNet3 = SplatNet3(account: account)
            let request: FriendList = FriendList()
            let response: FriendList.Response = try await session.publish(request)
            print(response)
        } catch (let error) {
            print(error.localizedDescription)
            throw error
        }
    }

    func testCookie() async throws {
        do {
            guard let result: XVersion.Information = (try await session.getVersion()).results.first else {
                throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 404))
            }
            let version: String = result.version
            let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: sessionToken)
            XCTAssertEqual(900, accessToken.expiresIn)
            XCTAssertEqual("Bearer", accessToken.tokenType)
            let iminkNSO: Imink.Response = try await session.getIminkToken(accessToken: accessToken)
            let splatoonToken: SplatoonToken.Response = try await session.getSplatoonToken(accessToken: accessToken, imink: iminkNSO, version: version)
            XCTAssertEqual(0, splatoonToken.status)
            XCTAssertEqual(7200, splatoonToken.result.webApiServerCredential.expiresIn)
            XCTAssertEqual(3600, splatoonToken.result.firebaseCredential.expiresIn)
            XCTAssertEqual(5144807127416832, splatoonToken.result.user.id)
            XCTAssertEqual("53b484d29d9e67d1", splatoonToken.result.user.nsaId)
            let iminkAPP: Imink.Response = try await session.getIminkToken(accessToken: splatoonToken)
            let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken, imink: iminkAPP, version: version)
            XCTAssertEqual(0, splatoonAccessToken.status)
            let bulletToken: BulletToken.Response = try await session.getBulletToken(accessToken: splatoonAccessToken)
            XCTAssertNotNil(bulletToken.bulletToken)
            debugPrint(bulletToken.bulletToken)
        } catch (let error) {
            print(error)
            throw error
        }
        return
    }

    /// エラーを返すテスト
    /// XProduct-Versionが低い場合、427エラーを返す
    func testCookieWithVersion() async throws {
        do {
            let version: String = "2.1.0"
            let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: sessionToken)
            XCTAssertEqual(900, accessToken.expiresIn)
            XCTAssertEqual("Bearer", accessToken.tokenType)
            let iminkNSO: Imink.Response = try await session.getIminkToken(accessToken: accessToken)
            let splatoonToken: SplatoonToken.Response = try await session.getSplatoonToken(accessToken: accessToken, imink: iminkNSO, version: version)
            XCTAssertEqual(0, splatoonToken.status)
            XCTAssertEqual(7200, splatoonToken.result.webApiServerCredential.expiresIn)
            XCTAssertEqual(3600, splatoonToken.result.firebaseCredential.expiresIn)
            XCTAssertEqual(5144807127416832, splatoonToken.result.user.id)
            XCTAssertEqual("53b484d29d9e67d1", splatoonToken.result.user.nsaId)
            let iminkAPP: Imink.Response = try await session.getIminkToken(accessToken: splatoonToken)
            let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken, imink: iminkAPP, version: version)
            XCTAssertEqual(0, splatoonAccessToken.status)
            let bulletToken: BulletToken.Response = try await session.getBulletToken(accessToken: splatoonAccessToken)
            XCTAssertNotNil(bulletToken.bulletToken)
            debugPrint(bulletToken.bulletToken)
        } catch (let error) {
            if let failure = error.asNXError {
                print(failure)
                XCTAssertEqual(failure.statusCode, 427)
                return
            }
            throw error
        }
        return
    }

    /// エラーを返すテスト
    /// Fが誤っていると、403エラーを返す
    func testCookieWithF() async throws {
        do {
            guard let result: XVersion.Information = (try await session.getVersion()).results.first else {
                throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 404))
            }
            let version: String = result.version
            let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: sessionToken)
            XCTAssertEqual(900, accessToken.expiresIn)
            XCTAssertEqual("Bearer", accessToken.tokenType)
            let response: Imink.Response = try await session.getIminkToken(accessToken: accessToken)
            let iminkNSO: Imink.Response = Imink.Response(f: String(response.f.shuffled()), requestId: response.requestId, timestamp: response.timestamp)
            let splatoonToken: SplatoonToken.Response = try await session.getSplatoonToken(accessToken: accessToken, imink: iminkNSO, version: version)
            XCTAssertEqual(0, splatoonToken.status)
            XCTAssertEqual(7200, splatoonToken.result.webApiServerCredential.expiresIn)
            XCTAssertEqual(3600, splatoonToken.result.firebaseCredential.expiresIn)
            XCTAssertEqual(5144807127416832, splatoonToken.result.user.id)
            XCTAssertEqual("53b484d29d9e67d1", splatoonToken.result.user.nsaId)
            let iminkAPP: Imink.Response = try await session.getIminkToken(accessToken: splatoonToken)
            let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken, imink: iminkAPP, version: version)
            XCTAssertEqual(0, splatoonAccessToken.status)
            let bulletToken: BulletToken.Response = try await session.getBulletToken(accessToken: splatoonAccessToken)
            XCTAssertNotNil(bulletToken.bulletToken)
            debugPrint(bulletToken.bulletToken)
        } catch (let error) {
            if let failure = error.asNXError {
                print(failure)
                XCTAssertEqual(failure.statusCode, 403)
                return
            }
            throw error
        }
        return
    }

    /// エラーを返すテスト
    /// タイムスタンプがズレていると、500エラーが返る
    func testCookieWithTimestamp() async throws {
        do {
            guard let result: XVersion.Information = (try await session.getVersion()).results.first else {
                throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 404))
            }
            let version: String = result.version
            let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: sessionToken)
            XCTAssertEqual(900, accessToken.expiresIn)
            XCTAssertEqual("Bearer", accessToken.tokenType)
            let responseNSO: Imink.Response = try await session.getIminkToken(accessToken: accessToken)
            let iminkNSO: Imink.Response = Imink.Response(f: responseNSO.f, requestId: responseNSO.requestId, timestamp: 0)
            let splatoonToken: SplatoonToken.Response = try await session.getSplatoonToken(accessToken: accessToken, imink: iminkNSO, version: version)
            XCTAssertEqual(0, splatoonToken.status)
            XCTAssertEqual(7200, splatoonToken.result.webApiServerCredential.expiresIn)
            XCTAssertEqual(3600, splatoonToken.result.firebaseCredential.expiresIn)
            XCTAssertEqual(5144807127416832, splatoonToken.result.user.id)
            XCTAssertEqual("53b484d29d9e67d1", splatoonToken.result.user.nsaId)
            let responseAPP: Imink.Response = try await session.getIminkToken(accessToken: accessToken)
            let iminkAPP: Imink.Response = Imink.Response(f: responseAPP.f, requestId: responseAPP.requestId, timestamp: 0)
            let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken, imink: iminkAPP, version: version)
            XCTAssertEqual(0, splatoonAccessToken.status)
            let bulletToken: BulletToken.Response = try await session.getBulletToken(accessToken: splatoonAccessToken)
            XCTAssertNotNil(bulletToken.bulletToken)
            debugPrint(bulletToken.bulletToken)
        } catch (let error) {
            if let failure = error.asNXError {
                print(failure)
                XCTAssertEqual(failure.statusCode, 403)
                return
            }
            throw error
        }
        return
    }
    /// エラーを返すテスト
    /// セッショントークンが誤っている場合、400エラーを返す
    func testCookieWithSessionToken() async throws {
        do {
            let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: "")
            XCTAssertEqual(900, accessToken.expiresIn)
        } catch (let error) {
            if let failure = error.asNXError {
                print(failure)
                XCTAssertEqual(failure.statusCode, 400)
                return
            }
            throw error
        }
        return
    }
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
