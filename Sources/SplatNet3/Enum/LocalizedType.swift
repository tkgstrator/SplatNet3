//
//  LocalizedType.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum LocalizedType: String, CaseIterable {
	public var localized: String { NSLocalizedString(rawValue, bundle: .module, comment: "") }
	/// テッキュウ
	case SakeArtillery = "SakeArtillery"
	/// ドロシャケ
	case SakeBigMouth = "SakeBigMouth"
	/// ドロシャケ
	case SakeBigMouthGold = "SakeBigMouthGold"
	/// シャケコプター
	case SakeCopter = "SakeCopter"
	/// ダイバー
	case SakeDolphin = "SakeDolphin"
	/// タマヒロイ
	case SakeFlyBagman = "SakeFlyBagman"
	/// ハシラ
	case SakePillar = "SakePillar"
	/// ナベブタ
	case SakeSaucer = "SakeSaucer"
	/// モグラ
	case Sakediver = "Sakediver"
	/// グリル
	case Sakedozer = "Sakedozer"
	/// バクダン
	case SakelienBomber = "SakelienBomber"
	/// カタパッド
	case SakelienCupTwins = "SakelienCupTwins"
	/// ヨコヅナ
	case SakelienGiant = "SakelienGiant"
	/// キンシャケ
	case SakelienGolden = "SakelienGolden"
	/// ドスコイ
	case SakelienLarge = "SakelienLarge"
	/// テッパン
	case SakelienShield = "SakelienShield"
	/// コジャケ
	case SakelienSmall = "SakelienSmall"
	/// ヘビ
	case SakelienSnake = "SakelienSnake"
	/// シャケ
	case SakelienStandard = "SakelienStandard"
	/// タワー
	case SakelienTower = "SakelienTower"
	/// コウモリ
	case Sakerocket = "Sakerocket"
	/// かけだし
	case Grade_00 = "Grade_00"
	/// はんにんまえ
	case Grade_01 = "Grade_01"
	/// いちにんまえ
	case Grade_02 = "Grade_02"
	/// じゅくれん
	case Grade_03 = "Grade_03"
	/// たつじん
	case Grade_04 = "Grade_04"
	/// たつじん＋１
	case Grade_05 = "Grade_05"
	/// たつじん＋２
	case Grade_06 = "Grade_06"
	/// たつじん＋３
	case Grade_07 = "Grade_07"
	/// でんせつ
	case Grade_08 = "Grade_08"
	/// かけだし アルバイター
	case Grade_Arbeiter_00 = "Grade_Arbeiter_00"
	/// はんにんまえ アルバイター
	case Grade_Arbeiter_01 = "Grade_Arbeiter_01"
	/// いちにんまえ アルバイター
	case Grade_Arbeiter_02 = "Grade_Arbeiter_02"
	/// じゅくれん アルバイター
	case Grade_Arbeiter_03 = "Grade_Arbeiter_03"
	/// たつじん アルバイター
	case Grade_Arbeiter_04 = "Grade_Arbeiter_04"
	/// たつじん＋１ アルバイター
	case Grade_Arbeiter_05 = "Grade_Arbeiter_05"
	/// たつじん＋２ アルバイター
	case Grade_Arbeiter_06 = "Grade_Arbeiter_06"
	/// たつじん＋３ アルバイター
	case Grade_Arbeiter_07 = "Grade_Arbeiter_07"
	/// でんせつ アルバイター
	case Grade_Arbeiter_08 = "Grade_Arbeiter_08"
	/// スメーシーワールド
	case Cop_Carousel = "Cop_Carousel"
	/// ムニ・エール海洋発電所
	case Cop_Shakedent = "Cop_Shakedent"
	/// 難破船ドン・ブラコ
	case Cop_Shakeship = "Cop_Shakeship"
	/// アラマキ砦
	case Cop_Shakespiral = "Cop_Shakespiral"
	/// シェケナダム
	case Cop_Shakeup = "Cop_Shakeup"
	/// アラマキ砦
	case Cop_Tutorial = "Cop_Tutorial"
	/// ？？？
	case Cop_Unknown = "Cop_Unknown"
	/// クマサン印のブラスター
	case Blaster_Bear_Coop = "Blaster_Bear_Coop"
	/// Rブラスターエリート
	case Blaster_LightLong_00 = "Blaster_LightLong_00"
	/// クラッシュブラスター
	case Blaster_LightShort_00 = "Blaster_LightShort_00"
	/// ラピッドブラスター
	case Blaster_Light_00 = "Blaster_Light_00"
	/// ロングブラスター
	case Blaster_Long_00 = "Blaster_Long_00"
	/// ホットブラスター
	case Blaster_Middle_00 = "Blaster_Middle_00"
	/// ノヴァブラスター
	case Blaster_Short_00 = "Blaster_Short_00"
	/// パブロ
	case Brush_Mini_00 = "Brush_Mini_00"
	/// ホクサイ
	case Brush_Normal_00 = "Brush_Normal_00"
	/// クマサン印のチャージャー
	case Charger_Bear_Coop = "Charger_Bear_Coop"
	/// ソイチューバー
	case Charger_Keeper_00 = "Charger_Keeper_00"
	/// 14式竹筒銃・甲
	case Charger_Light_00 = "Charger_Light_00"
	/// 4Kスコープ
	case Charger_LongScope_00 = "Charger_LongScope_00"
	/// リッター4K
	case Charger_Long_00 = "Charger_Long_00"
	/// スプラスコープ
	case Charger_NormalScope_00 = "Charger_NormalScope_00"
	/// スプラチャージャー
	case Charger_Normal_00 = "Charger_Normal_00"
	/// R-PEN/5H
	case Charger_Pencil_00 = "Charger_Pencil_00"
	/// スクイックリンα
	case Charger_Quick_00 = "Charger_Quick_00"
	/// デュアルスイーパー
	case Maneuver_Dual_00 = "Maneuver_Dual_00"
	/// ケルビン525
	case Maneuver_Gallon_00 = "Maneuver_Gallon_00"
	/// スプラマニューバー
	case Maneuver_Normal_00 = "Maneuver_Normal_00"
	/// スパッタリー
	case Maneuver_Short_00 = "Maneuver_Short_00"
	/// クアッドホッパーブラック
	case Maneuver_Stepper_00 = "Maneuver_Stepper_00"
	/// カーボンローラー
	case Roller_Compact_00 = "Roller_Compact_00"
	/// ダイナモローラー
	case Roller_Heavy_00 = "Roller_Heavy_00"
	/// ヴァリアブルローラー
	case Roller_Hunter_00 = "Roller_Hunter_00"
	/// スプラローラー
	case Roller_Normal_00 = "Roller_Normal_00"
	/// ワイドローラー
	case Roller_Wide_00 = "Roller_Wide_00"
	/// クマサン印のワイパー
	case Saber_Bear_Coop = "Saber_Bear_Coop"
	/// ドライブワイパー
	case Saber_Lite_00 = "Saber_Lite_00"
	/// ジムワイパー
	case Saber_Normal_00 = "Saber_Normal_00"
	/// クマサン印のシェルター
	case Shelter_Bear_Coop = "Shelter_Bear_Coop"
	/// スパイガジェット
	case Shelter_Compact_00 = "Shelter_Compact_00"
	/// パラシェルター
	case Shelter_Normal_00 = "Shelter_Normal_00"
	/// キャンピングシェルター
	case Shelter_Wide_00 = "Shelter_Wide_00"
	/// プロモデラーMG
	case Shooter_Blaze_00 = "Shooter_Blaze_00"
	/// プライムシューター
	case Shooter_Expert_00 = "Shooter_Expert_00"
	/// わかばシューター
	case Shooter_First_00 = "Shooter_First_00"
	/// ボトルガイザー
	case Shooter_Flash_00 = "Shooter_Flash_00"
	/// .52ガロン
	case Shooter_Gravity_00 = "Shooter_Gravity_00"
	/// .96ガロン
	case Shooter_Heavy_00 = "Shooter_Heavy_00"
	/// ジェットスイーパー
	case Shooter_Long_00 = "Shooter_Long_00"
	/// ヒーローシューターLv1
	case Shooter_MissionLv1_00 = "Shooter_MissionLv1_00"
	/// ヒーローシューターLv2
	case Shooter_MissionLv2_00 = "Shooter_MissionLv2_00"
	/// ヒーローシューターLv3
	case Shooter_MissionLv3_00 = "Shooter_MissionLv3_00"
	/// スプラシューター
	case Shooter_Normal_00 = "Shooter_Normal_00"
	/// シャープマーカー
	case Shooter_Precision_00 = "Shooter_Precision_00"
	/// スペースシューター
	case Shooter_QuickLong_00 = "Shooter_QuickLong_00"
	/// N-ZAP85
	case Shooter_QuickMiddle_00 = "Shooter_QuickMiddle_00"
	/// ボールドマーカー
	case Shooter_Short_00 = "Shooter_Short_00"
	/// H3リールガン
	case Shooter_TripleMiddle_00 = "Shooter_TripleMiddle_00"
	/// L3リールガン
	case Shooter_TripleQuick_00 = "Shooter_TripleQuick_00"
	/// オーバーフロッシャー
	case Slosher_Bathtub_00 = "Slosher_Bathtub_00"
	/// クマサン印のスロッシャー
	case Slosher_Bear_Coop = "Slosher_Bear_Coop"
	/// ヒッセン
	case Slosher_Diffusion_00 = "Slosher_Diffusion_00"
	/// スクリュースロッシャー
	case Slosher_Launcher_00 = "Slosher_Launcher_00"
	/// バケットスロッシャー
	case Slosher_Strong_00 = "Slosher_Strong_00"
	/// エクスプロッシャー
	case Slosher_Washtub_00 = "Slosher_Washtub_00"
	/// クーゲルシュライバー
	case Spinner_Downpour_00 = "Spinner_Downpour_00"
	/// ハイドラント
	case Spinner_Hyper_00 = "Spinner_Hyper_00"
	/// スプラスピナー
	case Spinner_Quick_00 = "Spinner_Quick_00"
	/// ノーチラス47
	case Spinner_Serein_00 = "Spinner_Serein_00"
	/// バレルスピナー
	case Spinner_Standard_00 = "Spinner_Standard_00"
	/// クマサン印のストリンガー
	case Stringer_Bear_Coop = "Stringer_Bear_Coop"
	/// トライストリンガー
	case Stringer_Normal_00 = "Stringer_Normal_00"
	/// LACT-450
	case Stringer_Short_00 = "Stringer_Short_00"
	/// カニタンク
	case SpChariot_Coop = "SpChariot_Coop"
	/// ジェットパック
	case SpJetpack_Coop = "SpJetpack_Coop"
	/// メガホンレーザー5.1ch
	case SpMicroLaser_Coop = "SpMicroLaser_Coop"
	/// ナイスダマ
	case SpNiceBall_Coop = "SpNiceBall_Coop"
	/// ホップソナー
	case SpShockSonar_Coop = "SpShockSonar_Coop"
	/// サメライド
	case SpSkewer_Coop = "SpSkewer_Coop"
	/// スーパーチャクチ
	case SpSuperLanding_Coop = "SpSuperLanding_Coop"
	/// トリプルトルネード
	case SpTripleTornado_Coop = "SpTripleTornado_Coop"
	/// ウルトラショット
	case SpUltraShot_Coop = "SpUltraShot_Coop"
	/// とじる
	case L_Bottom_00_T_Info_00 = "L_Bottom_00_T_Info_00"
	/// もどる
	case L_Bottom_01_T_Info_00 = "L_Bottom_01_T_Info_00"
	/// もどる
	case L_Bottom_02_T_Info_00 = "L_Bottom_02_T_Info_00"
	/// もどる
	case L_Bottom_03_T_Info_00 = "L_Bottom_03_T_Info_00"
	/// もどる
	case L_Bottom_04_T_Info_00 = "L_Bottom_04_T_Info_00"
	/// カスタマイズ
	case L_Bottom_05_T_Info_00 = "L_Bottom_05_T_Info_00"
	/// もどる
	case L_Bottom_08_T_Info_00 = "L_Bottom_08_T_Info_00"
	/// カードリスト
	case L_BtnCard_00_T_BlackText_00 = "L_BtnCard_00_T_BlackText_00"
	/// カードリスト
	case L_BtnCard_00_T_WhiteText_00 = "L_BtnCard_00_T_WhiteText_00"
	/// もっと見る
	case L_BtnCatalog_00_T_BlackText_00 = "L_BtnCatalog_00_T_BlackText_00"
	/// もっと見る
	case L_BtnCatalog_00_T_WhiteText_00 = "L_BtnCatalog_00_T_WhiteText_00"
	/// フェスマッチ
	case L_BtnFestStage_00_T_BlackText_00 = "L_BtnFestStage_00_T_BlackText_00"
	/// フェスマッチ
	case L_BtnFestStage_00_T_WhiteText_00 = "L_BtnFestStage_00_T_WhiteText_00"
	/// トリカラマッチ
	case L_BtnFestStage_01_T_BlackText_00 = "L_BtnFestStage_01_T_BlackText_00"
	/// トリカラマッチ
	case L_BtnFestStage_01_T_WhiteText_00 = "L_BtnFestStage_01_T_WhiteText_00"
	/// SALMON  RUN
	case L_BtnFestStage_02_T_BlackText_00 = "L_BtnFestStage_02_T_BlackText_00"
	/// SALMON  RUN
	case L_BtnFestStage_02_T_WhiteText_00 = "L_BtnFestStage_02_T_WhiteText_00"
	/// ロビー
	case L_BtnMapL_00_T_BlackText_00 = "L_BtnMapL_00_T_BlackText_00"
	/// ロビー
	case L_BtnMapL_00_T_WhiteText_00 = "L_BtnMapL_00_T_WhiteText_00"
	/// 広場
	case L_BtnMap_01_T_Text_00 = "L_BtnMap_01_T_Text_00"
	/// イカッチャ
	case L_BtnMap_03_T_Text_00 = "L_BtnMap_03_T_Text_00"
	/// クマサン商会
	case L_BtnMap_04_T_Text_00 = "L_BtnMap_04_T_Text_00"
	/// ブキ屋
	case L_BtnMap_05_T_Text_00 = "L_BtnMap_05_T_Text_00"
	/// アタマ屋
	case L_BtnMap_06_T_Text_00 = "L_BtnMap_06_T_Text_00"
	/// フク屋
	case L_BtnMap_07_T_Text_00 = "L_BtnMap_07_T_Text_00"
	/// クツ屋
	case L_BtnMap_08_T_Text_00 = "L_BtnMap_08_T_Text_00"
	/// ザッカ屋
	case L_BtnMap_09_T_Text_00 = "L_BtnMap_09_T_Text_00"
	/// 変更する
	case L_BtnNpl_00_T_Edit_00 = "L_BtnNpl_00_T_Edit_00"
	/// ノーマル
	case L_BtnOption_00_T_BtnL_00 = "L_BtnOption_00_T_BtnL_00"
	/// リバース
	case L_BtnOption_00_T_BtnR_00 = "L_BtnOption_00_T_BtnR_00"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]上下操作
	case L_BtnOption_00_T_Header_00 = "L_BtnOption_00_T_Header_00"
	/// ジャイロ操作がONのときは無効です
	case L_BtnOption_00_T_Msg_00 = "L_BtnOption_00_T_Msg_00"
	/// ノーマル
	case L_BtnOption_01_T_BtnL_00 = "L_BtnOption_01_T_BtnL_00"
	/// リバース
	case L_BtnOption_01_T_BtnR_00 = "L_BtnOption_01_T_BtnR_00"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]左右操作
	case L_BtnOption_01_T_Header_00 = "L_BtnOption_01_T_Header_00"
	/// ON
	case L_BtnOption_02_T_BtnL_00 = "L_BtnOption_02_T_BtnL_00"
	/// OFF
	case L_BtnOption_02_T_BtnR_00 = "L_BtnOption_02_T_BtnR_00"
	/// ジャイロ操作
	case L_BtnOption_02_T_Header_00 = "L_BtnOption_02_T_Header_00"
	/// ノーマル
	case L_BtnOption_03_T_BtnL_00 = "L_BtnOption_03_T_BtnL_00"
	/// リバース
	case L_BtnOption_03_T_BtnR_00 = "L_BtnOption_03_T_BtnR_00"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]上下操作
	case L_BtnOption_03_T_Header_00 = "L_BtnOption_03_T_Header_00"
	/// ジャイロ操作がONのときは無効です
	case L_BtnOption_03_T_Msg_00 = "L_BtnOption_03_T_Msg_00"
	/// ノーマル
	case L_BtnOption_04_T_BtnL_00 = "L_BtnOption_04_T_BtnL_00"
	/// リバース
	case L_BtnOption_04_T_BtnR_00 = "L_BtnOption_04_T_BtnR_00"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]左右操作
	case L_BtnOption_04_T_Header_00 = "L_BtnOption_04_T_Header_00"
	/// ON
	case L_BtnOption_05_T_BtnL_00 = "L_BtnOption_05_T_BtnL_00"
	/// OFF
	case L_BtnOption_05_T_BtnR_00 = "L_BtnOption_05_T_BtnR_00"
	/// ジャイロ操作
	case L_BtnOption_05_T_Header_00 = "L_BtnOption_05_T_Header_00"
	/// 表示ON
	case L_BtnOption_06_T_BtnL_00 = "L_BtnOption_06_T_BtnL_00"
	/// 表示OFF
	case L_BtnOption_06_T_BtnR_00 = "L_BtnOption_06_T_BtnR_00"
	/// 投稿の表示
	case L_BtnOption_06_T_Header_00 = "L_BtnOption_06_T_Header_00"
	/// みまもり設定で制限されています
	case L_BtnOption_06_T_Msg_00 = "L_BtnOption_06_T_Msg_00"
	/// OFF
	case L_BtnOption_07_T_BtnL_00 = "L_BtnOption_07_T_BtnL_00"
	/// ON
	case L_BtnOption_07_T_BtnR_00 = "L_BtnOption_07_T_BtnR_00"
	/// 色覚サポート
	case L_BtnOption_07_T_Header_00 = "L_BtnOption_07_T_Header_00"
	/// 送信ON
	case L_BtnOption_08_T_BtnL_00 = "L_BtnOption_08_T_BtnL_00"
	/// 送信OFF
	case L_BtnOption_08_T_BtnR_00 = "L_BtnOption_08_T_BtnR_00"
	/// ロビーへの通知
	case L_BtnOption_08_T_Header_00 = "L_BtnOption_08_T_Header_00"
	/// レギュラーマッチ
	case L_BtnStage_00_T_BlackText_00 = "L_BtnStage_00_T_BlackText_00"
	/// レギュラーマッチ
	case L_BtnStage_00_T_WhiteText_00 = "L_BtnStage_00_T_WhiteText_00"
	/// バンカラマッチ[size=75%]（チャレンジ）[size=100%]
	case L_BtnStage_01_T_BlackText_00 = "L_BtnStage_01_T_BlackText_00"
	/// バンカラマッチ[size=75%]（チャレンジ）[size=100%]
	case L_BtnStage_01_T_WhiteText_00 = "L_BtnStage_01_T_WhiteText_00"
	/// Xマッチ
	case L_BtnStage_02_T_BlackText_00 = "L_BtnStage_02_T_BlackText_00"
	/// Xマッチ
	case L_BtnStage_02_T_WhiteText_00 = "L_BtnStage_02_T_WhiteText_00"
	/// SALMON  RUN
	case L_BtnStage_04_T_BlackText_00 = "L_BtnStage_04_T_BlackText_00"
	/// SALMON  RUN
	case L_BtnStage_04_T_WhiteText_00 = "L_BtnStage_04_T_WhiteText_00"
	/// バンカラマッチ[size=75%]（オープン）[size=100%]
	case L_BtnStage_05_T_BlackText_00 = "L_BtnStage_05_T_BlackText_00"
	/// バンカラマッチ[size=75%]（オープン）[size=100%]
	case L_BtnStage_05_T_WhiteText_00 = "L_BtnStage_05_T_WhiteText_00"
	/// MAX
	case L_Catalog_00_T_Max_00 = "L_Catalog_00_T_Max_00"
	/// カタログレベル
	case L_Catalog_00_T_Rank_00 = "L_Catalog_00_T_Rank_00"
	/// ジャイロ操作感度
	case L_GaugeOption_00_T_Header_00 = "L_GaugeOption_00_T_Header_00"
	/// ジャイロ操作がOFFのときは無効です
	case L_GaugeOption_00_T_Msg_00 = "L_GaugeOption_00_T_Msg_00"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]操作感度
	case L_GaugeOption_01_T_Header_00 = "L_GaugeOption_01_T_Header_00"
	/// ジャイロ操作感度
	case L_GaugeOption_02_T_Header_00 = "L_GaugeOption_02_T_Header_00"
	/// ジャイロ操作がOFFのときは無効です
	case L_GaugeOption_02_T_Msg_00 = "L_GaugeOption_02_T_Msg_00"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]操作感度
	case L_GaugeOption_03_T_Header_00 = "L_GaugeOption_03_T_Header_00"
	/// 次のアイテム
	case L_NextItem_00_T_NextItem_00 = "L_NextItem_00_T_NextItem_00"
	/// TVモード/テーブルモード
	case L_Option_00_T_BlackText_00 = "L_Option_00_T_BlackText_00"
	/// TVモード/テーブルモード
	case L_Option_00_T_WhiteText_00 = "L_Option_00_T_WhiteText_00"
	/// 携帯モード
	case L_Option_01_T_BlackText_00 = "L_Option_01_T_BlackText_00"
	/// 携帯モード
	case L_Option_01_T_WhiteText_00 = "L_Option_01_T_WhiteText_00"
	/// その他
	case L_Option_02_T_BlackText_00 = "L_Option_02_T_BlackText_00"
	/// その他
	case L_Option_02_T_WhiteText_00 = "L_Option_02_T_WhiteText_00"
	/// プレイヤー設定
	case L_PlayerEdit_00_T_BlackText_00 = "L_PlayerEdit_00_T_BlackText_00"
	/// プレイヤー設定
	case L_PlayerEdit_00_T_WhiteText_00 = "L_PlayerEdit_00_T_WhiteText_00"
	/// そうび
	case L_Player_00_T_BlackText_00 = "L_Player_00_T_BlackText_00"
	/// そうび
	case L_Player_00_T_WhiteText_00 = "L_Player_00_T_WhiteText_00"
	/// カタログ
	case L_Player_01_T_BlackText_00 = "L_Player_01_T_BlackText_00"
	/// カタログ
	case L_Player_01_T_WhiteText_00 = "L_Player_01_T_WhiteText_00"
	/// ギアパワー
	case L_Player_02_T_BlackText_00 = "L_Player_02_T_BlackText_00"
	/// ギアパワー
	case L_Player_02_T_WhiteText_00 = "L_Player_02_T_WhiteText_00"
	/// ナワバトラー
	case L_Player_03_T_BlackText_00 = "L_Player_03_T_BlackText_00"
	/// ナワバトラー
	case L_Player_03_T_WhiteText_00 = "L_Player_03_T_WhiteText_00"
	/// MAX
	case L_RankMng_00_T_Max_01 = "L_RankMng_00_T_Max_01"
	/// ナワバトランク
	case L_RankMng_00_T_RankHeader_01 = "L_RankMng_00_T_RankHeader_01"
	/// MAX
	case L_Rank_00_T_Max_00 = "L_Rank_00_T_Max_00"
	/// ランク
	case L_Rank_00_T_RankHeader_00 = "L_Rank_00_T_RankHeader_00"
	/// つぎ
	case L_Stage_01_T_Mode_01 = "L_Stage_01_T_Mode_01"
	/// そのつぎ
	case L_Stage_02_T_Mode_01 = "L_Stage_02_T_Mode_01"
	/// いま
	case L_Stage_03_T_Mode_00 = "L_Stage_03_T_Mode_00"
	/// マップ
	case L_Tab_00_T_Text_00 = "L_Tab_00_T_Text_00"
	/// ステージ情報
	case L_Tab_01_T_Text_00 = "L_Tab_01_T_Text_00"
	/// プレイヤー情報
	case L_Tab_02_T_Text_00 = "L_Tab_02_T_Text_00"
	/// オプション
	case L_Tab_03_T_Text_00 = "L_Tab_03_T_Text_00"
	/// カタログは ザッカ屋でゲットできます
	case T_Catalog_00 = "T_Catalog_00"
	/// 持っているかけらの数
	case T_Count_01 = "T_Count_01"
	/// テレビ画面に映したり Switch本体を置いてプレイするときのカメラオプションを設定できます
	case T_ExplainCamera_00 = "T_ExplainCamera_00"
	/// Switch本体を持ってプレイするときのカメラオプションを設定できます
	case T_ExplainCamera_01 = "T_ExplainCamera_01"
	/// インターネット対戦などで インクカラーが見分けやすくなるよう、色を固定します
	case T_ExplainCamera_02 = "T_ExplainCamera_02"
	/// ユーザーが投稿した内容を プレイ中に表示する機能の ON/OFFを切り替えます
	case T_ExplainCamera_03 = "T_ExplainCamera_03"
	/// フレンドのロビーへ 自分のプレイ状況の通知を 自動で送信します
	case T_ExplainCamera_04 = "T_ExplainCamera_04"
	/// ザッカ屋に行って 最後のアイテムをもらおう！
	case T_MaxNext_00 = "T_MaxNext_00"
	/// COMPLETE!!
	case T_Max_00 = "T_Max_00"
	/// ステージ情報がありませんこのモードを遊ぶには インターネットに接続して最新のステージ情報を受信する必要があります
	case T_OffStage_00 = "T_OffStage_00"
	/// ショップ
	case T_Shop_00 = "T_Shop_00"
	/// ウデマエ
	case T_UdemaeTitle_00 = "T_UdemaeTitle_00"
	/// Xパワー
	case T_XPower_00 = "T_XPower_00"
	/// キャンセル
	case L_Btn_00_L_GuideCancel_00_T_Info_00 = "L_Btn_00_L_GuideCancel_00_T_Info_00"
	/// トリカラマッチ
	case L_Btn_00_T_Title_00 = "L_Btn_00_T_Title_00"
	/// フレンドと
	case L_Btn_03_T_Friend_00 = "L_Btn_03_T_Friend_00"
	/// MAX
	case L_FestItemAll_00_T_Max_00 = "L_FestItemAll_00_T_Max_00"
	/// とじる
	case L_GuideClose_00_T_Info_00 = "L_GuideClose_00_T_Info_00"
	/// ルール確認
	case L_GuideManual_01_T_Info_00 = "L_GuideManual_01_T_Info_00"
	/// ほうしゅうとポイント
	case L_GuideReward_00_T_Info_00 = "L_GuideReward_00_T_Info_00"
	/// ひとりで
	case L_GuideSwitch_00_T_BtnL_00 = "L_GuideSwitch_00_T_BtnL_00"
	/// フレンドと
	case L_GuideSwitch_00_T_BtnR_00 = "L_GuideSwitch_00_T_BtnR_00"
	/// ハイスコア
	case L_HighScore_00_T_Score_00 = "L_HighScore_00_T_Score_00"
	/// 計測中…
	case L_PlayerStatus_00_L_Choushi_00_T_FestPowCount_00 = "L_PlayerStatus_00_L_Choushi_00_T_FestPowCount_00"
	/// こうけん度
	case L_PlayerStatus_00_L_Choushi_00_T_FestPow_00 = "L_PlayerStatus_00_L_Choushi_00_T_FestPow_00"
	/// MAX
	case L_PlayerStatus_00_L_FestRankGauge_00_T_Max_00 = "L_PlayerStatus_00_L_FestRankGauge_00_T_Max_00"
	/// [color=0001]フェス投票[color=ffff]に向かえ！
	case L_PlayerStatus_00_L_FestRankGauge_00_T_Vote_00 = "L_PlayerStatus_00_L_FestRankGauge_00_T_Vote_00"
	/// MAX
	case L_PlayerStatus_00_L_Rank_00_T_Max_00 = "L_PlayerStatus_00_L_Rank_00_T_Max_00"
	/// ランク
	case L_PlayerStatus_00_L_Rank_00_T_RankHeader_00 = "L_PlayerStatus_00_L_Rank_00_T_RankHeader_00"
	/// ウデマエ
	case L_PlayerStatus_00_L_Udemae_00_T_UdemaeTitle_00 = "L_PlayerStatus_00_L_Udemae_00_T_UdemaeTitle_00"
	/// 評価リセット
	case L_PlayerStatus_01_L_Info_00_T_Info_00 = "L_PlayerStatus_01_L_Info_00_T_Info_00"
	/// 昇格戦
	case L_Progress_00_T_Title_00 = "L_Progress_00_T_Title_00"
	/// ウデマエリセット
	case L_Reset_00_T_Info_00 = "L_Reset_00_T_Info_00"
	/// ルール
	case T_Rule_00 = "T_Rule_00"
	/// ステージ
	case T_Stage_00 = "T_Stage_00"
	/// ステージ
	case T_Stage_02 = "T_Stage_02"
	/// VS
	case T_VS_00 = "T_VS_00"
	/// 支給ブキ
	case T_Wpn_01 = "T_Wpn_01"
	/// もどる
	case L_Back_00_T_Info_00 = "L_Back_00_T_Info_00"
	/// もどる
	case L_Back_02_T_Info_00 = "L_Back_02_T_Info_00"
	/// アタマ
	case L_BtnCategory_01_T_Category_00 = "L_BtnCategory_01_T_Category_00"
	/// フク
	case L_BtnCategory_02_T_Category_00 = "L_BtnCategory_02_T_Category_00"
	/// クツ
	case L_BtnCategory_03_T_Category_00 = "L_BtnCategory_03_T_Category_00"
	/// 持っているかけら
	case L_Btn_00_T_Info_00 = "L_Btn_00_T_Info_00"
	/// 表示切替
	case L_Btn_01_T_Info_00 = "L_Btn_01_T_Info_00"
	/// 当てはまるものがありません
	case T_NoSort_00 = "T_NoSort_00"
	/// 連射力
	case Blaze = "Blaze"
	/// チャージ速度
	case Charge = "Charge"
	/// 耐久力
	case Defence = "Defence"
	/// 爆発力
	case Explosion = "Explosion"
	/// 機動性
	case Mobility = "Mobility"
	/// 塗り進み速度
	case PaintSpeed = "PaintSpeed"
	/// 攻撃力
	case Power = "Power"
	/// 射程
	case Range = "Range"
	/// 軽さ
	case Weight = "Weight"
	/// バイトに参加するみなさんへ
	case T_TitleCoop_00 = "T_TitleCoop_00"
	/// イクラ集めとは？
	case T_TitleCoop_01 = "T_TitleCoop_01"
	/// イクラ集めで簡単・高収入
	case T_TitleCoop_02 = "T_TitleCoop_02"
	/// バイトを始めるにあたって
	case T_TitleCoop_03 = "T_TitleCoop_03"
	/// バイトの流れ・準備
	case T_TitleCoop_04 = "T_TitleCoop_04"
	/// バイトの流れ・現地
	case T_TitleCoop_05 = "T_TitleCoop_05"
	/// 仲間との共同作業・絆
	case T_TitleCoop_06 = "T_TitleCoop_06"
	/// バイトのノルマについて
	case T_TitleCoop_07 = "T_TitleCoop_07"
	/// 報酬について
	case T_TitleCoop_08 = "T_TitleCoop_08"
	/// バイト評価制度
	case T_TitleCoop_09 = "T_TitleCoop_09"
	/// 評価ポイント
	case T_TitleCoop_10 = "T_TitleCoop_10"
	/// バイト作業のまとめ
	case T_TitleCoop_11 = "T_TitleCoop_11"
	/// かけがえのない、あなたへ
	case T_TitleCoop_12 = "T_TitleCoop_12"
	/// オカシラシャケについて
	case T_TitleCoop_13 = "T_TitleCoop_13"
	/// シャケ
	case T_TitleCoop_21 = "T_TitleCoop_21"
	/// タマヒロイ
	case T_TitleCoop_22 = "T_TitleCoop_22"
	/// バクダン
	case T_TitleCoop_24 = "T_TitleCoop_24"
	/// ヘビ
	case T_TitleCoop_25 = "T_TitleCoop_25"
	/// テッパン
	case T_TitleCoop_26 = "T_TitleCoop_26"
	/// タワー
	case T_TitleCoop_27 = "T_TitleCoop_27"
	/// モグラ
	case T_TitleCoop_28 = "T_TitleCoop_28"
	/// コウモリ
	case T_TitleCoop_29 = "T_TitleCoop_29"
	/// カタパッド
	case T_TitleCoop_30 = "T_TitleCoop_30"
	/// 水位変化（干潮、満潮）
	case T_TitleCoop_32 = "T_TitleCoop_32"
	/// ラッシュ
	case T_TitleCoop_33 = "T_TitleCoop_33"
	/// 霧
	case T_TitleCoop_34 = "T_TitleCoop_34"
	/// グリル発進
	case T_TitleCoop_35 = "T_TitleCoop_35"
	/// ドスコイ大量発生
	case T_TitleCoop_36 = "T_TitleCoop_36"
	/// キンシャケ探し
	case T_TitleCoop_37 = "T_TitleCoop_37"
	/// ハコビヤ襲来
	case T_TitleCoop_38 = "T_TitleCoop_38"
	/// ハシラ
	case T_TitleCoop_39 = "T_TitleCoop_39"
	/// ダイバー
	case T_TitleCoop_40 = "T_TitleCoop_40"
	/// ナベブタ
	case T_TitleCoop_41 = "T_TitleCoop_41"
	/// テッキュウ
	case T_TitleCoop_42 = "T_TitleCoop_42"
	/// ドロシャケ噴出
	case T_TitleCoop_43 = "T_TitleCoop_43"
	/// 巨大タツマキ
	case T_TitleCoop_44 = "T_TitleCoop_44"
	/// -
	case T_TitleCoop_45 = "T_TitleCoop_45"
	/// 実測値
	case Common_Actual_Value = "Common_Actual_Value"
	/// Salmonia3+
	case Common_App_Salmonia = "Common_App_Salmonia"
	/// アプリを更新してください
	case Common_App_Update_Required = "Common_App_Update_Required"
	/// チャート
	case Common_Charts = "Common_Charts"
	/// クリア率
	case Common_Clear_Ratio = "Common_Clear_Ratio"
	/// この操作は取り消せません。続行して良いですか。
	case Common_Confirm_Danger = "Common_Confirm_Danger"
	/// カスタマイズ
	case Common_Customize = "Common_Customize"
	/// ダークモード
	case Common_DarkMode = "Common_DarkMode"
	/// データ管理
	case Common_Data_Managements = "Common_Data_Managements"
	/// 助けられた回数
	case Common_Death_Count = "Common_Death_Count"
	/// オオモノシャケ討伐率
	case Common_Defeated_Ratio = "Common_Defeated_Ratio"
	/// オオモノシャケを倒した数
	case Common_Defeated_Sakelien_Count = "Common_Defeated_Sakelien_Count"
	/// 推定値
	case Common_Estimated_Value = "Common_Estimated_Value"
	/// イベントクリア率
	case Common_Event_Clear_Ratio = "Common_Event_Clear_Ratio"
	/// イベント発生率
	case Common_Event_Probability = "Common_Event_Probability"
	/// ゲーミングモード
	case Common_GamingMode = "Common_GamingMode"
	/// スケジュール取得
	case Common_Get_Schedules = "Common_Get_Schedules"
	/// 過去のスケジュールデータを取得します
	case Common_Get_Schedules_Txt = "Common_Get_Schedules_Txt"
	/// 金イクラ納品数
	case Common_Golden_Eggs_Collected = "Common_Golden_Eggs_Collected"
	/// 称号
	case Common_Grade_Id = "Common_Grade_Id"
	/// 評価ポイント
	case Common_Grade_Point = "Common_Grade_Point"
	/// イクラ取得率
	case Common_Ikura_Ratio = "Common_Ikura_Ratio"
	/// 記録
	case Common_Job_Results = "Common_Job_Results"
	/// バイト
	case Common_Job_Works = "Common_Job_Works"
	/// マイページ
	case Common_MyPage = "Common_MyPage"
	/// すすむ
	case Common_Next = "Common_Next"
	/// なかま
	case Common_Player_Crew = "Common_Player_Crew"
	/// あなた
	case Common_Player_You = "Common_Player_You"
	/// イクラ獲得数
	case Common_Power_Eggs_Collected = "Common_Power_Eggs_Collected"
	/// プライバシーポリシー
	case Common_Privacy_Policy = "Common_Privacy_Policy"
	/// 保存成功しました。
	case Common_Save_To_PhotoLibrary = "Common_Save_To_PhotoLibrary"
	/// アプリ設定
	case Common_Settings = "Common_Settings"
	/// ログイン
	case Common_Sign_In = "Common_Sign_In"
	/// ニンテンドーアカウントにログイン
	case Common_Sign_In_Title = "Common_Sign_In_Title"
	/// ニンテンドーアカウントはニンテンドースイッチに連携されている必要があります。
	case Common_Sign_In_Txt = "Common_Sign_In_Txt"
	/// ブキ支給回数
	case Common_Supplied_Count = "Common_Supplied_Count"
	/// ブキ支給率
	case Common_Supplied_Main_Prob = "Common_Supplied_Main_Prob"
	/// ブキ支給率
	case Common_Supplied_Special_Prob = "Common_Supplied_Special_Prob"
	/// 利用データの収集について
	case Common_Tracking_Data = "Common_Tracking_Data"
	/// 許可を選択した場合、アプリケーションはCookieを含むデータを収集し、コンテンツ、製品、サービスを最適化するためにGoogle Analyticsサービスのサーバーに送信します。
	case Common_Tracking_Data_Txt = "Common_Tracking_Data_Txt"
	/// アカウント連携解除
	case Common_Unlink_Accounts = "Common_Unlink_Accounts"
	/// アプリとニンテンドースイッチオンラインのアカウント連携を解除します（アカウントは削除されません）
	case Common_Unlink_Accounts_Txt = "Common_Unlink_Accounts_Txt"
	/// ようこそSalmonia3+へ
	case Common_Welcome_App = "Common_Welcome_App"
	/// もっと便利なサーモンランライフを！
	case Common_Welcome_App_Txt = "Common_Welcome_App_Txt"
	/// データ消去
	case Common_Wipe_Data = "Common_Wipe_Data"
	/// アプリで保存されているデータを削除します
	case Common_Wipe_Data_Txt = "Common_Wipe_Data_Txt"
	/// レビューを書く
	case Common_Write_Review = "Common_Write_Review"
	/// フォーム
	case Common_Form = "Common_Form"
	/// 種類
	case Common_Form_Type = "Common_Form_Type"
	/// バグ修正
	case Common_Form_Type_Bug = "Common_Form_Type_Bug"
	/// 機能追加
	case Common_Form_Type_Feature = "Common_Form_Type_Feature"
	/// 改善案
	case Common_Form_Type_Enhancement = "Common_Form_Type_Enhancement"
	/// タイトル
	case Common_Form_Title = "Common_Form_Title"
	/// 内容
	case Common_Form_Content = "Common_Form_Content"
	/// 送信
	case Common_Form_Submit = "Common_Form_Submit"
	/// 復元
	case Common_Restore = "Common_Restore"
	/// バックアップからリザルトを復元します
	case Common_Restore_Txt = "Common_Restore_Txt"
	/// バックアップ
	case Common_Backup = "Common_Backup"
	/// リザルトをバックアップします
	case Common_Backup_Txt = "Common_Backup_Txt"
	/// ログ
	case Common_Log = "Common_Log"
	/// 開発者にログを送信します（個人を特定する情報は含まれません）
	case Common_Log_Txt = "Common_Log_Txt"
	/// 圧縮(ZIP)
	case Common_Backup_Compress = "Common_Backup_Compress"
	/// 非圧縮(JSON)
	case Common_Backup_No_Compress = "Common_Backup_No_Compress"
	/// ビッグランから街を守れ！
	case Carousel_BigrunOpening = "Carousel_BigrunOpening"
	/// ビッグラン結果発表！
	case Carousel_BigrunResult = "Carousel_BigrunResult"
	/// サーモンラン
	case Carousel_CoopHistory = "Carousel_CoopHistory"
	/// フェス開催！！
	case Carousel_FestOpening = "Carousel_FestOpening"
	/// フェス結果発表！！
	case Carousel_FestResult = "Carousel_FestResult"
	/// ここだけの特別なギア販売中
	case Carousel_Gesotown = "Carousel_Gesotown"
	/// 新たなヒーローの物語
	case Carousel_HeroRecord = "Carousel_HeroRecord"
	/// メモリープレーヤー
	case Carousel_MemoryPlayer = "Carousel_MemoryPlayer"
	/// マイコーデ
	case Carousel_Myoutfits = "Carousel_Myoutfits"
	/// フォトアルバム
	case Carousel_PhotoAlbum = "Carousel_PhotoAlbum"
	/// 支援者求む！
	case Carousel_Robichi = "Carousel_Robichi"
	/// 前シーズンのヒストリーはこちら！
	case Carousel_StatsLatestSeason = "Carousel_StatsLatestSeason"
	/// バトル戦績
	case Carousel_VsHistory = "Carousel_VsHistory"
	/// 二つ名
	case Catalog_Byname = "Catalog_Byname"
	/// カードパック
	case Catalog_CardPack = "Catalog_CardPack"
	/// フレッシュカードパック
	case Catalog_CardPackFresh = "Catalog_CardPackFresh"
	/// カードスリーブ
	case Catalog_CardSleeve = "Catalog_CardSleeve"
	/// エモート
	case Catalog_Emote = "Catalog_Emote"
	/// オキモノ
	case Catalog_Figure = "Catalog_Figure"
	/// プレート
	case Catalog_NamePlateBg = "Catalog_NamePlateBg"
	/// ステッカー
	case Catalog_Sticker = "Catalog_Sticker"
	/// カタログ
	case Catalog_AppName = "Catalog_AppName"
	/// 引き換えできます
	case Catalog_Available = "Catalog_Available"
	/// ビッグラン開催中！ポイント<em>1.2倍</em>！
	case Catalog_BigrunBonus = "Catalog_BigrunBonus"
	/// カタログレベルを上げて<br />ミステリーボックスをゲット！
	case Catalog_BonusDescription = "Catalog_BonusDescription"
	/// レベル10ごとにミステリーボックスをゲットできます
	case Catalog_BonusGuide = "Catalog_BonusGuide"
	/// ボーナス！
	case Catalog_BonusTitle = "Catalog_BonusTitle"
	/// コンプリート！
	case Catalog_Complete = "Catalog_Complete"
	/// { 0 } / { 1 }
	case Catalog_Current = "Catalog_Current"
	/// Lv. { 0 }
	case Catalog_CurrentExtraLevel = "Catalog_CurrentExtraLevel"
	/// るいけい { 0 } p
	case Catalog_CurrentPoint = "Catalog_CurrentPoint"
	/// 本日初勝利でもれなく<em>{ 0 }</em>ポイントゲット！
	case Catalog_DailyBonus = "Catalog_DailyBonus"
	/// ドリンクチケット
	case Catalog_DrinkTicket = "Catalog_DrinkTicket"
	/// フェス開催中！ポイント<em>1.2倍</em>！
	case Catalog_FesBonus = "Catalog_FesBonus"
	/// フードチケット
	case Catalog_FoodTicket = "Catalog_FoodTicket"
	/// ゲット！
	case Catalog_Got = "Catalog_Got"
	/// <em>ランクを4まで上げてザッカ屋でカタログを受け取ろう！</em>
	case Catalog_Guide = "Catalog_Guide"
	/// x{ 0 }
	case Catalog_ItemAmount = "Catalog_ItemAmount"
	/// カタログレベル
	case Catalog_Level = "Catalog_Level"
	/// { 0 } まで
	case Catalog_Limit = "Catalog_Limit"
	/// ミステリーボックス
	case Catalog_MysteryBox = "Catalog_MysteryBox"
	/// つぎ
	case Catalog_NextBonus = "Catalog_NextBonus"
	/// ページ { 0 }
	case Catalog_Page = "Catalog_Page"
	/// { 0 } / { 1 } ページ
	case Catalog_Pager = "Catalog_Pager"
	/// { 0 } 開催中！
	case Catalog_Period = "Catalog_Period"
	/// カタログポイント
	case Catalog_Point = "Catalog_Point"
	/// ザッカ屋
	case Catalog_Signboard = "Catalog_Signboard"
	/// カタログ
	case Catalog_Title = "Catalog_Title"
	/// イカしたカタログ 配布中！
	case Catalog_Welcome = "Catalog_Welcome"
	/// バトルでカタログポイントを貯めて<br />アイテムをゲットしよう！
	case Catalog_WelcomeDescription = "Catalog_WelcomeDescription"
	/// 旅の途中でテンションバクアゲ～！なグラフィティ見つけたから送るね～
	case Challenge_AboutGraffiti = "Challenge_AboutGraffiti"
	/// ロブイチ
	case Challenge_AppName = "Challenge_AppName"
	/// ブラック
	case Challenge_Black = "Challenge_Black"
	/// ブルー
	case Challenge_Blue = "Challenge_Blue"
	/// オレンジの空がオイリーだよね～。
	case Challenge_Challenge210Description = "Challenge_Challenge210Description"
	/// 二つ名
	case Challenge_Challenge210Reward = "Challenge_Challenge210Reward"
	/// シェケナダム
	case Challenge_Challenge210Title = "Challenge_Challenge210Title"
	/// アートに触れるとハートの中心まで火が通るカンジするよね～！
	case Challenge_Challenge21Description = "Challenge_Challenge21Description"
	/// めちゃ映えフォト
	case Challenge_Challenge21Reward = "Challenge_Challenge21Reward"
	/// キンメダイ美術館
	case Challenge_Challenge21Title = "Challenge_Challenge21Title"
	/// ここの食堂はフライがイケてるバクアゲスポットなんだ～。
	case Challenge_Challenge22Description = "Challenge_Challenge22Description"
	/// 拾ったステッカー
	case Challenge_Challenge22Reward = "Challenge_Challenge22Reward"
	/// 海女美術大学
	case Challenge_Challenge22Title = "Challenge_Challenge22Title"
	/// 橋の上は風が強くてコロモがめっちゃ飛ばされるんだよね！
	case Challenge_Challenge23Description = "Challenge_Challenge23Description"
	/// めちゃ映えフォト
	case Challenge_Challenge23Reward = "Challenge_Challenge23Reward"
	/// マサバ海峡大橋
	case Challenge_Challenge23Title = "Challenge_Challenge23Title"
	/// 溶接の音とアゲる音って似てるから、テンションがバチバチアガっちゃうよ！
	case Challenge_Challenge24Description = "Challenge_Challenge24Description"
	/// 拾ったステッカー
	case Challenge_Challenge24Reward = "Challenge_Challenge24Reward"
	/// チョウザメ造船
	case Challenge_Challenge24Title = "Challenge_Challenge24Title"
	/// 夕飯時にフライの香りがすると、すぐ家に帰りたくなるよね～。
	case Challenge_Challenge25Description = "Challenge_Challenge25Description"
	/// めちゃ映えフォト
	case Challenge_Challenge25Reward = "Challenge_Challenge25Reward"
	/// ヒラメが丘団地
	case Challenge_Challenge25Title = "Challenge_Challenge25Title"
	/// あ！新しいアゲ油売ってる！！
	case Challenge_Challenge26Description = "Challenge_Challenge26Description"
	/// 拾ったステッカー
	case Challenge_Challenge26Reward = "Challenge_Challenge26Reward"
	/// ザトウマーケット
	case Challenge_Challenge26Title = "Challenge_Challenge26Title"
	/// こんなアガる要素しかない場所、アガり過ぎ注意報だよ～！ジュワワ～！！！
	case Challenge_Challenge27Description = "Challenge_Challenge27Description"
	/// めちゃ映えフォト
	case Challenge_Challenge27Reward = "Challenge_Challenge27Reward"
	/// マヒマヒリゾート＆スパ
	case Challenge_Challenge27Title = "Challenge_Challenge27Title"
	/// ジェットコースターに乗った後って、ナゼか身軽に感じるんだよね～。
	case Challenge_Challenge28Description = "Challenge_Challenge28Description"
	/// グラフィティ壁紙
	case Challenge_Challenge28Reward = "Challenge_Challenge28Reward"
	/// スメーシーワールド
	case Challenge_Challenge28Title = "Challenge_Challenge28Title"
	/// ハイカラ地方にもサクサク稼げるバイトがあるんだね～！って、ココどこ～？
	case Challenge_Challenge29Description = "Challenge_Challenge29Description"
	/// めちゃたそがれフォト
	case Challenge_Challenge29Reward = "Challenge_Challenge29Reward"
	/// 難破船ドン・ブラコ
	case Challenge_Challenge29Title = "Challenge_Challenge29Title"
	/// チャレンジャー
	case Challenge_Challenger = "Challenge_Challenger"
	/// 支援するチャレンジを選ぶ
	case Challenge_ChooseChallenge = "Challenge_ChooseChallenge"
	/// 達成しました
	case Challenge_Clear = "Challenge_Clear"
	/// コンプリート！
	case Challenge_Complete = "Challenge_Complete"
	/// コンプリート特典
	case Challenge_CompleteReward = "Challenge_CompleteReward"
	/// 支援に使える塗りポイント
	case Challenge_CurrentPoint = "Challenge_CurrentPoint"
	/// ロブから支援者のみなさまへ
	case Challenge_DearAllOfYou = "Challenge_DearAllOfYou"
	/// グラフィティのダウンロード
	case Challenge_DownloadGraffiti = "Challenge_DownloadGraffiti"
	/// アイコンのダウンロード
	case Challenge_DownloadIcon = "Challenge_DownloadIcon"
	/// 壁紙のダウンロード
	case Challenge_DownloadWallpaper = "Challenge_DownloadWallpaper"
	/// グリーン
	case Challenge_Green = "Challenge_Green"
	/// お礼のグラフィティをダウンロードできます
	case Challenge_GuideGraffiti = "Challenge_GuideGraffiti"
	/// リワードの二つ名をロビー端末から受け取れます
	case Challenge_GuideRewardByName = "Challenge_GuideRewardByName"
	/// リワードのアイコンをダウンロードできます
	case Challenge_GuideRewardIcon = "Challenge_GuideRewardIcon"
	/// リワードの画像をダウンロードできます
	case Challenge_GuideRewardImage = "Challenge_GuideRewardImage"
	/// リワードのスリーブをロビー端末から受け取れます
	case Challenge_GuideRewardSleeve = "Challenge_GuideRewardSleeve"
	/// 塗りまくって貯めたポイントでロブの旅を応援しよう！<br />旅の思い出も手に入るかも？！
	case Challenge_HowToPlay = "Challenge_HowToPlay"
	/// ジャーニー { 0 }
	case Challenge_Journey = "Challenge_Journey"
	/// 「チャレンジャー・ロブ」としての次の目的地は『ハイカラ地方』に決めたよ～。<br />ってわけで、この旅を引き続き支援してくれるサポーターをパリッと募集するよ！<br />ハイカラ地方は、僕が旅を始める前に住んでた街もあるんだけど、いまもハイカラな香りたっぷりのツヤツヤアゲアゲな場所なんだよね～。<br />そういった思い出の場所を巡りながら、「過去の自分」も見つめ直して「いまの自分」を更にアゲ直したいんだよね！<br />この「二度アゲの旅」、ガチでホットっしょ？！ってことでヨロシク～！
	case Challenge_Journey2Description = "Challenge_Journey2Description"
	/// キミのおかげで、二度アゲの旅もカリッと終えられたよ！アリガト～！<br />お礼にコレ、アゲちゃうよ！<br />ロビー端末に送っておいたから受け取ってね～。
	case Challenge_Journey2Gratitude = "Challenge_Journey2Gratitude"
	/// 旅の途中<br />～どの道を塗るかより、塗った道をどう進むか～
	case Challenge_Journey2Title = "Challenge_Journey2Title"
	/// 支援者求ム！
	case Challenge_LookingForSupporters = "Challenge_LookingForSupporters"
	/// オレンジ
	case Challenge_Orange = "Challenge_Orange"
	/// { 0 }p
	case Challenge_Point = "Challenge_Point"
	/// 支援に必要な塗りポイント
	case Challenge_PointForSupport = "Challenge_PointForSupport"
	/// （あと { 0 }p 不足しています）
	case Challenge_PointNotEnough = "Challenge_PointNotEnough"
	/// パープル
	case Challenge_Purple = "Challenge_Purple"
	/// レッド
	case Challenge_Red = "Challenge_Red"
	/// コンプリートまで あと <span>{ 0 }</span>
	case Challenge_RemainsOfChallenge = "Challenge_RemainsOfChallenge"
	/// ロブ
	case Challenge_Rob = "Challenge_Rob"
	/// ロブのアゲアゲ旅
	case Challenge_RobJourney = "Challenge_RobJourney"
	/// 色を選んでダウンロードしてください
	case Challenge_SelectColor = "Challenge_SelectColor"
	/// サイズを選んでダウンロードしてください
	case Challenge_SelectSize = "Challenge_SelectSize"
	/// ポイント送信中...
	case Challenge_SendingPoint = "Challenge_SendingPoint"
	/// みんなアガッてる～？ 孤高のアゲアゲ旅人ロブだよ！<br />このプロジェクトは、僕のこれまでの歩みを振り返る旅、<br />その旅のクラウドファンディングなんだ～！
	case Challenge_Story1 = "Challenge_Story1"
	/// 僕がこれまでに立ち寄ったアツアツでアゲアゲなアツアゲスポットを自転車で一周するよ！<br />そこで自分の「今」の立ち位置をジュワ～ッと見つめなおしてアゲなおそうと思うんだよね～。<br />そんな旅の中で得た「気づき」「発見」「Notice」を支援してくれるみんなにもシェアしたいと思ってるんだ～。<br />これってテンションフライハイっしょ？！
	case Challenge_Story2 = "Challenge_Story2"
	/// 旅するなかでバクアゲ～！と思った風景写真や思い出の品は支援してくれたみんなにも送るからね～。<br />『みんなも一緒に旅する仲間っしょ！』っていう、一体感とかグルーヴを生み出せたらもっとアガるよね～！<br />そんなこんなでこれからアゲアゲの旅をサクッと始めちゃうんでヨロシク～！
	case Challenge_Story3 = "Challenge_Story3"
	/// 支援する
	case Challenge_Support = "Challenge_Support"
	/// 支援済み
	case Challenge_Supported = "Challenge_Supported"
	/// ※ 画像の加工や営利目的での利用、再配布はご遠慮ください。
	case Challenge_TermOfUse = "Challenge_TermOfUse"
	/// ロブイチ
	case Challenge_Title = "Challenge_Title"
	/// 無色
	case Challenge_Transparent = "Challenge_Transparent"
	/// ターコイズ
	case Challenge_Turquoise = "Challenge_Turquoise"
	/// ホワイト
	case Challenge_White = "Challenge_White"
	/// イエロー
	case Challenge_Yellow = "Challenge_Yellow"
	/// { 0 }p 持っています
	case Challenge_YourPoint = "Challenge_YourPoint"
	/// { 0 }%
	case Common = "Common"
	/// キャンセル
	case Common_Cancel = "Common_Cancel"
	/// ガチアサリ
	case Common_ClamBlitz = "Common_ClamBlitz"
	/// 閉じる
	case Common_Close = "Common_Close"
	/// : 
	case Common_ColonRule = "Common_ColonRule"
	/// ビッグラン
	case Common_CoopBigRun = "Common_CoopBigRun"
	/// QRコードは、株式会社デンソーウェーブの登録商標です。
	case Common_CopyrightQrCode = "Common_CopyrightQrCode"
	/// 決定
	case Common_Decide = "Common_Decide"
	/// ダウンロード
	case Common_Download = "Common_Download"
	/// おわる
	case Common_End = "Common_End"
	/// はてな
	case Common_GearPowerBlank = "Common_GearPowerBlank"
	/// ホーム
	case Common_Home = "Common_Home"
	/// イカリング３
	case Common_Ikaring3 = "Common_Ikaring3"
	/// ロード中
	case Common_NowLoading = "Common_NowLoading"
	/// ひっぱって更新
	case Common_PullToRefresh = "Common_PullToRefresh"
	/// ガチホコバトル
	case Common_Rainmaker = "Common_Rainmaker"
	/// シェア
	case Common_Share = "Common_Share"
	/// ガチエリア
	case Common_SplatZones = "Common_SplatZones"
	/// ガチヤグラ
	case Common_TowerControl = "Common_TowerControl"
	/// トリカラアタック
	case Common_Tricolor = "Common_Tricolor"
	/// トリカラマッチ
	case Common_TricolorMatch = "Common_TricolorMatch"
	/// ナワバリバトル
	case Common_TurfWar = "Common_TurfWar"
	/// 出現数
	case CoopHistory_Available = "CoopHistory_Available"
	/// 出現したオカシラシャケ
	case CoopHistory_AvailableBoss = "CoopHistory_AvailableBoss"
	/// 平均クリアWAVE数
	case CoopHistory_AverageClearWaves = "CoopHistory_AverageClearWaves"
	/// ビッグラン
	case CoopHistory_Bigrun = "CoopHistory_Bigrun"
	/// クリアボーナス
	case CoopHistory_Bonus = "CoopHistory_Bonus"
	/// オカシラシャケ出現！
	case CoopHistory_BossAvailable = "CoopHistory_BossAvailable"
	/// Clear!!
	case CoopHistory_Clear = "CoopHistory_Clear"
	/// キケン度
	case CoopHistory_DangerRatio = "CoopHistory_DangerRatio"
	/// オカシラシャケ撃破！
	case CoopHistory_DefeatBoss = "CoopHistory_DefeatBoss"
	/// 倒したオカシラシャケ
	case CoopHistory_DefeatBossCount = "CoopHistory_DefeatBossCount"
	/// 倒した！
	case CoopHistory_Defeated = "CoopHistory_Defeated"
	/// 倒したオオモノシャケ
	case CoopHistory_DefeatedEnemies = "CoopHistory_DefeatedEnemies"
	/// ※カッコ内の数字は自分で倒した数です
	case CoopHistory_DefeatedEnemiesGuide = "CoopHistory_DefeatedEnemiesGuide"
	/// 集めたイクラ
	case CoopHistory_DeliverCount = "CoopHistory_DeliverCount"
	/// オオモノシャケ
	case CoopHistory_Enemy = "CoopHistory_Enemy"
	/// EX-WAVE
	case CoopHistory_ExWave = "CoopHistory_ExWave"
	/// Failure
	case CoopHistory_Failure = "CoopHistory_Failure"
	/// GJ!
	case CoopHistory_Gj = "CoopHistory_Gj"
	/// バイトヒストリー一覧に戻る
	case CoopHistory_GoToStats = "CoopHistory_GoToStats"
	/// 集めた金イクラ
	case CoopHistory_GoldenDeliverCount = "CoopHistory_GoldenDeliverCount"
	/// 最高きろく
	case CoopHistory_HighestScore = "CoopHistory_HighestScore"
	/// バイトヒストリー
	case CoopHistory_History = "CoopHistory_History"
	/// 獲得ポイント
	case CoopHistory_JobPoint = "CoopHistory_JobPoint"
	/// 評価レート
	case CoopHistory_JobRatio = "CoopHistory_JobRatio"
	/// クマサンポイントカード
	case CoopHistory_KumaPointCard = "CoopHistory_KumaPointCard"
	/// 最新のバイトへ
	case CoopHistory_Latest = "CoopHistory_Latest"
	/// 期間限定
	case CoopHistory_Limited = "CoopHistory_Limited"
	/// 今月のギア
	case CoopHistory_MonthlyReward = "CoopHistory_MonthlyReward"
	/// 次のバイト
	case CoopHistory_Next = "CoopHistory_Next"
	/// NG
	case CoopHistory_Ng = "CoopHistory_Ng"
	/// バイトヒストリーがありません
	case CoopHistory_NoData = "CoopHistory_NoData"
	/// バイトヒストリーを表示できません
	case CoopHistory_NotAvailable = "CoopHistory_NotAvailable"
	/// 閲覧できるバイトヒストリーは、最新の50戦までです。
	case CoopHistory_NotAvailableDescription = "CoopHistory_NotAvailableDescription"
	/// 倒せなかった...
	case CoopHistory_NotDefeated = "CoopHistory_NotDefeated"
	/// { 0 }p
	case CoopHistory_P = "CoopHistory_P"
	/// バイト回数
	case CoopHistory_PlayCount = "CoopHistory_PlayCount"
	/// 前のバイト
	case CoopHistory_Previous = "CoopHistory_Previous"
	/// プライベート
	case CoopHistory_Private = "CoopHistory_Private"
	/// スタッフ募集！
	case CoopHistory_Recruit = "CoopHistory_Recruit"
	/// 初心者でも安心！元気で明るい方大歓迎！<br />アットホームな職場でアルバイトをしてみませんか？
	case CoopHistory_RecruitDescription = "CoopHistory_RecruitDescription"
	/// 簡単
	case CoopHistory_RecruitTag1 = "CoopHistory_RecruitTag1"
	/// イクラ集め
	case CoopHistory_RecruitTag2 = "CoopHistory_RecruitTag2"
	/// ～イカした制服でイクラ集め～
	case CoopHistory_RecruitTitle = "CoopHistory_RecruitTitle"
	/// いつものバイト
	case CoopHistory_Regular = "CoopHistory_Regular"
	/// 現在のポイント
	case CoopHistory_RegularPoint = "CoopHistory_RegularPoint"
	/// 助けた回数
	case CoopHistory_RescueCount = "CoopHistory_RescueCount"
	/// たすけてもらったかいすう
	case CoopHistory_RescuedCount = "CoopHistory_RescuedCount"
	/// ウロコ
	case CoopHistory_Scale = "CoopHistory_Scale"
	/// ドウウロコ
	case CoopHistory_ScaleBronze = "CoopHistory_ScaleBronze"
	/// キンウロコ
	case CoopHistory_ScaleGold = "CoopHistory_ScaleGold"
	/// ギンウロコ
	case CoopHistory_ScaleSilver = "CoopHistory_ScaleSilver"
	/// バイトスコア
	case CoopHistory_Score = "CoopHistory_Score"
	/// スケジュールを見る
	case CoopHistory_SeeSchedule = "CoopHistory_SeeSchedule"
	/// オカシラゲージ
	case CoopHistory_SmellMeter = "CoopHistory_SmellMeter"
	/// 支給ブキ
	case CoopHistory_SupplyWeapon = "CoopHistory_SupplyWeapon"
	/// サーモンラン
	case CoopHistory_Title = "CoopHistory_Title"
	/// るいけいポイント
	case CoopHistory_TotalPoint = "CoopHistory_TotalPoint"
	/// WAVE 1
	case CoopHistory_Wave1 = "CoopHistory_Wave1"
	/// WAVE 2
	case CoopHistory_Wave2 = "CoopHistory_Wave2"
	/// WAVE 3
	case CoopHistory_Wave3 = "CoopHistory_Wave3"
	/// 干潮
	case CoopHistory_WaveLevel0 = "CoopHistory_WaveLevel0"
	/// 普通
	case CoopHistory_WaveLevel1 = "CoopHistory_WaveLevel1"
	/// 満潮
	case CoopHistory_WaveLevel2 = "CoopHistory_WaveLevel2"
	/// ホームに戻る
	case Error_BackToHome = "Error_BackToHome"
	/// 現在利用できません。しばらくお待ちください
	case Error_CurrentlyNotAvailable = "Error_CurrentlyNotAvailable"
	/// エラー
	case Error_Error = "Error_Error"
	/// エラーが発生しました
	case Error_ErrorOccurred = "Error_ErrorOccurred"
	/// 読みこみに失敗しました
	case Error_ErrorReopen = "Error_ErrorReopen"
	/// ただいまサーバーのメンテナンス中です。時間をおいて再度アクセスしてください。
	case Error_MaintenanceDescription = "Error_MaintenanceDescription"
	/// しばらくお待ちください
	case Error_MaintenanceTitle = "Error_MaintenanceTitle"
	/// 読みこみに失敗しました。<br />通信環境のよいところで再度お試しください。
	case Error_NetworkNotAvailable = "Error_NetworkNotAvailable"
	/// イカリング３を表示できません。しばらく時間をおいてから通信環境の良い場所で再度お試しください。<br />問題が解決しない場合は、ブラウザが最新版に更新されているか確認してください。<br />それでもこの画面が表示される場合は、ご利用の環境でイカリング３を利用できない可能性があります。
	case Error_NotSupported = "Error_NotSupported"
	/// 再読みこみ
	case Error_Reload = "Error_Reload"
	/// { 0 }%
	case FesRecord = "FesRecord"
	/// フェス
	case FesRecord_AppName = "FesRecord_AppName"
	/// 攻撃
	case FesRecord_Attack = "FesRecord_Attack"
	/// へいきん
	case FesRecord_Average = "FesRecord_Average"
	/// チャレンジ
	case FesRecord_Challenge = "FesRecord_Challenge"
	/// もうすぐ開催
	case FesRecord_ComingSoon = "FesRecord_ComingSoon"
	/// こうけん度 チャレンジ
	case FesRecord_ContributionChallenge = "FesRecord_ContributionChallenge"
	/// こうけん度 オープン
	case FesRecord_ContributionRegular = "FesRecord_ContributionRegular"
	/// こうけん度 トリカラマッチ
	case FesRecord_ContributionTricolor = "FesRecord_ContributionTricolor"
	/// 守備
	case FesRecord_Defense = "FesRecord_Defense"
	/// { 0 }{ 1 }パワー
	case FesRecord_FestPower = "FesRecord_FestPower"
	/// フェス100ケツ
	case FesRecord_FestRanking = "FesRecord_FestRanking"
	/// ホラガイ獲得個数
	case FesRecord_GotHoragai = "FesRecord_GotHoragai"
	/// このアンケートはゲーム内で投票するまで何度でも変更できます。<br />みんなの予定を見て、バンカラ街の広場にある投票所から投票しましょう。
	case FesRecord_GuideVote = "FesRecord_GuideVote"
	/// 参加予定のフレンドはチームが変わることがあります
	case FesRecord_GuideWillParticipates = "FesRecord_GuideWillParticipates"
	/// 最高フェスパワー
	case FesRecord_HighestFestPower = "FesRecord_HighestFestPower"
	/// ホラガイ獲得率
	case FesRecord_Horagai = "FesRecord_Horagai"
	/// 未定のフレンド
	case FesRecord_NotVoted = "FesRecord_NotVoted"
	/// 開催中！！
	case FesRecord_OnGoing = "FesRecord_OnGoing"
	/// これまでのフェス
	case FesRecord_PastFestivals = "FesRecord_PastFestivals"
	/// アンケート実施中
	case FesRecord_PreVoteButton = "FesRecord_PreVoteButton"
	/// フレンドの参加予定を見ることができます。<br />みんなでチームを組んで参加しよう！
	case FesRecord_PreVoteGuide = "FesRecord_PreVoteGuide"
	/// みんなどこにする？<br />アンケート実施中
	case FesRecord_PreVoteTitle = "FesRecord_PreVoteTitle"
	/// { 0 }<small>位</small>
	case FesRecord_Rank = "FesRecord_Rank"
	/// オープン
	case FesRecord_Regular = "FesRecord_Regular"
	/// フレンドの参加チームを見る
	case FesRecord_SeeAllVotes = "FesRecord_SeeAllVotes"
	/// フェス100ケツを見る
	case FesRecord_SeeFestRanking = "FesRecord_SeeFestRanking"
	/// フェスのきろく
	case FesRecord_Title = "FesRecord_Title"
	/// るいけい
	case FesRecord_Total = "FesRecord_Total"
	/// 未定
	case FesRecord_Undecided = "FesRecord_Undecided"
	/// 参加予定
	case FesRecord_Vote = "FesRecord_Vote"
	/// 得票率
	case FesRecord_VoteRatio = "FesRecord_VoteRatio"
	/// 回答済み
	case FesRecord_Voted = "FesRecord_Voted"
	/// 投票済み
	case FesRecord_VotedInGame = "FesRecord_VotedInGame"
	/// フレンドの投票状況
	case FesRecord_VotingStatus = "FesRecord_VotingStatus"
	/// 結果を集計中です
	case FesRecord_WaitingForResult = "FesRecord_WaitingForResult"
	/// WIN!
	case FesRecord_Win = "FesRecord_Win"
	/// <span>{ 0 }</span>の勝利！
	case FesRecord_WinTeam = "FesRecord_WinTeam"
	/// あなたのきろく
	case FesRecord_YourRecord = "FesRecord_YourRecord"
	/// <em>ビッグラン</em>警報発令！シャケの接近に注意！
	case Footer_BigrunAnnouncement = "Footer_BigrunAnnouncement"
	/// <em>ビッグラン</em>発生中！シャケから街を守れ！
	case Footer_BigrunNowOpening = "Footer_BigrunNowOpening"
	/// もうすぐ <em>{ 0 }</em> が終了します。
	case Footer_EndOfSeason = "Footer_EndOfSeason"
	/// <em>{ 0 }</em> フェス開催！アンケートに回答してフレンドと一緒に参加しよう！
	case Footer_FestAnnouncement = "Footer_FestAnnouncement"
	/// <em>{ 0 }</em> フェス開催中！広場で投票してフェスTをゲットしよう！
	case Footer_FestNowOpening = "Footer_FestNowOpening"
	/// フレンドリスト
	case FriendList_AppName = "FriendList_AppName"
	/// バイト中
	case FriendList_InCoopGame = "FriendList_InCoopGame"
	/// 試合中
	case FriendList_InVsGame = "FriendList_InVsGame"
	/// パスワードつき
	case FriendList_IsLocked = "FriendList_IsLocked"
	/// フレンドのプレイ状況がここに表示されます
	case FriendList_NoFriends = "FriendList_NoFriends"
	/// オフライン
	case FriendList_Offline = "FriendList_Offline"
	/// オンライン
	case FriendList_Online = "FriendList_Online"
	/// 募集中
	case FriendList_Recruiting = "FriendList_Recruiting"
	/// 再読みこみ
	case FriendList_Reload = "FriendList_Reload"
	/// フレンドリスト
	case FriendList_Title = "FriendList_Title"
	/// ボイスチャットかのう
	case FriendList_VoiceChatEnabled = "FriendList_VoiceChatEnabled"
	/// ゲソタウン
	case GesoTown_AppName = "GesoTown_AppName"
	/// ゲソタウンに戻る
	case GesoTown_BackToGesotown = "GesoTown_BackToGesotown"
	/// ふだんとは違う<em>ギアパワー</em>がついた<br /><em>トクベツなギア</em>が手に入るショップ
	case GesoTown_Description = "GesoTown_Description"
	/// 本日のピックアップ
	case GesoTown_Feature = "GesoTown_Feature"
	/// ピックアップ
	case GesoTown_Featured = "GesoTown_Featured"
	/// <strong>{ 0 }</strong> につきやすいギアパワー
	case GesoTown_FrequentGearPower = "GesoTown_FrequentGearPower"
	/// <em>{ 0 }</em> まで
	case GesoTown_Limit = "GesoTown_Limit"
	/// おカネ
	case GesoTown_Money = "GesoTown_Money"
	/// 次のギア
	case GesoTown_Next = "GesoTown_Next"
	/// 次のピックアップ
	case GesoTown_NextFeature = "GesoTown_NextFeature"
	/// 期限切れ
	case GesoTown_NotAvailable = "GesoTown_NotAvailable"
	/// 注文する
	case GesoTown_Order = "GesoTown_Order"
	/// ご注文はいますぐ！
	case GesoTown_OrderNow = "GesoTown_OrderNow"
	/// 注文済み
	case GesoTown_Ordered = "GesoTown_Ordered"
	/// 在庫確認中...
	case GesoTown_Pending = "GesoTown_Pending"
	/// 前のギア
	case GesoTown_Previous = "GesoTown_Previous"
	/// まもなく終了
	case GesoTown_RemainAlmostFinished = "GesoTown_RemainAlmostFinished"
	/// あと{ 0 }時間
	case GesoTown_RemainHour = "GesoTown_RemainHour"
	/// あと{ 0 }分
	case GesoTown_RemainMinute = "GesoTown_RemainMinute"
	/// すでに注文済みのギアがあります
	case GesoTown_Remind = "GesoTown_Remind"
	/// 注文済みのギアはキャンセルされます
	case GesoTown_RemindCaution = "GesoTown_RemindCaution"
	/// ご注文は、1回につき1コとなります
	case GesoTown_Rule1 = "GesoTown_Rule1"
	/// 注文済みのギアは、広場のスパイキーから購入できます
	case GesoTown_Rule2 = "GesoTown_Rule2"
	/// 購入前に新しく注文すると、注文済みのギアはキャンセルされます
	case GesoTown_Rule3 = "GesoTown_Rule3"
	/// 購入後、新しい注文が可能になります
	case GesoTown_Rule4 = "GesoTown_Rule4"
	/// ただいま販売中のギア
	case GesoTown_Stock = "GesoTown_Stock"
	/// 商品は4時間ごとに入れ替わります
	case GesoTown_StockGuide = "GesoTown_StockGuide"
	/// ゲソタウン
	case GesoTown_Title = "GesoTown_Title"
	/// 受付できません
	case GesoTown_UnableToOrder = "GesoTown_UnableToOrder"
	/// この商品は現在取り扱っておりません
	case GesoTown_UnableToOrderMessage = "GesoTown_UnableToOrderMessage"
	/// １号
	case HeroRecord_Agent1 = "HeroRecord_Agent1"
	/// ２号
	case HeroRecord_Agent2 = "HeroRecord_Agent2"
	/// サイズを選んでダウンロードしてください
	case HeroRecord_Annotation = "HeroRecord_Annotation"
	/// ヒーローモード
	case HeroRecord_AppName = "HeroRecord_AppName"
	/// スナップ写真
	case HeroRecord_AreaMemorialPhoto = "HeroRecord_AreaMemorialPhoto"
	/// ボス
	case HeroRecord_BossStage = "HeroRecord_BossStage"
	/// ヒーローモード クリア特典
	case HeroRecord_ClearReward = "HeroRecord_ClearReward"
	/// 特典をゲット
	case HeroRecord_GetReward = "HeroRecord_GetReward"
	/// オルタナ探索率100% 達成特典
	case HeroRecord_NawabariMapCompleteReward = "HeroRecord_NawabariMapCompleteReward"
	/// オルタナ探索率
	case HeroRecord_NawabariMapProgress = "HeroRecord_NawabariMapProgress"
	/// クリアおめでとう！
	case HeroRecord_NawabariMapSubCleared = "HeroRecord_NawabariMapSubCleared"
	/// 100%踏破おめでとう！
	case HeroRecord_NawabariMapSubComplete = "HeroRecord_NawabariMapSubComplete"
	/// オルタナを100%踏破すると…？
	case HeroRecord_NawabariMapSubInProgress = "HeroRecord_NawabariMapSubInProgress"
	/// 次へ
	case HeroRecord_Next = "HeroRecord_Next"
	/// そうびなし
	case HeroRecord_NoEquipments = "HeroRecord_NoEquipments"
	/// 前へ
	case HeroRecord_Prev = "HeroRecord_Prev"
	/// イイ目をしたワカモノ求む！！
	case HeroRecord_Recruitment = "HeroRecord_Recruitment"
	/// ヒーローモード をはじめて冒険をすすめよう
	case HeroRecord_RecruitmentSub = "HeroRecord_RecruitmentSub"
	/// 探索率
	case HeroRecord_SearchRatio = "HeroRecord_SearchRatio"
	/// スナップ写真を見る
	case HeroRecord_SeePhotograph = "HeroRecord_SeePhotograph"
	/// サイト { 0 }
	case HeroRecord_Site = "HeroRecord_Site"
	/// みらいユートピアランド
	case HeroRecord_Site1 = "HeroRecord_Site1"
	/// あんしんライフファクトリー
	case HeroRecord_Site2 = "HeroRecord_Site2"
	/// ながいきヤングニュータウン
	case HeroRecord_Site3 = "HeroRecord_Site3"
	/// うめたてドリームランド
	case HeroRecord_Site4 = "HeroRecord_Site4"
	/// あすなろグリーンヒルズ
	case HeroRecord_Site5 = "HeroRecord_Site5"
	/// しあわせリサーチラボ
	case HeroRecord_Site6 = "HeroRecord_Site6"
	/// ヒーローモードのきろく
	case HeroRecord_Title = "HeroRecord_Title"
	/// 特製壁紙
	case HeroRecord_Wallpaper = "HeroRecord_Wallpaper"
	/// すべてのバッジ（{ 0 }）
	case History_AllBadges = "History_AllBadges"
	/// ヒストリー
	case History_AppName = "History_AppName"
	/// バッジ
	case History_Badge = "History_Badge"
	/// { 0 }<small>回</small>
	case History_Count = "History_Count"
	/// 推定順位
	case History_EstimatedRanking = "History_EstimatedRanking"
	/// もっともよく使ったブキ
	case History_FrequentlyUsedWeapon = "History_FrequentlyUsedWeapon"
	/// 最高ウデマエ
	case History_HighestUdemae = "History_HighestUdemae"
	/// 最高Xランキング・最高Xパワー
	case History_HighestXranking = "History_HighestXranking"
	/// 最近 3ヶ月
	case History_Latest = "History_Latest"
	/// 最近ゲットしたバッジ
	case History_LatestBadge = "History_LatestBadge"
	/// 月間
	case History_Monthly = "History_Monthly"
	/// その他
	case History_Others = "History_Others"
	/// ランク
	case History_Rank = "History_Rank"
	/// { 0 }<small>位</small>
	case History_Ranking = "History_Ranking"
	/// シーズン
	case History_Season = "History_Season"
	/// すべてのバッジを見る
	case History_ShowAllBadges = "History_ShowAllBadges"
	/// 表示を減らす
	case History_ShowLess = "History_ShowLess"
	/// もっと見る
	case History_ShowMore = "History_ShowMore"
	/// Xランキングを見る
	case History_ShowXranking = "History_ShowXranking"
	/// { 0 } からプレイ（{ 1 } 更新）
	case History_Since = "History_Since"
	/// サマリー
	case History_Summary = "History_Summary"
	/// ヒストリー
	case History_Title = "History_Title"
	/// 今まで塗った面積
	case History_TotalTurfPoint = "History_TotalTurfPoint"
	/// 総勝利数
	case History_TotalWin = "History_TotalWin"
	/// { 0 }p
	case History_TurfPoint = "History_TurfPoint"
	/// ウデマエ
	case History_Udemae = "History_Udemae"
	/// ブキヒストリー
	case History_Weapon = "History_Weapon"
	/// ブキ使用率
	case History_WeaponUsage = "History_WeaponUsage"
	/// Xマッチ
	case History_Xmatch = "History_Xmatch"
	/// ※アプリをインストールしていない方は、このボタンを押しても開きません
	case Landing_Caution = "Landing_Caution"
	/// Apple、Appleロゴ、App Storeは、Apple Inc.の商標です。Google Play および Google Play ロゴは Google LLC の商標です。
	case Landing_Copyright = "Landing_Copyright"
	/// App Storeからダウンロード
	case Landing_DlAppStore = "Landing_DlAppStore"
	/// Google Playで手に入れよう
	case Landing_DlGooglePlay = "Landing_DlGooglePlay"
	/// アプリのダウンロードはこちら
	case Landing_Download = "Landing_Download"
	/// Nintendo Switch Online
	case Landing_Nso = "Landing_Nso"
	/// アプリを開く
	case Landing_OpenApp = "Landing_OpenApp"
	/// スプラトゥーン3
	case Landing_Splatoon3 = "Landing_Splatoon3"
	/// スマートフォンアプリ『Nintendo Switch Online』を開きます
	case Landing_Title = "Landing_Title"
	/// メモリープレーヤー
	case MemoryPlayer_AppName = "MemoryPlayer_AppName"
	/// コピーしました
	case MemoryPlayer_Copied = "MemoryPlayer_Copied"
	/// バトルメモリーのダウンロード
	case MemoryPlayer_Download = "MemoryPlayer_Download"
	/// ダウンロード予約に失敗しました
	case MemoryPlayer_FailedDownload = "MemoryPlayer_FailedDownload"
	/// ダウンロードしたバトルメモリーは<br />スプラトゥーン3のロビー端末のメモリープレーヤーで再生することができます
	case MemoryPlayer_Guide = "MemoryPlayer_Guide"
	/// Loading...
	case MemoryPlayer_Loading = "MemoryPlayer_Loading"
	/// 最新の50件を表示しています<br />保存期間は30日です
	case MemoryPlayer_Notice = "MemoryPlayer_Notice"
	/// コードを入力
	case MemoryPlayer_Placeholder = "MemoryPlayer_Placeholder"
	/// ダウンロードコード
	case MemoryPlayer_ReplayCode = "MemoryPlayer_ReplayCode"
	/// データが見つかりません
	case MemoryPlayer_ReplayNotAvailable = "MemoryPlayer_ReplayNotAvailable"
	/// ダウンロード予約しました
	case MemoryPlayer_ReservedDownload = "MemoryPlayer_ReservedDownload"
	/// 送信
	case MemoryPlayer_Send = "MemoryPlayer_Send"
	/// メモリープレーヤー
	case MemoryPlayer_Title = "MemoryPlayer_Title"
	/// アップロードした人
	case MemoryPlayer_UploadBy = "MemoryPlayer_UploadBy"
	/// アップロードしたバトルメモリー
	case MemoryPlayer_Uploaded = "MemoryPlayer_Uploaded"
	/// マイコーデをつくる
	case MyOutfits_Add = "MyOutfits_Add"
	/// + このそうびをマイコーデに追加
	case MyOutfits_AddCurrentEquipments = "MyOutfits_AddCurrentEquipments"
	/// すべて表示
	case MyOutfits_All = "MyOutfits_All"
	/// マイコーデ
	case MyOutfits_AppName = "MyOutfits_AppName"
	/// ブランド
	case MyOutfits_Brand = "MyOutfits_Brand"
	/// カメラオプション
	case MyOutfits_CameraOption = "MyOutfits_CameraOption"
	/// カメラオプションを隠す
	case MyOutfits_CloseCameraOption = "MyOutfits_CloseCameraOption"
	/// フク
	case MyOutfits_Cloth = "MyOutfits_Cloth"
	/// 現在のそうび
	case MyOutfits_CurrentEquipments = "MyOutfits_CurrentEquipments"
	/// 現在のそうびは最後に対戦を行った内容を表示しています
	case MyOutfits_CurrentEquipmentsGuide = "MyOutfits_CurrentEquipmentsGuide"
	/// 選択中のギア
	case MyOutfits_CurrentGear = "MyOutfits_CurrentGear"
	/// 選択中のブキ
	case MyOutfits_CurrentWeapon = "MyOutfits_CurrentWeapon"
	/// 保存に失敗しました
	case MyOutfits_ErrorSave = "MyOutfits_ErrorSave"
	/// ケイケン値 <em>{ 0 }</em>
	case MyOutfits_Exp = "MyOutfits_Exp"
	/// 絞り込む
	case MyOutfits_Filter = "MyOutfits_Filter"
	/// ギア
	case MyOutfits_Gear = "MyOutfits_Gear"
	/// ギアパワー
	case MyOutfits_GearPower = "MyOutfits_GearPower"
	/// 追加ギアパワー1個は、基本ギアパワー0.3個分の効果です
	case MyOutfits_GearPowerAnnotation = "MyOutfits_GearPowerAnnotation"
	/// マイコーデをつくってみよう
	case MyOutfits_Guide = "MyOutfits_Guide"
	/// ギアを選択するとギアパワーの内訳が表示されます
	case MyOutfits_GuideGearPowerButton = "MyOutfits_GuideGearPowerButton"
	/// マイコーデは5つまで作成することができます
	case MyOutfits_GuideLimitation = "MyOutfits_GuideLimitation"
	/// ジャイロ操作感度
	case MyOutfits_Gyro = "MyOutfits_Gyro"
	/// ジャイロ操作
	case MyOutfits_GyroControl = "MyOutfits_GyroControl"
	/// 携帯モード
	case MyOutfits_HandheldMode = "MyOutfits_HandheldMode"
	/// アタマ
	case MyOutfits_Head = "MyOutfits_Head"
	/// メインウェポン
	case MyOutfits_Main = "MyOutfits_Main"
	/// 一致するギアがありません
	case MyOutfits_NoGears = "MyOutfits_NoGears"
	/// 一致するブキがありません
	case MyOutfits_NoWeapons = "MyOutfits_NoWeapons"
	/// ノーマル
	case MyOutfits_Normal = "MyOutfits_Normal"
	/// マイコーデ { 0 }
	case MyOutfits_Number = "MyOutfits_Number"
	/// OFF
	case MyOutfits_Off = "MyOutfits_Off"
	/// ON
	case MyOutfits_On = "MyOutfits_On"
	/// カメラオプションを表示する
	case MyOutfits_OpenCameraOption = "MyOutfits_OpenCameraOption"
	/// { 0 } 左右操作
	case MyOutfits_RControl = "MyOutfits_RControl"
	/// { 0 } 操作感度
	case MyOutfits_RHorizontal = "MyOutfits_RHorizontal"
	/// ジャイロ操作OFFの時は無効になります
	case MyOutfits_RHorizontalUnavailable = "MyOutfits_RHorizontalUnavailable"
	/// { 0 } 上下操作
	case MyOutfits_RVertical = "MyOutfits_RVertical"
	/// ジャイロ操作ONの時は無効になります
	case MyOutfits_RVerticalUnavailable = "MyOutfits_RVerticalUnavailable"
	/// レアド { 0 }
	case MyOutfits_Rarity = "MyOutfits_Rarity"
	/// リバース
	case MyOutfits_Reverse = "MyOutfits_Reverse"
	/// 保存
	case MyOutfits_Save = "MyOutfits_Save"
	/// { 0 }を選ぶ
	case MyOutfits_Select = "MyOutfits_Select"
	/// フクを選ぶ
	case MyOutfits_SelectCloth = "MyOutfits_SelectCloth"
	/// アタマを選ぶ
	case MyOutfits_SelectHead = "MyOutfits_SelectHead"
	/// クツを選ぶ
	case MyOutfits_SelectShoes = "MyOutfits_SelectShoes"
	/// 保存先の選択
	case MyOutfits_SelectSlot = "MyOutfits_SelectSlot"
	/// ブキを選ぶ
	case MyOutfits_SelectWeapon = "MyOutfits_SelectWeapon"
	/// クツ
	case MyOutfits_Shoes = "MyOutfits_Shoes"
	/// スペシャルウェポン
	case MyOutfits_Special = "MyOutfits_Special"
	/// サブウェポン
	case MyOutfits_Sub = "MyOutfits_Sub"
	/// 決定
	case MyOutfits_SubmitGear = "MyOutfits_SubmitGear"
	/// 決定
	case MyOutfits_SubmitWeapon = "MyOutfits_SubmitWeapon"
	/// マイコーデ
	case MyOutfits_Title = "MyOutfits_Title"
	/// 今まで塗った面積 <em>{ 0 }p</em>
	case MyOutfits_TurfPoint = "MyOutfits_TurfPoint"
	/// TVモード/テーブルモード
	case MyOutfits_TvTabletopMode = "MyOutfits_TvTabletopMode"
	/// ブキ
	case MyOutfits_Weapon = "MyOutfits_Weapon"
	/// 写真は20枚までアップロードできます<br />保存期間は3ヶ月です
	case PhotoAlbum_Annotation = "PhotoAlbum_Annotation"
	/// アルバム
	case PhotoAlbum_AppName = "PhotoAlbum_AppName"
	/// 選択
	case PhotoAlbum_Select = "PhotoAlbum_Select"
	/// フォトアルバム
	case PhotoAlbum_Title = "PhotoAlbum_Title"
	/// QRコードリーダー
	case QRCodeReader_AppName = "QRCodeReader_AppName"
	/// 日時: { 0 }
	case QRCodeReader_CheckinDate = "QRCodeReader_CheckinDate"
	/// 許可
	case QRCodeReader_ConfirmationAllow = "QRCodeReader_ConfirmationAllow"
	/// 許可しない
	case QRCodeReader_ConfirmationDeny = "QRCodeReader_ConfirmationDeny"
	/// このほうしゅうはすでに獲得済みです
	case QRCodeReader_ErrorAlreadyGotDescription = "QRCodeReader_ErrorAlreadyGotDescription"
	/// すでに獲得しています
	case QRCodeReader_ErrorAlreadyGotTitle = "QRCodeReader_ErrorAlreadyGotTitle"
	/// イカリング３で読み取ることのできる<br />QRコードではありません
	case QRCodeReader_ErrorNotCompatibleDescription = "QRCodeReader_ErrorNotCompatibleDescription"
	/// エラー
	case QRCodeReader_ErrorNotCompatibleTitle = "QRCodeReader_ErrorNotCompatibleTitle"
	/// このQRコードはすでに無効です
	case QRCodeReader_ErrorRewardExpiredDescription = "QRCodeReader_ErrorRewardExpiredDescription"
	/// イカリング３のQRコード読み取り機能がご利用いただけます。<br />QRコードの読み取りをご利用いただくと、どのQRコードを読み取ったかという情報が任天堂に送信され、アプリ内でQRコードの読み取り履歴を確認できるようになります。これにより、任天堂がお客様の位置情報を知ることができる場合があります。<br />以下のお客様の選択は保存されず、QRコードの読み取りをご利用いただくたびにお客様の同意（GDPR【第】6条【第】1項(a))が求められます。
	case QRCodeReader_EuConfirmation = "QRCodeReader_EuConfirmation"
	/// 特定の場所にあるQRコードを読み取ると<br />特別なほうしゅうをゲットできます
	case QRCodeReader_Guide = "QRCodeReader_Guide"
	/// 履歴
	case QRCodeReader_History = "QRCodeReader_History"
	/// ほうしゅうの受け取りは<br />スプラトゥーン3のロビー端末を使ってね
	case QRCodeReader_HowToGetReward = "QRCodeReader_HowToGetReward"
	/// これまでの読み取り履歴が表示されます
	case QRCodeReader_NoData = "QRCodeReader_NoData"
	/// カメラでQRコードを読み取る
	case QRCodeReader_ReadQrcodeByCamera = "QRCodeReader_ReadQrcodeByCamera"
	/// 保存した画像から読み取る
	case QRCodeReader_ReadQrcodeByFile = "QRCodeReader_ReadQrcodeByFile"
	/// QRコードリーダー
	case QRCodeReader_Title = "QRCodeReader_Title"
	/// 最後に遊んだ
	case Record_LatestPlayed = "Record_LatestPlayed"
	/// よく使う
	case Record_LatestUsed = "Record_LatestUsed"
	/// メイン
	case Record_Main = "Record_Main"
	/// じゅくれん度アップまで
	case Record_NextSkillLevel = "Record_NextSkillLevel"
	/// じゅくれん度
	case Record_SkillLevel = "Record_SkillLevel"
	/// 並び替え
	case Record_Sort = "Record_Sort"
	/// スペシャル
	case Record_Special = "Record_Special"
	/// ステージのきろく
	case Record_StageRecord = "Record_StageRecord"
	/// ステージ
	case Record_StageRecordAppName = "Record_StageRecordAppName"
	/// サブ
	case Record_Sub = "Record_Sub"
	/// きろく
	case Record_Title = "Record_Title"
	/// { 0 }p
	case Record_TotalTurfPoint = "Record_TotalTurfPoint"
	/// 塗りポイント
	case Record_TurfPoint = "Record_TurfPoint"
	/// 遊んでないステージ
	case Record_UnplayedStages = "Record_UnplayedStages"
	/// 未所持のブキ
	case Record_UnusedWeapons = "Record_UnusedWeapons"
	/// チョーシ
	case Record_Vibes = "Record_Vibes"
	/// ブキのきろく
	case Record_WeaponRecord = "Record_WeaponRecord"
	/// ブキ
	case Record_WeaponRecordAppName = "Record_WeaponRecordAppName"
	/// 勝利数
	case Record_WinCount = "Record_WinCount"
	/// { 0 }%
	case Record_WinRatio = "Record_WinRatio"
	/// 権利表記
	case Settings_Acknowledgements = "Settings_Acknowledgements"
	/// 設定
	case Settings_AppName = "Settings_AppName"
	/// クレジット
	case Settings_Credits = "Settings_Credits"
	/// 設定
	case Settings_Title = "Settings_Title"
	/// バンカラマッチ
	case StageSchedule_Bankara = "StageSchedule_Bankara"
	/// オープン
	case StageSchedule_BankaraOpen = "StageSchedule_BankaraOpen"
	/// チャレンジ
	case StageSchedule_BankaraOpenChallenge = "StageSchedule_BankaraOpenChallenge"
	/// サーモンラン
	case StageSchedule_Coop = "StageSchedule_Coop"
	/// NOW OPEN！
	case StageSchedule_CoopCurrentPeriodStart = "StageSchedule_CoopCurrentPeriodStart"
	/// イベント開催！
	case StageSchedule_Eventmatch = "StageSchedule_Eventmatch"
	/// フェスマッチ
	case StageSchedule_Festival = "StageSchedule_Festival"
	/// もうすぐ開催
	case StageSchedule_FestivalAnnounced = "StageSchedule_FestivalAnnounced"
	/// { 0 } スタート！
	case StageSchedule_FestivalAt = "StageSchedule_FestivalAt"
	/// 攻撃
	case StageSchedule_FestivalAttack = "StageSchedule_FestivalAttack"
	/// 守備
	case StageSchedule_FestivalDefense = "StageSchedule_FestivalDefense"
	/// 開催中！
	case StageSchedule_FestivalHolding = "StageSchedule_FestivalHolding"
	/// { 0 } - { 1 }
	case StageSchedule_FestivalPeriod = "StageSchedule_FestivalPeriod"
	/// そのつぎ
	case StageSchedule_Future = "StageSchedule_Future"
	/// リーグマッチ
	case StageSchedule_League = "StageSchedule_League"
	/// つぎ
	case StageSchedule_Next = "StageSchedule_Next"
	/// ビッグラン接近中！
	case StageSchedule_NoticeBigrun = "StageSchedule_NoticeBigrun"
	/// 期間限定バイト開催予告！
	case StageSchedule_NoticeLimited = "StageSchedule_NoticeLimited"
	/// フェスマッチ開催中！
	case StageSchedule_NowClosed = "StageSchedule_NowClosed"
	/// オープン！
	case StageSchedule_Open = "StageSchedule_Open"
	/// ビッグラン発生中！
	case StageSchedule_OpenBigrun = "StageSchedule_OpenBigrun"
	/// 期間限定バイト開催中！
	case StageSchedule_OpenLimited = "StageSchedule_OpenLimited"
	/// プライベートマッチ
	case StageSchedule_Private = "StageSchedule_Private"
	/// ビッグランがやってくる！！バイト大募集 { 0 }
	case StageSchedule_Recruit = "StageSchedule_Recruit"
	/// レギュラーマッチ
	case StageSchedule_Regular = "StageSchedule_Regular"
	/// フェスのきろくを見る
	case StageSchedule_SeeFestivalRecord = "StageSchedule_SeeFestivalRecord"
	/// ランダム
	case StageSchedule_SuppliedWeaponRandom = "StageSchedule_SuppliedWeaponRandom"
	/// 支給ブキ
	case StageSchedule_SuppliedWeapons = "StageSchedule_SuppliedWeapons"
	/// スケジュール
	case StageSchedule_Title = "StageSchedule_Title"
	/// ルールごとの勝率
	case StageSchedule_WinRateByRules = "StageSchedule_WinRateByRules"
	/// Xマッチ
	case StageSchedule_Xmatch = "StageSchedule_Xmatch"
	/// １００倍マッチ
	case VSHistory_100x = "VSHistory_100x"
	/// １０倍マッチ
	case VSHistory_10x = "VSHistory_10x"
	/// ３３３倍マッチ
	case VSHistory_333x = "VSHistory_333x"
	/// 人数が少ない時間が続いたため、負けとしてカウントされませんでした
	case VSHistory_AnnotationExemption = "VSHistory_AnnotationExemption"
	/// 無効試合になりました
	case VSHistory_AnnotationNocontest = "VSHistory_AnnotationNocontest"
	/// 正常に試合が終了しませんでした
	case VSHistory_AnnotationPenalty = "VSHistory_AnnotationPenalty"
	/// 攻撃
	case VSHistory_Attack = "VSHistory_Attack"
	/// { 0 }分あたりのアベレージ
	case VSHistory_Average = "VSHistory_Average"
	/// きん
	case VSHistory_AwardGold = "VSHistory_AwardGold"
	/// ぎん
	case VSHistory_AwardSilver = "VSHistory_AwardSilver"
	/// バンカラマッチ
	case VSHistory_Bankara = "VSHistory_Bankara"
	/// バンカラマッチ チャレンジ
	case VSHistory_BankaraChallenge = "VSHistory_BankaraChallenge"
	/// バンカラマッチ オープン
	case VSHistory_BankaraOpen = "VSHistory_BankaraOpen"
	/// 清算
	case VSHistory_Cleaning = "VSHistory_Cleaning"
	/// こうけん度 { 0 }
	case VSHistory_Contribute = "VSHistory_Contribute"
	/// { 0 }カウント
	case VSHistory_Count = "VSHistory_Count"
	/// たおされたかいすう
	case VSHistory_DeathCount = "VSHistory_DeathCount"
	/// 守備
	case VSHistory_Defense = "VSHistory_Defense"
	/// DRAW
	case VSHistory_Draw = "VSHistory_Draw"
	/// そうびしていたギア
	case VSHistory_EquippedGear = "VSHistory_EquippedGear"
	/// そうびしていたブキ
	case VSHistory_EquippedWeapon = "VSHistory_EquippedWeapon"
	/// { 0 }人の { 1 } パワー 推定 { 2 }
	case VSHistory_EstimatedRoomPower = "VSHistory_EstimatedRoomPower"
	/// フェスマッチ（チャレンジ）
	case VSHistory_FesChallenge = "VSHistory_FesChallenge"
	/// フェスマッチ（オープン）
	case VSHistory_FesOpen = "VSHistory_FesOpen"
	/// { 0 }チーム
	case VSHistory_FesTeam = "VSHistory_FesTeam"
	/// オマツリのあかし
	case VSHistory_FesWinProof = "VSHistory_FesWinProof"
	/// { 0 }{ 1 }パワー
	case VSHistory_FestPower = "VSHistory_FestPower"
	/// フェスマッチ
	case VSHistory_Festival = "VSHistory_Festival"
	/// オマツリガイ x{ 0 }
	case VSHistory_FestivalShell = "VSHistory_FestivalShell"
	/// バトルのきろくに戻る
	case VSHistory_GoToStats = "VSHistory_GoToStats"
	/// ゲットした表彰
	case VSHistory_GotAwards = "VSHistory_GotAwards"
	/// ぬりまといかくほ
	case VSHistory_GotTricolorTreasure = "VSHistory_GotTricolorTreasure"
	/// 挑戦中
	case VSHistory_InChallenge = "VSHistory_InChallenge"
	/// たおしたかいすう
	case VSHistory_KillCount = "VSHistory_KillCount"
	/// ノックアウト！
	case VSHistory_Knockout = "VSHistory_Knockout"
	/// 最近の50戦
	case VSHistory_Latest = "VSHistory_Latest"
	/// 最新のバトル
	case VSHistory_LatestBattle = "VSHistory_LatestBattle"
	/// 最近
	case VSHistory_LatestTab = "VSHistory_LatestTab"
	/// LOSE...
	case VSHistory_Lose = "VSHistory_Lose"
	/// Xパワー計測中
	case VSHistory_Measurement = "VSHistory_Measurement"
	/// 次のバトル
	case VSHistory_NextBattle = "VSHistory_NextBattle"
	/// バトルのきろくがありません
	case VSHistory_NoData = "VSHistory_NoData"
	/// バトルのきろくを表示できません
	case VSHistory_NotAvailable = "VSHistory_NotAvailable"
	/// 閲覧できるバトルのきろくは、モードごとに最新の50戦までです。
	case VSHistory_NotAvailableDescription = "VSHistory_NotAvailableDescription"
	/// （おそろいボーナス x{ 0 }）
	case VSHistory_OutfitBonus = "VSHistory_OutfitBonus"
	/// 前のバトル
	case VSHistory_PreviousBattle = "VSHistory_PreviousBattle"
	/// プライベートマッチ
	case VSHistory_Private = "VSHistory_Private"
	/// 昇格戦
	case VSHistory_Promo = "VSHistory_Promo"
	/// レギュラーマッチ
	case VSHistory_Regular = "VSHistory_Regular"
	/// スペシャルウェポンはつどうかいすう
	case VSHistory_SpCount = "VSHistory_SpCount"
	/// バトル
	case VSHistory_Title = "VSHistory_Title"
	/// トライかいすう
	case VSHistory_TryCount = "VSHistory_TryCount"
	/// { 0 }p
	case VSHistory_TurfPoint = "VSHistory_TurfPoint"
	/// ウデマエポイント
	case VSHistory_UdemaePoint = "VSHistory_UdemaePoint"
	/// { 0 }p
	case VSHistory_UdemaePointScore = "VSHistory_UdemaePointScore"
	/// 挑戦中止
	case VSHistory_UdemaeReset = "VSHistory_UdemaeReset"
	/// ウデマエアップ！
	case VSHistory_UdemaeUp = "VSHistory_UdemaeUp"
	/// WIN!
	case VSHistory_Win = "VSHistory_Win"
	/// 勝敗数について
	case VSHistory_WinMeterGuide = "VSHistory_WinMeterGuide"
	/// { 0 }連勝
	case VSHistory_Wins = "VSHistory_Wins"
	/// おうかん
	case VSHistory_Xcrown = "VSHistory_Xcrown"
	/// Xマッチ
	case VSHistory_Xmatch = "VSHistory_Xmatch"
	/// Xパワー { 0 }
	case VSHistory_Xpower = "VSHistory_Xpower"
	/// イカリング３はスプラトゥーン3と連動するサービスです。<br />ここで紹介したもの以外にもさまざまな機能があります。
	case Welcome_About = "Welcome_About"
	/// バトルの戦績やスケジュールをチェックして<br />ライバルに差をつけろ！
	case Welcome_Feature1 = "Welcome_Feature1"
	/// バトルの戦績やスケジュール
	case Welcome_Feature1Alt = "Welcome_Feature1Alt"
	/// ファッションリーダーたちに朗報！<br />いつでもマイコーデを編集できるぞ！
	case Welcome_Feature2 = "Welcome_Feature2"
	/// ひとり旅に出たロブを支援して<br />特別な報酬をゲットしよう！
	case Welcome_Feature3 = "Welcome_Feature3"
	/// ここだけの特別仕様！<br />ゲソタウンで限定ギアをチェック！
	case Welcome_Feature4 = "Welcome_Feature4"
	/// Features
	case Welcome_Features = "Welcome_Features"
	/// https://store-jp.nintendo.com/list/software/70010000046394.html
	case Welcome_Link = "Welcome_Link"
	/// 他にも便利な機能がたくさん！
	case Welcome_OtherFeatures = "Welcome_OtherFeatures"
	/// 本気のヤツらのためのイカしたサービス
	case Welcome_Service = "Welcome_Service"
	/// スプラトゥーン3
	case Welcome_Splatoon3 = "Welcome_Splatoon3"
	/// 購入サイトへ
	case Welcome_Store = "Welcome_Store"
	/// My Nintendo Store
	case Welcome_Store1 = "Welcome_Store1"
	/// ウィジェット
	case Welcome_Widgets = "Welcome_Widgets"
	/// すべて表示
	case XRanking_All = "XRanking_All"
	/// Xランキング
	case XRanking_AppName = "XRanking_AppName"
	/// グループ・アロメ
	case XRanking_Atlantic = "XRanking_Atlantic"
	/// 推定{ 0 }位
	case XRanking_EstimatedRank = "XRanking_EstimatedRank"
	/// 計測中
	case XRanking_Measurement = "XRanking_Measurement"
	/// 開催中！！
	case XRanking_Open = "XRanking_Open"
	/// グループ・ヤコ
	case XRanking_Pacific = "XRanking_Pacific"
	/// 過去のランキング
	case XRanking_PastRankings = "XRanking_PastRankings"
	/// { 0 } - { 1 }
	case XRanking_Period = "XRanking_Period"
	/// { 0 }<small>位</small>
	case XRanking_Rank = "XRanking_Rank"
	/// グループ
	case XRanking_Region = "XRanking_Region"
	/// ランキングを見る
	case XRanking_SeeRanking = "XRanking_SeeRanking"
	/// ブキトップを見る
	case XRanking_SeeWeaponTop = "XRanking_SeeWeaponTop"
	/// ブキを選ぶ
	case XRanking_SelectWeapon = "XRanking_SelectWeapon"
	/// Xランキング
	case XRanking_Title = "XRanking_Title"
	/// トップ 500
	case XRanking_Top500 = "XRanking_Top500"
	/// トッププレイヤー
	case XRanking_TopPlayers = "XRanking_TopPlayers"
	/// ブキトップ プレイヤー
	case XRanking_WeaponTop = "XRanking_WeaponTop"
	/// ブキトップ プレイヤー
	case XRanking_WeaponTopSingular = "XRanking_WeaponTopSingular"
	/// おうかん
	case XRanking_Xcrown = "XRanking_Xcrown"
	/// <small>Xパワー</small> { 0 }
	case XRanking_Xpower = "XRanking_Xpower"
	/// イカリング３のアルバムの画像を表示します。
	case Widgets_AlbumDescription = "Widgets_AlbumDescription"
	/// スプラトゥーン3でイカした写真を<br />撮影するとココに表示されるぞ！
	case Widgets_AlbumNoPhoto = "Widgets_AlbumNoPhoto"
	/// アルバム
	case Widgets_AlbumTitle = "Widgets_AlbumTitle"
	/// スプラトゥーン3の現在のそうびを表示します。
	case Widgets_EquipmentsDescription = "Widgets_EquipmentsDescription"
	/// 現在のそうび
	case Widgets_EquipmentsTitle = "Widgets_EquipmentsTitle"
	/// このウィジェットはスプラトゥーン3の連携サービスです。ゲームを遊ぶとデータが蓄積され利用できるようになります
	case Widgets_ErrorsNoData = "Widgets_ErrorsNoData"
	/// スマートフォンアプリ『Nintendo Switch Online』にログインしてください
	case Widgets_ErrorsNotLoggedIn = "Widgets_ErrorsNotLoggedIn"
	/// 現在利用できません
	case Widgets_ErrorsOutOfService = "Widgets_ErrorsOutOfService"
	/// Nintendo Switch Onlineアプリを更新してください
	case Widgets_ErrorsUpdateRequired = "Widgets_ErrorsUpdateRequired"
	/// ロード中
	case Widgets_Loading = "Widgets_Loading"
	/// バンカラマッチ
	case Widgets_StagesBankara = "Widgets_StagesBankara"
	/// サーモンラン
	case Widgets_StagesCoop = "Widgets_StagesCoop"
	/// M/d HH:mm
	case Widgets_StagesDatetimeFormat = "Widgets_StagesDatetimeFormat"
	/// スプラトゥーン3のステージスケジュールを表示します。
	case Widgets_StagesDescription = "Widgets_StagesDescription"
	/// スプラトゥーン3のステージスケジュールと現在のそうびを表示します。
	case Widgets_StagesDescriptionAndroid = "Widgets_StagesDescriptionAndroid"
	/// フェスマッチ開催中！
	case Widgets_StagesFestMatch = "Widgets_StagesFestMatch"
	/// まもなくフェスマッチ開催
	case Widgets_StagesFestMatchAnnounced = "Widgets_StagesFestMatchAnnounced"
	/// リーグマッチ
	case Widgets_StagesLeague = "Widgets_StagesLeague"
	/// スケジュールがありません
	case Widgets_StagesNoData = "Widgets_StagesNoData"
	/// オープン！
	case Widgets_StagesNowOpen = "Widgets_StagesNowOpen"
	/// マテガイ放水路
	case Widgets_StagesPreviewScheduleStage1 = "Widgets_StagesPreviewScheduleStage1"
	/// ヤガラ市場
	case Widgets_StagesPreviewScheduleStage2 = "Widgets_StagesPreviewScheduleStage2"
	/// ゴンズイ地区
	case Widgets_StagesPreviewScheduleStage3 = "Widgets_StagesPreviewScheduleStage3"
	/// ユノハナ大渓谷
	case Widgets_StagesPreviewScheduleStage4 = "Widgets_StagesPreviewScheduleStage4"
	/// 09:00 - 11:00
	case Widgets_StagesPreviewScheduleTimeSpan1 = "Widgets_StagesPreviewScheduleTimeSpan1"
	/// 11:00 - 13:00
	case Widgets_StagesPreviewScheduleTimeSpan2 = "Widgets_StagesPreviewScheduleTimeSpan2"
	/// レギュラーマッチ
	case Widgets_StagesRegular = "Widgets_StagesRegular"
	///  - 
	case Widgets_StagesSeparator = "Widgets_StagesSeparator"
	/// 表示するモード
	case Widgets_StagesSettingsMode = "Widgets_StagesSettingsMode"
	/// 支給ブキ
	case Widgets_StagesSuppliedWeapons = "Widgets_StagesSuppliedWeapons"
	/// HH:mm
	case Widgets_StagesTimeFormat = "Widgets_StagesTimeFormat"
	/// ステージスケジュール
	case Widgets_StagesTitle = "Widgets_StagesTitle"
	/// Xマッチ
	case Widgets_StagesXmatch = "Widgets_StagesXmatch"
	/// yyyy M/d HH:mm
	case Widgets_StagesYearDatetimeFormat = "Widgets_StagesYearDatetimeFormat"
	/// %@カウント
	case Widgets_VsCount = "Widgets_VsCount"
	/// ノックアウト！
	case Widgets_VsKnockout = "Widgets_VsKnockout"
	/// バトルのきろくがありません
	case Widgets_VsNoData = "Widgets_VsNoData"
	/// %@%
	case Widgets_VsPercent = "Widgets_VsPercent"
	/// ナワバリバトル
	case Widgets_VsPreviewRule = "Widgets_VsPreviewRule"
	/// 38.4%
	case Widgets_VsPreviewVsLosePercent = "Widgets_VsPreviewVsLosePercent"
	/// 533p
	case Widgets_VsPreviewVsLoseTurfPoint = "Widgets_VsPreviewVsLoseTurfPoint"
	/// 63.7%
	case Widgets_VsPreviewVsWinPercent = "Widgets_VsPreviewVsWinPercent"
	/// 1162p
	case Widgets_VsPreviewVsWinTurfPoint = "Widgets_VsPreviewVsWinTurfPoint"
	/// %@p
	case Widgets_VsTurfPoint = "Widgets_VsTurfPoint"
	/// スプラトゥーン3のバトルのきろくを表示します。
	case Widgets_VshistoryDescription = "Widgets_VshistoryDescription"
	/// DRAW
	case Widgets_VshistoryDraw = "Widgets_VshistoryDraw"
	/// LOSE...
	case Widgets_VshistoryLose = "Widgets_VshistoryLose"
	/// バトルのきろく
	case Widgets_VshistoryTitle = "Widgets_VshistoryTitle"
	/// WIN!
	case Widgets_VshistoryWin = "Widgets_VshistoryWin"
	/// ラッシュ
	case CoopHistory_EventWave1 = "CoopHistory_EventWave1"
	/// キンシャケ探し
	case CoopHistory_EventWave2 = "CoopHistory_EventWave2"
	/// グリル発進
	case CoopHistory_EventWave3 = "CoopHistory_EventWave3"
	/// ハコビヤ襲来
	case CoopHistory_EventWave4 = "CoopHistory_EventWave4"
	/// 霧
	case CoopHistory_EventWave5 = "CoopHistory_EventWave5"
	/// ドスコイ大量発生
	case CoopHistory_EventWave6 = "CoopHistory_EventWave6"
	/// 巨大タツマキ
	case CoopHistory_EventWave7 = "CoopHistory_EventWave7"
	/// ドロシャケ噴出
	case CoopHistory_EventWave8 = "CoopHistory_EventWave8"
	/// ヨコヅナ
	case CoopHistory_KingSakelien3 = "CoopHistory_KingSakelien3"
}