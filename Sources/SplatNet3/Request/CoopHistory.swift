//
//  CoopHistory.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire
import Common

public class CoopHistory: GraphQL {
    public typealias ResponseType = CoopHistory.Response

    public var parameters: Parameters?
    //  swiftlint:disable:next discouraged_optional_collection
    public var hash: SHA256Hash = .CoopHistoryQuery
    public var variables: [String: String] = [:]

    internal init() {}

    // MARK: - CoopSummary
    public struct Response: Codable {
        /// データ
        public let data: DataClass
    }

    // MARK: - DataClass
    public struct DataClass: Codable {
        /// サーモンランリザルト
        public let coopResult: CoopResult
    }

    // MARK: - CoopResult
    public struct CoopResult: Codable {
//        public let historyGroupsOnlyFirst: HistoryGroupsOnlyFirst
        /// 平均クリアWAVE数
        public let regularAverageClearWave: Double
        /// 称号
        public let regularGrade: Common.Grade
        /// 評価レート
        public let regularGradePoint: Int
        /// 月別ギア
        public let monthlyGear: MonthlyGear
        /// ウロコ
        public let scale: Common.Scale
        /// ポイントカード
        public let pointCard: PointCard
        /// ヒストリーグループ
        public let historyGroups: HistoryGroups
    }

    // MARK: - HistoryGroups
    public struct HistoryGroups: Codable {
        /// ノード
        public let nodes: [HistoryGroupsNode]
    }

    // MARK: - HistoryGroupsNode
    public struct HistoryGroupsNode: Codable {
        /// 開始時間
        public let startTime: String?
        /// 終了時間
        public let endTime: String?
        /// モード
        public let mode: Common.Mode
        /// ルール
        public let rule: Common.Rule
        /// 最高記録
        public let highestResult: HighestResult?
        /// 履歴詳細
        public var historyDetails: HistoryDetails
    }

    // MARK: - HighestResult
    public struct HighestResult: Codable {
        /// 称号
        public let grade: Common.Grade
        /// 評価レート
        public let gradePoint: Int
        /// クマサンポイント
        public let jobScore: Int
    }

    // MARK: - HistoryDetails
    public struct HistoryDetails: Codable {
        /// 履歴詳細
        public var nodes: [HistoryDetailNode]
    }

    // MARK: - HistoryDetailNode
    public struct HistoryDetailNode: Codable {
        /// 識別ID
        public let id: String
        // ブキリスト
        public let weapons: [Weapon]
        /// 次のリザルト
        public let nextHistoryDetail: HistoryDetail?
        /// 前のリザルト
        public let previousHistoryDetail: HistoryDetail?
        /// クリアしたWAVE数
        public let resultWave: Int
        /// ステージ
        public let coopStage: Common.CoopStage
        /// 称号
        public let afterGrade: Common.Grade?
        /// 評価レート
        public let afterGradePoint: Int?
        /// 評価レート差分
        public let gradePointDiff: GradePointDiff?
        /// オカシラシャケリザルト
        public let bossResult: Common.BossResult?
        /// 個人リザルト
        public let myResult: Result
        /// メンバーリザルト
        public let memberResults: [Result]
        /// WAVEリザルト
        public let waveResults: [WaveResult]
    }

    public enum GradePointDiff: String, Codable {
        case down   = "DOWN"
        case keep   = "KEEP"
        case up     = "UP"
    }

    // MARK: - Result
    public struct Result: Codable {
        /// イクラ数
        public let deliverCount: Int
        /// 金イクラ数
        public let goldenDeliverCount: Int
    }

    // MARK: - NextHistoryDetailElement
    public struct HistoryDetail: Codable {
        /// 識別ID
        public let id: String
    }

    // MARK: - WaveResult
    public struct WaveResult: Codable {
        /// WAVE識別ID
        public let waveNumber: Int
    }

    // MARK: - Weapon
    public struct Weapon: Codable {
        /// 名前
        public let name: String
        /// 画像
        public let image: Image
    }

    // MARK: - Image
    public struct Image: Codable {
        @URLRawValue public var url: String
    }

    // MARK: - MonthlyGear
    public struct MonthlyGear: Codable {
        /// タイプネーム
        public let typename: String
        /// 名前
        public let name: String
        /// 画像
        public let image: Image

        enum CodingKeys: String, CodingKey {
            case typename = "__typename"
            case name = "name"
            case image = "image"
        }
    }

    // MARK: - PointCard
    public struct PointCard: Codable {
        /// オオモノシャケ討伐数
        public let defeatBossCount: Int
        /// イクラ数
        public let deliverCount: Int
        /// 金イクラ数
        public let goldenDeliverCount: Int
        /// バイト回数
        public let playCount: Int
        /// 救助回数
        public let rescueCount: Int
        /// クマサンポイント
        public let regularPoint: Int
        /// 総クマサンポイント
        public let totalPoint: Int
    }
}
