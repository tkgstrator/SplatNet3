import XCTest
@testable import Alamofire
@testable import SplatNet3
@testable import Common

final class SplatNet3Tests: XCTestCase {
    let sessionToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJzdDpzY3AiOlswLDgsOSwxNywyM10sImlhdCI6MTY2MjcyMTg5OCwidHlwIjoic2Vzc2lvbl90b2tlbiIsInN1YiI6ImE4MzZhMWQ0NjI1YWZhYjQiLCJleHAiOjE3MjU3OTM4OTgsImF1ZCI6IjcxYjk2M2MxYjdiNmQxMTkiLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTc4NzkxMDI4Mn0.UUZ8l4neAp0nZPbcQU7EoUUo02GVI6pg1OeijE9zp1o"
    let iksmSession: String = "3b78964054c63dcb76275fb2123acbf06cd74acb"
    let bulletToken: String = "xkQQaqcDNCukmsNdl8TgSesNOjZ0pV9lTPwIkjp3Rprk3n_c_91OqOAQR_CMIyfKqZQ2GCZX7ers9fzykj_-qMoIW9ouI3Z7115cYid7_wUh1Eh2saonUpwkHY4="
    let splatoonToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsIm1lbWJlcnNoaXAiOnsiYWN0aXZlIjp0cnVlfSwiYXVkIjoiZjQxN2UxdGlianFkOTFjaDk5dTQ5aXd6NXNuOWNoeTMiLCJleHAiOjE2NjE2MTY5NDQsImlhdCI6MTY2MTYwOTc0NCwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsInN1YiI6NjQ0NTQ1NzE2OTk3MzI0OCwidHlwIjoiaWRfdG9rZW4ifQ.951ll7aJpVJcBmbTenskx9JoOrWfKULh_wvejTRNo4g"
    let nickname: String = "にだいめえむいーです"
    let friendCode: String = "1384-4712-4713"
    let thumbnailURL: URL = URL(unsafeString: "https://cdn-image-e0d67c509fb203858ebcb2fe3f88c2aa.baas.nintendo.com/1/1f2fabc4585aa4d7")
    let nsaid: String = "91d160aa84e88da6"

    let session: SplatNet3 = SplatNet3()

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
            splatoonToken: splatoonToken,
            timeInterval: 0
        )
        let session: SplatNet3 = SplatNet3(account: account)
        let request: WebVersion = WebVersion()
        let response: WebVersion.Response = try await session.request(request)
        print(response)
    }

    func testLoadJSON() throws {
        let decoder: JSONDecoder = {
            let decoder: JSONDecoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()

        // IDが数値ではないテストデータ
        let data = Data(fileName: "000000")
        let result: CoopResult.Response = try decoder.decode(CoopResult.Response.self, from: data)
        print(result)
    }

    func testReuest() async throws {
        let account: UserInfo = UserInfo(
            nickname: nickname,
            membership: true,
            friendCode: friendCode,
            thumbnailURL: thumbnailURL,
            nsaid: nsaid,
            iksmSession: iksmSession,
            bulletToken: bulletToken,
            sessionToken: sessionToken,
            splatoonToken: splatoonToken,
            timeInterval: 0
        )
        let session: SplatNet3 = SplatNet3(account: account)
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
            splatoonToken: splatoonToken,
            timeInterval: 0
        )
        let session: SplatNet3 = SplatNet3(account: account)
        let results: CoopSummary.Response = try await session.publish(CoopSummary())
        guard let lastPlayedId: String = results.data.coopResult.historyGroups.nodes.last?.historyDetails.nodes.last?.id else {
            throw Failure.API(error: NXError.API.content)
        }
        let request: CoopResult = CoopResult(id: lastPlayedId)

        do {
            let result: CoopResult.Response = (try await session.publish(request))
//            dump(result.asSplatNet2())
        } catch(let error) {
            print(error)
            throw error
        }
    }

    func testCoopSummary() async throws {
        let account: UserInfo = UserInfo(
            nickname: nickname,
            membership: true,
            friendCode: friendCode,
            thumbnailURL: thumbnailURL,
            nsaid: nsaid,
            iksmSession: iksmSession,
            bulletToken: nil,
            sessionToken: sessionToken,
            splatoonToken: splatoonToken,
            timeInterval: 0
        )
        let session: SplatNet3 = SplatNet3(account: account)
        let request: CoopSummary = CoopSummary()
        let response: CoopSummary.Response = try await session.publish(request)
        print(response)
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

extension Data {
    init(fileName: String) {
        if let path = Bundle.module.url(forResource: "JSON/\(fileName)", withExtension: "json"),
           let data = try? Data(contentsOf: path)
        {
            self = data
            return
        }
        self = Data("{}".utf8)
    }
}
