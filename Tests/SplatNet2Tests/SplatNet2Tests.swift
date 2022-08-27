import XCTest
@testable import SplatNet2
@testable import SalmonStats
@testable import Common

final class SplatNetTests: XCTestCase {
    let sessionToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1YzFlMmMwMjg1MjRmMDYwIiwiaWF0IjoxNjYxMzkwNjEyLCJ0eXAiOiJzZXNzaW9uX3Rva2VuIiwiZXhwIjoxNzI0NDYyNjEyLCJhdWQiOiI3MWI5NjNjMWI3YjZkMTE5Iiwic3Q6c2NwIjpbMCw4LDksMTcsMjNdLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTYzMTY1MjQ0Mn0.A3BEP5W30CWj9Tyy4vY-IguxI1C6TLKkHItXAEa8uIs"
    let session: SalmonStats = SalmonStats()
    let account: UserInfo = UserInfo(
        nickname: "にだいめえむいーです",
        membership: true,
        friendCode: "1384-4712-4713",
        thumbnailURL: URL(unsafeString: "https://cdn-image-e0d67c509fb203858ebcb2fe3f88c2aa.baas.nintendo.com/1/1f2fabc4585aa4d7"),
        nsaid: "91d160aa84e88da6",
        iksmSession: "3b78964054c63dcb76275fb2123acbf06cd74acb",
        sessionToken: "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1YzFlMmMwMjg1MjRmMDYwIiwiaWF0IjoxNjYxMzkwNjEyLCJ0eXAiOiJzZXNzaW9uX3Rva2VuIiwiZXhwIjoxNzI0NDYyNjEyLCJhdWQiOiI3MWI5NjNjMWI3YjZkMTE5Iiwic3Q6c2NwIjpbMCw4LDksMTcsMjNdLCJpc3MiOiJodHRwczovL2FjY291bnRzLm5pbnRlbmRvLmNvbSIsImp0aSI6OTYzMTY1MjQ0Mn0.A3BEP5W30CWj9Tyy4vY-IguxI1C6TLKkHItXAEa8uIs",
        splatoonToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc0NoaWxkUmVzdHJpY3RlZCI6ZmFsc2UsIm1lbWJlcnNoaXAiOnsiYWN0aXZlIjp0cnVlfSwiYXVkIjoiZjQxN2UxdGlianFkOTFjaDk5dTQ5aXd6NXNuOWNoeTMiLCJleHAiOjE2NjE2MTY5NDQsImlhdCI6MTY2MTYwOTc0NCwiaXNzIjoiYXBpLWxwMS56bmMuc3J2Lm5pbnRlbmRvLm5ldCIsInN1YiI6NjQ0NTQ1NzE2OTk3MzI0OCwidHlwIjoiaWRfdG9rZW4ifQ.951ll7aJpVJcBmbTenskx9JoOrWfKULh_wvejTRNo4g"
    )

    /// リザルト取得してアップロード
    func testResult() async throws {
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

    func testVersion() async throws {
        let response: XVersion.Response = try await session.getXProductVersion()
        XCTAssertEqual("2.2.0", response.results.first?.version)
    }

    func testRefresh() async throws {
        let response: UserInfo = try await session.refreshToken(sessionToken: sessionToken)
        XCTAssertEqual("91d160aa84e88da6", response.credential.nsaid)
        print(response)
    }

    func testCookie() async throws {
        let accessToken: AccessToken.Response = try await session.getAccessToken(sessionToken: sessionToken)
        XCTAssertEqual(900, accessToken.expiresIn)
        XCTAssertEqual("Bearer", accessToken.tokenType)
        let splatoonToken: SplatoonToken.Response = try await session.getSplatoonToken(accessToken: accessToken)
        XCTAssertEqual(0, splatoonToken.status)
        XCTAssertEqual(7200, splatoonToken.result.webApiServerCredential.expiresIn)
        XCTAssertEqual(3600, splatoonToken.result.firebaseCredential.expiresIn)
        XCTAssertEqual(6445457169973248, splatoonToken.result.user.id)
        XCTAssertEqual("91d160aa84e88da6", splatoonToken.result.user.nsaId)
        let splatoonAccessToken: SplatoonAccessToken.Response = try await session.getSplatoonAccessToken(accessToken: splatoonToken)
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
