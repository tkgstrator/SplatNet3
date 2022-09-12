import XCTest
@testable import Alamofire
@testable import SplatNet2
@testable import SalmonStats
@testable import Common

final class SplatNetTests: XCTestCase {
    let sessionToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1YzFlMmMwMjg1MjRmMDYwIiwiaWF0IjoxNjYxMzkwNjEyLCJ0eXAiOiJzZXNzaW9uX3Rva2VuIiwiZXhwIjoxNzI0NDYyNjEyLCJhdWQiOiI3MWI5NjNjMWI3YjZkMTE5Iiwic3Q6c2NwIjpbMCw4LDksMTcsMjNdLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTYzMTY1MjQ0Mn0.A3BEP5W30CWj9Tyy4vY-IguxI1C6TLKkHItXAEa8uIs"
    let iksmSession: String = "3b78964054c63dcb76275fb2123acbf06cd74acb"
    let splatoonToken: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsIm1lbWJlcnNoaXAiOnsiYWN0aXZlIjp0cnVlfSwiYXVkIjoiZjQxN2UxdGlianFkOTFjaDk5dTQ5aXd6NXNuOWNoeTMiLCJleHAiOjE2NjE2MTY5NDQsImlhdCI6MTY2MTYwOTc0NCwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsInN1YiI6NjQ0NTQ1NzE2OTk3MzI0OCwidHlwIjoiaWRfdG9rZW4ifQ.951ll7aJpVJcBmbTenskx9JoOrWfKULh_wvejTRNo4g"
    let nickname: String = "にだいめえむいーです"
    let friendCode: String = "1384-4712-4713"
    let thumbnailURL: URL = URL(unsafeString: "https://cdn-image-e0d67c509fb203858ebcb2fe3f88c2aa.baas.nintendo.com/1/1f2fabc4585aa4d7")
    let nsaid: String = "91d160aa84e88da6"
    let session: SalmonStats = SalmonStats()

    /// イカスミセッション再生成してからアップロード
    func testResultWithExpiredToken() async throws {
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
        let session: SalmonStats = SalmonStats(account: account)
        let response: Results.Response = try await session.getCoopSummary()
        let resultId: Int = response.summary.card.jobNum
        let result: CoopResult.Response = try await session.getCoopResult(resultId: resultId)
        // 指定したリザルトIDとリザルトのバイトIDが一致しているかチェック
        XCTAssertEqual(resultId, result.jobId)
        let upload: UploadResult.Response = try await session.uploadResult(resultId: resultId)
        let salmonId: Int? = upload.results.first?.salmonId
        // SalmonIdが正しく返ってきていることのチェック
        XCTAssertNotNil(salmonId)
        // セッションが正しく更新できているかチェック
        XCTAssertNotEqual(account.credential.iksmSession, session.account?.credential.iksmSession)
    }

    /// リザルト取得してアップロード
    func testResult() async throws {
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
            timeInterval: 60
        )
        let session: SalmonStats = SalmonStats(account: account)
        let response: Results.Response = try await session.getCoopSummary()
        let resultId: Int = response.summary.card.jobNum
        let result: CoopResult.Response = try await session.getCoopResult(resultId: resultId)
        // 指定したリザルトIDとリザルトのバイトIDが一致しているかチェック
        XCTAssertEqual(resultId, result.jobId)
        let upload: UploadResult.Response = try await session.uploadResult(resultId: resultId)
        let salmonId: Int? = upload.results.first?.salmonId
        // SalmonIdが正しく返ってきていることのチェック
        XCTAssertNotNil(salmonId)
    }

    /// リザルト取得してアップロード
    func testResults() async throws {
        let response: Results.Response = try await session.getCoopSummary()
        let resultId: Int = response.summary.card.jobNum
        let result: CoopResult.Response = try await session.getCoopResult(resultId: resultId)
        // 指定したリザルトIDとリザルトのバイトIDが一致しているかチェック
        XCTAssertEqual(resultId, result.jobId)
        let upload: UploadResult.Response = try await session.uploadResult(resultId: resultId)
        let salmonId: Int? = upload.results.first?.salmonId
        // SalmonIdが正しく返ってきていることのチェック
        XCTAssertNotNil(salmonId)
    }

    func testRefresh() async throws {
        let response: UserInfo = try await session.refreshToken(sessionToken: sessionToken)
        XCTAssertEqual("91d160aa84e88da6", response.credential.nsaid)
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
        XCTAssertEqual(6445457169973248, splatoonToken.result.user.id)
        XCTAssertEqual("91d160aa84e88da6", splatoonToken.result.user.nsaId)
        let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken, version: version)
        XCTAssertEqual(0, splatoonAccessToken.status)
        let iksmSession: IksmSession.Response = try await session.getIksmSession(accessToken: splatoonAccessToken)
        XCTAssertEqual(splatoonToken.result.user.nsaId, iksmSession.nsaid)
        return
    }



    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }
}
