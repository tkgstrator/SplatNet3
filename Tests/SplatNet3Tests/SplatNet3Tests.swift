import XCTest
@testable import Alamofire
@testable import SplatNet3
@testable import Common

final class SplatNetTests: XCTestCase {
    let sessionToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJzdDpzY3AiOlswLDgsOSwxNywyM10sImlhdCI6MTY2MjcyMTg5OCwidHlwIjoic2Vzc2lvbl90b2tlbiIsInN1YiI6ImE4MzZhMWQ0NjI1YWZhYjQiLCJleHAiOjE3MjU3OTM4OTgsImF1ZCI6IjcxYjk2M2MxYjdiNmQxMTkiLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTc4NzkxMDI4Mn0.UUZ8l4neAp0nZPbcQU7EoUUo02GVI6pg1OeijE9zp1o"
    let iksmSession: String = "3b78964054c63dcb76275fb2123acbf06cd74acb"
    let bulletToken: String = "q_2w5H7fJtLbJ7a5PwZcx-LHFDGDYG_R-mKn_8grjdZ1wGI258gqINp8M-i6bzOA7sFBNJ77wZJxi0Hh9K4SF9QkwCFUoj5X4psUWDjZj-5fKR_7CP1_JRtb3aY="
    let splatoonToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsIm1lbWJlcnNoaXAiOnsiYWN0aXZlIjp0cnVlfSwiYXVkIjoiZjQxN2UxdGlianFkOTFjaDk5dTQ5aXd6NXNuOWNoeTMiLCJleHAiOjE2NjE2MTY5NDQsImlhdCI6MTY2MTYwOTc0NCwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsInN1YiI6NjQ0NTQ1NzE2OTk3MzI0OCwidHlwIjoiaWRfdG9rZW4ifQ.951ll7aJpVJcBmbTenskx9JoOrWfKULh_wvejTRNo4g"
    let nickname: String = "にだいめえむいーです"
    let friendCode: String = "1384-4712-4713"
    let thumbnailURL: URL = URL(unsafeString: "https://cdn-image-e0d67c509fb203858ebcb2fe3f88c2aa.baas.nintendo.com/1/1f2fabc4585aa4d7")
    let nsaid: String = "91d160aa84e88da6"

    let session: SplatNet3 = SplatNet3()

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
            timeInterval: 60
        )
        let session: SplatNet3 = SplatNet3(account: account)
        let results: CoopSummary.Response = try await session.publish(CoopSummary())
        guard let lastPlayedId: String = results.data.coopResult.historyGroups.nodes.last?.historyDetails.nodes.last?.id else {
            throw NXError.API.response
        }
        let request: CoopResult = CoopResult(id: lastPlayedId)

        do {
            let result: CoopResult.Result = (try await session.publish(request)).asSplatNet2()
            print(result)
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
        guard let result: XVersion.Information = (try await session.getVersion()).results.first else {
            throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: 404))
        }
        let version: String = result.version
        let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: sessionToken)
        XCTAssertEqual(900, accessToken.expiresIn)
        XCTAssertEqual("Bearer", accessToken.tokenType)
        let splatoonToken: SplatoonToken.Response = try await session.getSplatoonToken(accessToken: accessToken, version: version)
        XCTAssertEqual(0, splatoonToken.status)
        XCTAssertEqual(7200, splatoonToken.result.webApiServerCredential.expiresIn)
        XCTAssertEqual(3600, splatoonToken.result.firebaseCredential.expiresIn)
        XCTAssertEqual(5144807127416832, splatoonToken.result.user.id)
        XCTAssertEqual("53b484d29d9e67d1", splatoonToken.result.user.nsaId)
        let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken, version: version)
        XCTAssertEqual(0, splatoonAccessToken.status)
        let bulletToken: BulletToken.Response = try await session.getBulletToken(accessToken: splatoonAccessToken)
        XCTAssertNotNil(bulletToken.bulletToken)
        return
    }
}
