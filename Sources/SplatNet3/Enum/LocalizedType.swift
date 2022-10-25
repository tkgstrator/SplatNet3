//
//  LocalizedText.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum LocalizedText: String, CaseIterable, Identifiable {
	public var id: String { rawValue }
	/// サーモンラン
	case Carousel_CoopHistory = "54c15b526d57f8415ad0e45a09b8abc79bf8e15fb94502b32845d266b6abd980"
	/// フェス開催！！
	case Carousel_FestOpening = "fb14d4140890a1f062b18f259f6f84780a62abf7851559bd274ffcd92307557f"
	/// フェス結果発表！！
	case Carousel_FestResult = "7163c526ce86b54e1b8a4b46f521c0b14e5216379736d291a1a32581f6f11b85"
	/// ここだけの特別なギア販売中
	case Carousel_Gesotown = "4f0e70793a7435ebf458ced9ce6e7449ad75a3018584ef796da29c8d62b237fc"
	/// 新たなヒーローの物語
	case Carousel_HeroRecord = "da53aeef3243416de57a8b75ebdfbd66bd90f613508836e963fe3960ab123bda"
	/// メモリープレーヤー
	case Carousel_MemoryPlayer = "1e88e385a9f06cb108146051fe21d50e285fd6fc17ff256c8fb69307a8aca086"
	/// マイコーデ
	case Carousel_Myoutfits = "50cdc1d12f051b943c61a6567f99896ef21de2ffd3d5519901e1a192f2e5fe23"
	/// フォトアルバム
	case Carousel_PhotoAlbum = "73c1738373b79051c9c0de0fcb63f0788a598943c99e424a574e84ce964592a9"
	/// 支援者求む！
	case Carousel_Robichi = "2740c1247252039d16ce1fe94d5f510d8fa3c4f0e3e65f4ca717ddcf582dd706"
	/// 前シーズンのヒストリーはこちら！
	case Carousel_StatsLatestSeason = "a28eb43c87288f705568e56445b0c70d06720186412cd7ad6aba4ecf961b9cb9"
	/// バトル戦績
	case Carousel_VsHistory = "3cce5fd57987096ce2b1742743907afafe2dd4b36b01fe8d9981c201ed984bfc"
	/// 二つ名
	case Catalog_Byname = "ac35297fee5b6047c3d2a94c33ed1a0130b4d52eb65935f7379252f219d0d49f"
	/// カードパック
	case Catalog_CardPack = "a388160d2a993981683ca1511d301dafb12120a63fb6cba15d0bd3af8ecf0403"
	/// フレッシュカードパック
	case Catalog_CardPackFresh = "fbb0b947084d022dc826ff712760b034c213fef74c67488340edac0f7cb6bc29"
	/// カードスリーブ
	case Catalog_CardSleeve = "2fa9d18296fcfc7cd7d2309e10c453ebcb96094fe8319b28a3ec17dc315f67f7"
	/// エモート
	case Catalog_Emote = "da7d02862fbc0bbf399fa9988070972ad62c9adb1ef2c8be2921d96780d78b7c"
	/// オキモノ
	case Catalog_Figure = "e63a27ef84a88dcf290d370ba9016d6f8e08c039e2535d2304e3adc62680bd76"
	/// プレート
	case Catalog_NamePlateBg = "a03ff7cd0f180734bc528fd0d95303b7b2597389322f4e35e0dedb33a3171390"
	/// ステッカー
	case Catalog_Sticker = "f67e271000c873d67643e99668e93a6e1c81cba70bf1db04571bf6b24b5fc768"
	/// カタログ
	case Catalog_AppName = "021340297d3697c3bfd0f8fae384a5194e969a9dc0d713a03b3a37cd06244826"
	/// 引き換えできます
	case Catalog_Available = "de69d0524558ef5bd90e9b23f589f3736d881ddefc35e943007da8103fa570f7"
	/// カタログレベルを上げて<br />ミステリーボックスをゲット！
	case Catalog_BonusDescription = "0c5dc764b022dd76c274eb206b13712cd9868a03ec1e8b08fecd26e895f0d9c3"
	/// レベル10ごとにミステリーボックスをゲットできます
	case Catalog_BonusGuide = "5d7d2d10659187abe5d04fed6d0f08ba9ca128588ac1043be44afa60327e116e"
	/// ボーナス！
	case Catalog_BonusTitle = "18f30c47e5cf4b1fe11e15d0c4fa705250ad63df1e5a76875bc4faa88f3f908f"
	/// コンプリート！
	case Catalog_Complete = "415a439a664a2bffe6d459d0dc5b95ff01d41d8391f4df91d77024cfe0d92b54"
	/// { 0 } / { 1 }
	case Catalog_Current = "6f3b4327a6fe9a712f8779892be1b08637b2078d0e55e868208e1236d2fcf283"
	/// Lv. { 0 }
	case Catalog_CurrentExtraLevel = "cdaa19fb42106911eb8671b9573ba6eeb6f651f243c82f41e07134d2d426f89c"
	/// るいけい { 0 } p
	case Catalog_CurrentPoint = "924d48260abf69febec648c659ed9f244ccbc1b4e8e3cbba320d320a02ba7a2e"
	/// 本日初勝利でもれなく<em>{ 0 }</em>ポイントゲット！
	case Catalog_DailyBonus = "5a714ebbddafc3b47064a304fd7404286a9cff9da9f35dcaf96e10eeec6ab4b4"
	/// ドリンクチケット
	case Catalog_DrinkTicket = "92ca83ede50d5f4631cafdf9fb5c8e135f68b76e79c802e67535234af38a87e9"
	/// フェス開催中！ポイント<em>1.2倍</em>！
	case Catalog_FesBonus = "441d9d633967cf0dd2d84934f4b4945df5a89309d3f29c0e2e2b88276cf21550"
	/// フードチケット
	case Catalog_FoodTicket = "6f1efe37eb2ddafc2c19472623980c620c25e98cf687c6fbf97f9b148701fc4b"
	/// ゲット！
	case Catalog_Got = "f3d4f75b3b353dd15a790a92e526761e5a01a3b190551a0f8d8dd493064d6b38"
	/// <em>ランクを4まで上げてザッカ屋でカタログを受け取ろう！</em>
	case Catalog_Guide = "0bda1ef6e311ed1aefc1635e2f40db6c0f4c3afce14115cdf6fee08a5e55bbcf"
	/// x{ 0 }
	case Catalog_ItemAmount = "2df940be976324b43dcaf23f80a41ba7e341232ec953398cba5887d77300f7ad"
	/// カタログレベル
	case Catalog_Level = "12825c6e21fd7f25323062d683084a58db62adfd9d68afcac8c4b325485a22d8"
	/// { 0 } まで
	case Catalog_Limit = "a90c39c95c888e34236dbb06d9af2947566120a5803f8034cd589fe9bee8e50a"
	/// ミステリーボックス
	case Catalog_MysteryBox = "6c92f047e05a7341a233473cf64beac6a566fc3ca37253a7b6941ad721adbea2"
	/// つぎ
	case Catalog_NextBonus = "0d867bb3d5547f5ff8b6995acc1839e0403d7cc394e4f87d70a96d8277582744"
	/// ページ { 0 }
	case Catalog_Page = "3f060a4fdaadcc34b1f59c323c31d60be766931591816c6145b35f1b34726676"
	/// { 0 } / { 1 } ページ
	case Catalog_Pager = "70fd4417104eed1103c08a3dc33bb593c6430fb8a24a51c21e69f5354da32ee7"
	/// { 0 } 開催中！
	case Catalog_Period = "b254f59e9ffe9c20f13a87f5753a9706fc765fb77836f500585819c3d8ee329c"
	/// カタログポイント
	case Catalog_Point = "8231fb5c074c8da278cf888ccf232792d4e3ff316a187d59d32a4a15465b8cf9"
	/// ザッカ屋
	case Catalog_Signboard = "42be1a6fef3428ae2bb9241cee964ccdf363808efcc81dd70a2ea7076f665c16"
	/// カタログ
	case Catalog_Title = "a6dc043a58e811c893c89cf24dacc5e241f0cf78e5ad62f74f75045bddf20ca5"
	/// イカしたカタログ 配布中！
	case Catalog_Welcome = "8f0c387104b3f6787d25594c1511dff9b914da967c6423c4de2f8259ead7685f"
	/// バトルでカタログポイントを貯めて<br />アイテムをゲットしよう！
	case Catalog_WelcomeDescription = "7e31fb9cab4c9f8e70b269102e69439be2cbb0c2c6c29f86d8853c68a0da4cab"
	/// 旅の途中でテンションバクアゲ～！なグラフィティ見つけたから送るね～
	case Challenge_AboutGraffiti = "62d8531fedee5ecfe08a37eb08eae5597f6d0d14c5e63706a42ac38f2ef8f7db"
	/// ロブイチ
	case Challenge_AppName = "a2001c09ac3670c2bfe0d2159e135aca7959856799d3c87f7c1d4f286118db90"
	/// ブラック
	case Challenge_Black = "6eb771e981bf41b9bd75433bc989bfc6c93cd2b5399571e8775ce339f079ee44"
	/// ブルー
	case Challenge_Blue = "b82832424dafc3fe76dab2e23a741b823a20060acbf3f80ec2f1277bc1ae0be7"
	/// チャレンジャー
	case Challenge_Challenger = "03dcce15138fb3b0e2f9af1d203bf047e81fae1fa555eae03702a2af84a76d31"
	/// 支援するチャレンジを選ぶ
	case Challenge_ChooseChallenge = "852b0926e7b8d6b57a4c9e5d5acdc194414f26e32c2b040979a1842184527805"
	/// 達成しました
	case Challenge_Clear = "4be5728add6d757d5bad196672b59e032fdebcc10cda2a0cfdfc42317df7950e"
	/// コンプリート！
	case Challenge_Complete = "d91a2dc90e22d7f2d54d8e53071f6b4852c1d0a80919fad95847f9296da1e6f3"
	/// コンプリート特典
	case Challenge_CompleteReward = "647a8fc363f68c3219ef6c6004295eddc1fd0704ef689c8449dc9ba1b30ae7f1"
	/// 支援に使える塗りポイント
	case Challenge_CurrentPoint = "b8d017959b8ed73ea35066bd619efddfc0c220ba33daaa5e5590e963400b9f2a"
	/// ロブから支援者のみなさまへ
	case Challenge_DearAllOfYou = "142d44180b2cc93a87e25f9e33ec7b0672d1276e86c681e2e837fefd8f81bbaf"
	/// グラフィティのダウンロード
	case Challenge_DownloadGraffiti = "ff02adaf81bd6a3681ec63cedcd5d1bf749c1752edc183345a9704adefcd2be2"
	/// アイコンのダウンロード
	case Challenge_DownloadIcon = "ef189d46d17c843a99c63e019f463c405046fcda2ecea094f537aaa16e335766"
	/// 壁紙のダウンロード
	case Challenge_DownloadWallpaper = "6315b655fc4188cefffdead75b92282f26707ad635c982c061ee7c3171d45793"
	/// グリーン
	case Challenge_Green = "1046c2e5639d6f17f5e06fae067ac52fb56ae45e0ec1ba9891b952e8c5a884da"
	/// お礼のグラフィティをダウンロードできます
	case Challenge_GuideGraffiti = "8ff9c458ac001d9ec06cd038d067a86fa4ff2a21523141559376217eabcc8101"
	/// リワードの二つ名をロビー端末から受け取れます
	case Challenge_GuideRewardByName = "3febb62c16aa41d59f1a8f0a03395fd938b53a0906d92c600a9f8b2b6766f1dd"
	/// リワードのアイコンをダウンロードできます
	case Challenge_GuideRewardIcon = "c2f1ae7eefb685cb20824aa619a632af4d085ec8c1bcf0190b8238c4f57e1514"
	/// リワードの画像をダウンロードできます
	case Challenge_GuideRewardImage = "8c3543b858be2ce4c1744cf101bc32b046752dd4b6c690af38f0a192f3a24543"
	/// リワードのスリーブをロビー端末から受け取れます
	case Challenge_GuideRewardSleeve = "20dcb04d6af04ff47eb7d6fb8325292867262a78437ae52f082c417d52798d36"
	/// 塗りまくって貯めたポイントでロブの旅を応援しよう！<br />旅の思い出も手に入るかも？！
	case Challenge_HowToPlay = "8c7a86fda1d02ee05f57ee64ed1b31fed5e8535a193eb019566a6864af4c7c49"
	/// ジャーニー { 0 }
	case Challenge_Journey = "c90de202477e1a2f325779f2c462b27f657ae64e7ded41e7e9b897087a48b17d"
	/// 支援者求ム！
	case Challenge_LookingForSupporters = "9428acca90a2f268f1e95f96ed9ed474cca7ae3993a422b955e7d058dca86bbb"
	/// オレンジ
	case Challenge_Orange = "bf72df35847cf7bc5087e98599b86f1ec8d3d0d0e6771d366437b24be47ceb42"
	/// { 0 }p
	case Challenge_Point = "98f78c387ba44a0ba769f77679ea09c77f39ae62f7ba45d4769aad697c5f5650"
	/// 支援に必要な塗りポイント
	case Challenge_PointForSupport = "2222399a7679173c2979a6ab8745638454e0a230e92e3ada541c1fece93a46a0"
	/// （あと { 0 }p 不足しています）
	case Challenge_PointNotEnough = "5553ed0b255329115997b3683800f07d9ed6bb30071425da48b227c1aae99df3"
	/// パープル
	case Challenge_Purple = "69b4c868116ffbc1fb75389f5db9d9f789854e724314c2990bf2a93543184e34"
	/// レッド
	case Challenge_Red = "c6cfd5c36a5e7aa194cb75b4a27ea43d22c30966f64a6bf00913c1867aa24762"
	/// コンプリートまで あと <span>{ 0 }</span>
	case Challenge_RemainsOfChallenge = "c36cef9e9bfb7803b635518f05fc3d855ab1b0edff12720a93bceb3266b39f31"
	/// ロブ
	case Challenge_Rob = "db1ecf25ec0b9b58bd1303c8a053ec546ef94fdde49be50de35dfabebca399d1"
	/// ロブのアゲアゲ旅
	case Challenge_RobJourney = "bac34da412067907a5a38fd7b7a99e935a503b1a904dcd42a57eca01ca1dad65"
	/// 色を選んでダウンロードしてください
	case Challenge_SelectColor = "7c0f957addead2cac3251318109dc827a673c63cdfd68dd0b1bdd3dc3fb2a611"
	/// サイズを選んでダウンロードしてください
	case Challenge_SelectSize = "4ee07e54fe0a884610490dfbc34ac21d5a5766413da98dde7a4b67b91e3a4249"
	/// ポイント送信中...
	case Challenge_SendingPoint = "56b241984f699f1866672b1c7153e5dceb4725b0df3148a6064babfcd974fa9f"
	/// みんなアガッてる～？ 孤高のアゲアゲ旅人ロブだよ！<br />このプロジェクトは、僕のこれまでの歩みを振り返る旅、<br />その旅のクラウドファンディングなんだ～！
	case Challenge_Story1 = "53d09374c6d66dee651e42549425e3560b61eb6a1fdffd486460f3a5abc76bd1"
	/// 僕がこれまでに立ち寄ったアツアツでアゲアゲなアツアゲスポットを自転車で一周するよ！<br />そこで自分の「今」の立ち位置をジュワ～ッと見つめなおしてアゲなおそうと思うんだよね～。<br />そんな旅の中で得た「気づき」「発見」「Notice」を支援してくれるみんなにもシェアしたいと思ってるんだ～。<br />これってテンションフライハイっしょ？！
	case Challenge_Story2 = "fe31f471c9855772ed94710d39e1527b089b61b8d293378c378f3647a095a554"
	/// 旅するなかでバクアゲ～！と思った風景写真や思い出の品は支援してくれたみんなにも送るからね～。<br />『みんなも一緒に旅する仲間っしょ！』っていう、一体感とかグルーヴを生み出せたらもっとアガるよね～！<br />そんなこんなでこれからアゲアゲの旅をサクッと始めちゃうんでヨロシク～！
	case Challenge_Story3 = "a265c7989417090327880d8b72ba30a36c0185c26205e4a4647cb745a4b4c316"
	/// 支援する
	case Challenge_Support = "81c3b0bea62148e967b89613d094c3cb7ec4fdcad15997451866adeccaa6d5ec"
	/// 支援済み
	case Challenge_Supported = "8e9f4aec0d921d92aa71be05208718ef24f5df19411814f540096da08f4d31df"
	/// ※ 画像の加工や営利目的での利用、再配布はご遠慮ください。
	case Challenge_TermOfUse = "3ff4ce36d8de1f3d5dc520dbabcda08c0027c834b77a7cc4206c88f3e0c8c303"
	/// ロブイチ
	case Challenge_Title = "efe91032bedb7101ccc127e1ae98609a7ed2f15d076d217dcfb1875a0d6e9d8c"
	/// 無色
	case Challenge_Transparent = "c75316f1f5a737a20d613fa7a85fa2779c83ca586ee5ee12bc19486bd3f54356"
	/// ターコイズ
	case Challenge_Turquoise = "20f82d47a6487e1885114da19e1d91c4b4bc8ddbd416320e605b8752a06eee81"
	/// ホワイト
	case Challenge_White = "47a3a4557ebb6c8f5e9ad88e903f35fce291280624f383a4f32cbcfd7dab28f2"
	/// イエロー
	case Challenge_Yellow = "7950a6099409e87dacda30fa9c248ef55b154a0942054e1cf1e2e70b98c91ac5"
	/// { 0 }p 持っています
	case Challenge_YourPoint = "48775e627fe4cf3832e83faac7646929b111a6824de03b7817ab4b44acbd13f2"
	/// キャンセル
	case Common_Cancel = "dc982f1cb12e7f0a1cc73d9d414c3c62bf0d65e9003622e38e1788809762aa7d"
	/// ガチアサリ
	case Common_ClamBlitz = "ab3dd376051b175e0288535e904b147ee2a8fe4ff62ad02798d8c643b82b920a"
	/// 閉じる
	case Common_Close = "194798a449260d31cae468c90d48cefa382ec1bee6271b60bf572cc5bd367e6e"
	/// QRコードは、株式会社デンソーウェーブの登録商標です。
	case Common_CopyrightQrCode = "a0ceff43cc9aee0c64a16c9c470d273318a06fd6b7e6205485748418c43093c8"
	/// 決定
	case Common_Decide = "7e263e93f0321478306f3b519b9ce16cca4fd86e877ac0a15c30e0f763017099"
	/// ダウンロード
	case Common_Download = "127847834404b302831ba7f8278c97eeb42b3665b5b4d855de5ca8d0e9cd4728"
	/// おわる
	case Common_End = "38750d3ef7085198578e36a925171177755b87f833a7a4c2dc2c67145b2b1c5f"
	/// はてな
	case Common_GearPowerBlank = "8a6b447e57e33775b6a4c12a4497a0d696ba07eed3331ae48bae82277636428a"
	/// ホーム
	case Common_Home = "3198e1489371d2b95d7d2059435f7f5446a95e00ac1c75f9e9cb5a5588aa1103"
	/// イカリング３
	case Common_Ikaring3 = "3b7c494c08ea8feef184963c65dd285eecd4b670edb85e2b9850cab82e20ceaa"
	/// ロード中
	case Common_NowLoading = "7813afa15ec298e82a028fea83d53fba3d28f38a6412b38c75e7cdb29374e700"
	/// ひっぱって更新
	case Common_PullToRefresh = "a4b9b67859c83a05c1bb834259eb4da29c77f46a876b76b6cdda9cf1e2ade89e"
	/// ガチホコバトル
	case Common_Rainmaker = "394a16750e44db1e24d79b8efbe9d3c6bdf48637d2ecfc2e27bc3b036d357df9"
	/// シェア
	case Common_Share = "bef7f61a4846bc9556e1eb2d64cc8351b082b049040c6381287583a5c8586c08"
	/// ガチエリア
	case Common_SplatZones = "bd5bf8608e5a687c271df28b335b79ee05ded67e7bbe2686c9a4bca89949de17"
	/// ガチヤグラ
	case Common_TowerControl = "b7ce484e91b947be80eed3da423d9dc48d1a2461f6ca8a00b62d6f7dae95ea71"
	/// トリカラアタック
	case Common_Tricolor = "688936714bb17943ad1dea6152e8a70cb67867f1e4c878e0bf0ada66e7b73977"
	/// ナワバリバトル
	case Common_TurfWar = "d56bb2cec41f8e51fea6baf198a44fcd2c86a8aed103a77ec827bc13654b9c16"
	/// 出現数
	case CoopHistory_Available = "7e4a503564b4a9f23515a4cbd518a89da4ebb2647a45f8d4abaa03564453c2ac"
	/// 出現したオカシラシャケ
	case CoopHistory_AvailableBoss = "e4af6a135c415dbfcbf3a5c471f1db0665928ca0eb69750e0f1c3e69351d7ea2"
	/// 平均クリアWAVE数
	case CoopHistory_AverageClearWaves = "f26e723e3d12c84d1e76236dd5397f6aeee7f24fb9cb60b719d80289007f061e"
	/// クリアボーナス
	case CoopHistory_Bonus = "5d0366ef86558784abb26b56f07864bd88db105b9edb27052680ffe823aaea50"
	/// オカシラシャケ出現！
	case CoopHistory_BossAvailable = "4da85055fd2d8878723f8b55470611b3d557f06e69fc9faf6c479f8858873a16"
	/// Clear!!
	case CoopHistory_Clear = "ecb56f02ffe7782fa1c6926bdb46ce23ebac0d0ff5fbd7fa93a330223dd33f25"
	/// キケン度
	case CoopHistory_DangerRatio = "689d7bedb922522dde650e4005b9e8411c3de169ffd72dfa18cdf09b29f5d1ee"
	/// オカシラシャケ撃破！
	case CoopHistory_DefeatBoss = "7500b2b543964535e9f2f29299fac1b120e722354b2371ce8d1cc08fe9bf5e0b"
	/// 倒したオカシラシャケ
	case CoopHistory_DefeatBossCount = "38b73a20128255bbfa25f9aef2a27694d3dbe7948261ff59e0465ef2976e7dba"
	/// 倒した！
	case CoopHistory_Defeated = "021e4a7fe3239bcb30b798af35ddf73eb470c87ae0ef32a3455f24875141aa0c"
	/// 倒したオオモノシャケ
	case CoopHistory_DefeatedEnemies = "b3c7b8aac5e2c66a447f5c9e600711565293096fe33a822b8f0bfde9e81b9eee"
	/// ※カッコ内の数字は自分で倒した数です
	case CoopHistory_DefeatedEnemiesGuide = "ca2dcc092e87922f75d62418937c22c4da8799709f027f9450f6c7ce30795bba"
	/// 集めたイクラ
	case CoopHistory_DeliverCount = "ff2fcdd7d431bdf570c27387b3ad0be2a242c4bbf508b3e98c65323d3af4a964"
	/// オオモノシャケ
	case CoopHistory_Enemy = "09204c98cce24b556968c9599fc49b79cb12781193f27a98724a61d3a8c18ed8"
	/// EX-WAVE
	case CoopHistory_ExWave = "0224e1dce75ff608ecccbb91eba5fbb60d5529401df9e5bf028f3f44c33927f3"
	/// Failure
	case CoopHistory_Failure = "d922a709b63bb1f61f39ccb8362a4a8d274d0aa5eb4b19142aa08ae9cd9dc59d"
	/// GJ!
	case CoopHistory_Gj = "ced932db1385fc8665e7edbc0b523d88a94cef162c51b0cb4bda178d52fd0a4c"
	/// バイトヒストリー一覧に戻る
	case CoopHistory_GoToStats = "15eee8b21abbd205aaf45a11bd06f18e67d0400713ff3d0c2a6a8fe7d2503db8"
	/// 集めた金イクラ
	case CoopHistory_GoldenDeliverCount = "4fa84ccad3c92f49eb64bbb307dd4f078c7f9322504a2c141c1e453e38beb518"
	/// 最高きろく
	case CoopHistory_HighestScore = "f7ed5bab435462795c8962dbb9d24f00c2d35ce28654834aff813fa14054607b"
	/// バイトヒストリー
	case CoopHistory_History = "8746c22624c816c12b84fcb35b7d56d3d99dc606745dae487c5aa4bb72e2c21d"
	/// 獲得ポイント
	case CoopHistory_JobPoint = "caf0b2c820a6325c0dc60c84343482159cd86a2be67d346e49284220bf7efde5"
	/// 評価レート
	case CoopHistory_JobRatio = "c59d8b73b7d925eb2e634d6f5c24a7296d98ae6aab3e2933f8de8f12cb4d3f05"
	/// クマサンポイントカード
	case CoopHistory_KumaPointCard = "accd2ee923711fe8e56c5385c2d7597805e7c2f46bfdcc4594fa6ceec4ea8dd2"
	/// 最新のバイトへ
	case CoopHistory_Latest = "e747cf93bccda792b8af592e41180e549b783d5c15c3c784a0d0cc23c274792b"
	/// 期間限定
	case CoopHistory_Limited = "41e7ebd5bdf3f53d546aa522e27c984c13d82061220959daced0dfc2a6dc561d"
	/// 今月のギア
	case CoopHistory_MonthlyReward = "64ea6ec2e7b87386d5233b15457ca42bf797b5838960746617efd11f0b35cc15"
	/// 次のバイト
	case CoopHistory_Next = "1fff2a1d2a54152e47e8dd6b33b25a75ccd5257b76e4a1c46ebeab9adc45b528"
	/// NG
	case CoopHistory_Ng = "62fb5468d494570317b66c52262bafabbc5beab85e158f4924632eff3319b653"
	/// バイトヒストリーがありません
	case CoopHistory_NoData = "fcd6d8b46ad72c4b578d176172bd0c4b0a5fb8a5cd78f601768aa07338bba867"
	/// バイトヒストリーを表示できません
	case CoopHistory_NotAvailable = "f010b9dbc508c750c4bdf8f12f61001571da2eb46fb5fcae2b52018f96e7751a"
	/// 閲覧できるバイトヒストリーは、最新の50戦までです。
	case CoopHistory_NotAvailableDescription = "4c054e1a7c398cefa72e192ea509c736d0c820450ff8eb899b773093b0d93cf0"
	/// 倒せなかった...
	case CoopHistory_NotDefeated = "0566c59dbee0ec1d03b8283effea8fa79369ba4b10ef93d0289c13414200289f"
	/// { 0 }p
	case CoopHistory_P = "02c6d4c0e3db406037626397d08bbd84a319e1ca2befbb47e935ec78cd00b3ee"
	/// バイト回数
	case CoopHistory_PlayCount = "b93cf8fed84bf4bf053caefc91226983775297eadc3ef10312d6be95e8fdcaee"
	/// 前のバイト
	case CoopHistory_Previous = "5bcc4f15f9d121bed0b6b450bffd3f08f07c6e4efe3915f6a66574b2810384df"
	/// プライベート
	case CoopHistory_Private = "bbf41509ad5857831616665e2937e91faacbac046a0a138e8faaed36525a62a5"
	/// スタッフ募集！
	case CoopHistory_Recruit = "51d769d7201e53ba0281690addfc130f4bb37361f8acfba1a54c0e8d4c533e8b"
	/// 初心者でも安心！元気で明るい方大歓迎！<br />アットホームな職場でアルバイトをしてみませんか？
	case CoopHistory_RecruitDescription = "4481226546753d464a7444696ed023b9622585660cf12836db4dc0731ec7bb61"
	/// 簡単
	case CoopHistory_RecruitTag1 = "2c45f8ee9dd4ce7c160eeff8bfc846813410297ace2078d5c6a7eb4be7def0c0"
	/// イクラ集め
	case CoopHistory_RecruitTag2 = "e1f0e34275d107a53ff9c5fffef4809632dcb3d232d9b0e3966457064d3f8ee7"
	/// ～イカした制服でイクラ集め～
	case CoopHistory_RecruitTitle = "252ce5c46b194e1f162b9975e59154ee25f9360e2c1baadfc08a76f378e271ab"
	/// いつものバイト
	case CoopHistory_Regular = "b17ef6b50176fc4b8cb03fd628fa2f60800890f7d1bf7ba2dafa1b3f874ce60b"
	/// 現在のポイント
	case CoopHistory_RegularPoint = "7f69e7bd10f36ab2d86032dd0f81fd3b431803ebf28bb14d9850f5d6fded64d4"
	/// 助けた回数
	case CoopHistory_RescueCount = "c4aa1fcd5b60a86d08536a68a366908fc56112c66a5123d7692c91e1a20da74d"
	/// たすけてもらったかいすう
	case CoopHistory_RescuedCount = "719c9e35ca776846c5288261d20090262eaa4a566f219e8700c9ff5123aaea8b"
	/// ウロコ
	case CoopHistory_Scale = "c74f2ce2c71bd6c44da901113f8c240f4843d7dc0956cb5003b340ace3c69e21"
	/// ドウウロコ
	case CoopHistory_ScaleBronze = "d99b81c78602e0f11bfada576d196508eeb298eb034611cdc1e73dbd8f64de23"
	/// キンウロコ
	case CoopHistory_ScaleGold = "7e0da66b4b80472a1fd625a05f9da7ad320a85ef646466b5a97e497cde662eaa"
	/// ギンウロコ
	case CoopHistory_ScaleSilver = "3cc2ed3b91fa238072f718fcb01002c9aeb7809dbb5d23afe6b33760d8d18f30"
	/// バイトスコア
	case CoopHistory_Score = "80dd43f37587f08999d4a312badc5a018a298498c683e9c8e53c55d44f22911a"
	/// スケジュールを見る
	case CoopHistory_SeeSchedule = "9d9905c84b7da6e850e010021e744b1cd7731c95c2c287d8fb8fb56a6a1c8f35"
	/// オカシラゲージ
	case CoopHistory_SmellMeter = "b4e16e0530096fc3a60ddd5d98c7aa64220502933900560684bdf8f0a339124e"
	/// 支給ブキ
	case CoopHistory_SupplyWeapon = "a00da0ae6559ed41dde2d9cd5134c8e1f81e5a13cce8dbd84bae70f9e23ef022"
	/// サーモンラン
	case CoopHistory_Title = "060f2108d8bcbe4f87ae20d6dd355923dd50d07055cbce3233569690cf016527"
	/// るいけいポイント
	case CoopHistory_TotalPoint = "b2373d7c0e6f7e0aafda962c366adefa978e8f454f51de4784344aa8ca4ee4d6"
	/// WAVE { 0 }
	case CoopHistory_Wave = "39ab68c2639757df99e7a0032a115a01c136beaa88dfc937599dc4828c4ec4b3"
	/// 干潮
	case CoopHistory_WaveLevel0 = "0a2a1ec6c93ff93a003bacf3082c6e79d7be7ce75aa68ae885c8ec14d658e9c6"
	/// 普通
	case CoopHistory_WaveLevel1 = "b38e6eae48f980d5fedf4d4b32c511f8f2f246ee7c3062c9386455e90b5f7c41"
	/// 満潮
	case CoopHistory_WaveLevel2 = "526e505f8816a1ef36d3b648adc3a31bcc69c4da79ab8d779c8074547b902657"
	/// ホームに戻る
	case Error_BackToHome = "0bce96d0cedd38c8e753ad447caac101193e478e4334b785c0f9e2db08d0c0f0"
	/// 現在利用できません。しばらくお待ちください
	case Error_CurrentlyNotAvailable = "34b89df6875cbe1ec65e9b19a3744f68947d2d3416a85fd0fd5b95c208d74072"
	/// エラー
	case Error_Error = "d6575457e33f5bd80f6de41a146493d6683b70499bb30aed977c9cacac63d9d0"
	/// エラーが発生しました
	case Error_ErrorOccurred = "a27ab853a910159dce2145925fd76fd1b3746cb06872243b5900a967a695afdf"
	/// 読みこみに失敗しました
	case Error_ErrorReopen = "cc900042cc144f501f15092ca5a9b8edca3e3844d6ec4cda2af0661a5b6d828b"
	/// ただいまサーバーのメンテナンス中です。時間をおいて再度アクセスしてください。
	case Error_MaintenanceDescription = "a45102f1353103fdd45e40e9cf995b586e2c91d952a898fb17b8b4b7d4931421"
	/// しばらくお待ちください
	case Error_MaintenanceTitle = "7311da9a494732f8ea51a008de12c0663ff473738caf79166a4e7a4c81f006a3"
	/// 読みこみに失敗しました。<br />通信環境のよいところで再度お試しください。
	case Error_NetworkNotAvailable = "dccb4751830e1e3506758f2233709d145ac0d62298700bbf44818fb9a2e0059d"
	/// イカリング３を表示できません。しばらく時間をおいてから通信環境の良い場所で再度お試しください。<br />問題が解決しない場合は、ブラウザが最新版に更新されているか確認してください。<br />それでもこの画面が表示される場合は、ご利用の環境でイカリング３を利用できない可能性があります。
	case Error_NotSupported = "7d42616ad52dc0761717f3dd32f80210f4875ad00f00b23cfdcf7922d8fff8b4"
	/// 再読みこみ
	case Error_Reload = "d593a2e951da1dff7d3dded0b7c3e247fedae7db75603bc3c76afa6ef8c37aa8"
	/// フェス
	case FesRecord_AppName = "3de51eb87f23274b60ad95573c477fdb3b1c3ea46f488ed28094596f784cb5be"
	/// 攻撃
	case FesRecord_Attack = "c45e187cafdb99139bda532e6964b3c29026732a10b419b835d39e5e50e85675"
	/// へいきん
	case FesRecord_Average = "3e49cf94efc1a495c82b6155756aa9f0d63a573f9a306e82f098c98ba4715d26"
	/// チャレンジ
	case FesRecord_Challenge = "bbc65665a3d4f432cd9e706b9baae251a94c0819b8d09d268c4ac6249aa2d253"
	/// もうすぐ開催
	case FesRecord_ComingSoon = "f5e2dbdcfe9a579b2f2de3264573ee2269571a4ac40d4ccb00132fa6003eb164"
	/// こうけん度 チャレンジ
	case FesRecord_ContributionChallenge = "4b894931324f4576a30e064259312a1cbe417d5626a1b03f3a3fe278e1abd814"
	/// こうけん度 オープン
	case FesRecord_ContributionRegular = "5719f56b34ca699e7d5c79193ab959535346389d66f4bb3de40c8f1354fc7003"
	/// 守備
	case FesRecord_Defense = "6fc56979e505bc6dfa726794de758e57a94177480beff760e0f8a439720a85dd"
	/// { 0 }{ 1 }パワー
	case FesRecord_FestPower = "1b077dbbfc12851d01bce7230d02e894413d05838e807af21acbaef74e5ba164"
	/// フェス100ケツ
	case FesRecord_FestRanking = "0beba48e2d9b895ea6a7b8ef0e9ff3d580bf27330283a2bbbafc66eb31734ab6"
	/// ホラガイ獲得個数
	case FesRecord_GotHoragai = "6b02bd7445704d7346383538817f08ea1fece4dbc31d62a7bb9f4e34912e9582"
	/// このアンケートはゲーム内で投票するまで何度でも変更できます。<br />みんなの予定を見て、バンカラ街の広場にある投票所から投票しましょう。
	case FesRecord_GuideVote = "24692254b5b30b12a7774d10e17ec414757ce2eeabd8eb0ccc3a80df32535c75"
	/// 参加予定のフレンドはチームが変わることがあります
	case FesRecord_GuideWillParticipates = "eeefabb7ee2eb4be8c68f32991c554e060578662483f71d3a25f9d7614a98e06"
	/// 最高フェスパワー
	case FesRecord_HighestFestPower = "8d459567e9bb9fb10e244ec1b9678aeb1937180a9deffd3f9df331dd7814b860"
	/// ホラガイ獲得率
	case FesRecord_Horagai = "7e5e9e37a1a7816fa01d8a2c7b631f1e0332c22d2abf51cbb22e9cf3884182ad"
	/// 未定のフレンド
	case FesRecord_NotVoted = "da564254bc58c0749c0814ea4a94fb2e6c828d5b389335be732ba0e14a3eb5ca"
	/// 開催中！！
	case FesRecord_OnGoing = "aaba6829e45d5eacec783907623e2eecf88b4fd0e4a379b1854b8680f9bdbf66"
	/// これまでのフェス
	case FesRecord_PastFestivals = "fb9540d95bf4385a6ebb0619d5a4435f8ef27d69b291eb8c59ec4184c487ee83"
	/// アンケート実施中
	case FesRecord_PreVoteButton = "e29dc46776ba750c0922e8958b59bdab9630d642d1fa9154108be10b8248b71b"
	/// フレンドの参加予定を見ることができます。<br />みんなでチームを組んで参加しよう！
	case FesRecord_PreVoteGuide = "18d2b2f9e564fa6bc21b5053d191f7619878a8b60870aa1c84bcd5d9c4ea8274"
	/// みんなどこにする？<br />アンケート実施中
	case FesRecord_PreVoteTitle = "ec8f1360e70c752046316f42bc1dbba7f2b5de67757cb6055a5ba3491b545774"
	/// { 0 }<small>位</small>
	case FesRecord_Rank = "601be31ef0eba2b2dcaef8603892987626dcd369b36b10ba7e535f52e3040f9c"
	/// オープン
	case FesRecord_Regular = "b95227fed875045ad289cf5b155db852a3ab99bfcf959d9bde68998926d5c579"
	/// フレンドの参加チームを見る
	case FesRecord_SeeAllVotes = "cb44089b80b02279223c233768c074f62c418d8a59083cfd26ce2758cd1ebbe1"
	/// フェス100ケツを見る
	case FesRecord_SeeFestRanking = "5090ebea5487f7cc01de43d87383159cfa1d6a4b09dbef124859a99706d2b76b"
	/// フェスのきろく
	case FesRecord_Title = "43ed2ec4a933533fc7ba48baf3f969b14b6bc319ea6024754e155e0b8cd40270"
	/// るいけい
	case FesRecord_Total = "c8329dfed0949c4c90f8598fbcd8e5ebf0a33ccd933cbd7aef9c68552ef65731"
	/// 未定
	case FesRecord_Undecided = "66490122706247ca72b7871014114d09e26ed2ebc601e84c9153075f92f0f526"
	/// 参加予定
	case FesRecord_Vote = "e59aa958eb9c7c7a41151afc4566695a81b84f611b438e0706927788f47f4041"
	/// 得票率
	case FesRecord_VoteRatio = "d26dc0778f6ea6e329b92acc02d15e28cc29be6a67360bf42abe24a78646e7d1"
	/// 回答済み
	case FesRecord_Voted = "c3abe83d5ecdab4459d6630881f798cbbd36e10f0ec3f6c108e35dae2c70a701"
	/// 投票済み
	case FesRecord_VotedInGame = "7ad2f7fa5a84c0e0da89f37241a5fa295376fcbe6cc0b4ff90bc466a7796f904"
	/// フレンドの投票状況
	case FesRecord_VotingStatus = "6fe078f5b84ed09a427ae68c38b581b9d1b2bf84f6df67829fd8846f0e03482b"
	/// 結果を集計中です
	case FesRecord_WaitingForResult = "0a90a44748a0e9a49f3e3a69881ff984a78b8a2c2f056b253803ec09ff3ebe06"
	/// WIN!
	case FesRecord_Win = "5153e5251ba08aff01dde5603c720e499db5f4b7484e8e6715cf9c3e9ad2b5d9"
	/// <span>{ 0 }</span>の勝利！
	case FesRecord_WinTeam = "9176a119abf1fe90c0f7df04bf22dbda9524f6f7e4bc79d650018b906caad62f"
	/// あなたのきろく
	case FesRecord_YourRecord = "bad6cc13f2c9e3e71b9b9582b47a26a973d7a00f1495242255aad392bbea4fd7"
	/// もうすぐ <em>{ 0 }</em> が終了します。
	case Footer_EndOfSeason = "3ae0d4bad7b067c820a6c761e4d250af9034f9d427ae552413097f02a714974c"
	/// <em>{ 0 }</em> フェス開催！アンケートに回答してフレンドと一緒に参加しよう！
	case Footer_FestAnnouncement = "cbe3580fbc474bb13b71545a3f8557babdb6adcd60de0bc98ff7a13511bc17dc"
	/// <em>{ 0 }</em> フェス開催中！広場で投票してフェスTをゲットしよう！
	case Footer_FestNowOpening = "0801afb9a3b47df1eda938499287a7e33378dafa376bafe2de25016fa640e38f"
	/// フレンドリスト
	case FriendList_AppName = "2af1b5120cf072821566e6ed566b861cba64c2c5eeab2884cb0b23b0a42b5777"
	/// バイト中
	case FriendList_InCoopGame = "4feb516ff412cc9aed0180c0c72d287980234660c14d685de5371d322a402cd4"
	/// 試合中
	case FriendList_InVsGame = "4b7193190e4857b0fa985df52b998f76a7ffa6865b936a5051758e05ce82042a"
	/// パスワードつき
	case FriendList_IsLocked = "655db994ae710df80352a66318f826b98b6088742660fbcf86bb8a8fc60b3c2e"
	/// フレンドのプレイ状況がここに表示されます
	case FriendList_NoFriends = "194677bb0f36b580e4e3e61453d9ca87c6934d5f954946b585ca8679f1e50d48"
	/// オフライン
	case FriendList_Offline = "f1e2f1ebce51fc39de9a3556b341eed19e7182b120d49fe21c5500b2d39cd454"
	/// オンライン
	case FriendList_Online = "dffa4528149af1575e347241d5bff23e6d872981633c80cdca1154d4e14f18d3"
	/// 募集中
	case FriendList_Recruiting = "141c6a61890580f427e64daf36974fef17aadf098f866329d662cf94e1671eb6"
	/// 再読みこみ
	case FriendList_Reload = "00730f19491209e2ed1d15b2d6ceb2d910349392588650d0d9d34c290efad810"
	/// フレンドリスト
	case FriendList_Title = "ac4785296ff061fa24ed4378b581250568b6044ac2c756d451b60d8c02216630"
	/// ボイスチャットかのう
	case FriendList_VoiceChatEnabled = "373af7bef8627718c3f4233653c45a22dd5e2f4af767c12df9063371e96edc83"
	/// ゲソタウン
	case GesoTown_AppName = "e32b3714a5827057ef6e81039decb296d18eb899a539b20fe077c9c4bed15382"
	/// ゲソタウンに戻る
	case GesoTown_BackToGesotown = "052e0075cf288d4825a6981eb3b6783524d8900458d18cb1a80eca99b71e1404"
	/// ふだんとは違う<em>ギアパワー</em>がついた<br /><em>トクベツなギア</em>が手に入るショップ
	case GesoTown_Description = "7d8f64a463959bf0d7d49ade54e97bd0288d4009824017a813c1dad28b64b144"
	/// 本日のピックアップ
	case GesoTown_Feature = "4401cbe349b4294bfaaea0aaa5b2b0c19c7b399241a34f397a80d0c0e1e35401"
	/// ピックアップ
	case GesoTown_Featured = "fa42957edaa6b25c4626091e314680df090eafd8fe5c719f17d86c4e5fb919a1"
	/// <strong>{ 0 }</strong> につきやすいギアパワー
	case GesoTown_FrequentGearPower = "1c2e7d11e43cd83d8d1680544a1cca920b94d37e78498231fd5e76a53b63072b"
	/// <em>{ 0 }</em> まで
	case GesoTown_Limit = "36440e1b6bba2c125dced4e3b90d7257d2d7a29f8b6acf536ea7dded04493871"
	/// おカネ
	case GesoTown_Money = "15d0a22660996ceb96da913d4d320a052c2a8efeaf8f02b0e736919ce8f0c9b9"
	/// 次のギア
	case GesoTown_Next = "2c86a7316c893646c8b5c12fca857e8fe5bf88bc2b7912db1bd1983540cca244"
	/// 次のピックアップ
	case GesoTown_NextFeature = "7f923df999d19bf8b587232ec99e1544bd78fce572f272633c6a8bcf529afb98"
	/// 期限切れ
	case GesoTown_NotAvailable = "8269ab6cc8a68abe5d5f32439cd189730a9ea0f2cbc0298689e781db089ed79c"
	/// 注文する
	case GesoTown_Order = "6134c542dc1cac7ebd33918267c09ebd8d1ce2f0fc425149e0a3b69b74849d83"
	/// ご注文はいますぐ！
	case GesoTown_OrderNow = "a830fa9da394ecba63afb28f4e14110e19620df299466ee705ba61a455cad5db"
	/// 注文済み
	case GesoTown_Ordered = "8706baba51fe2bc230ea7d2bca33192c702f6a13a285faff1eb2430e5564c816"
	/// 在庫確認中...
	case GesoTown_Pending = "187171491598d6d9806d56d31b1872156c6800e76d7240de2cc40acd0fc0a1ca"
	/// 前のギア
	case GesoTown_Previous = "4158d1cf2878b12728d7e42c8ff384bd5a46893df4f4fa9f5615b395537fa6b7"
	/// まもなく終了
	case GesoTown_RemainAlmostFinished = "dbd4a3d87a631e2f562a111c8f7c8c833f1c68ce4e86add41d1847785bc10a8d"
	/// あと{ 0 }時間
	case GesoTown_RemainHour = "e206a348d8d9118a31d43cae201229b98e0e6a5d8df77b2ca3585df28c3c0178"
	/// あと{ 0 }分
	case GesoTown_RemainMinute = "328c3d2e7701a4cbffa08c1aeeb88b9f92d65e1f82f8fa1240f6ecc64f38a139"
	/// すでに注文済みのギアがあります
	case GesoTown_Remind = "3d385c8ff93cf0c34cde6c5021616e08768c221ac6fd82d9e674b0523ae1573b"
	/// 注文済みのギアはキャンセルされます
	case GesoTown_RemindCaution = "b7c9e1861fcd3ae01a00f94d15d37f689038082f283eac601013c34b002c304b"
	/// ご注文は、1回につき1コとなります
	case GesoTown_Rule1 = "b588deedeeb2743f57e0c0e0b1d45894b865c900710bd07b49f1c8eef36f7fcb"
	/// 注文済みのギアは、広場のスパイキーから購入できます
	case GesoTown_Rule2 = "1ef4f506f17727c0c849dcd003b2134e4f3deea5de2be1dd6a149be67aacab17"
	/// 購入前に新しく注文すると、注文済みのギアはキャンセルされます
	case GesoTown_Rule3 = "0d0477f89cbd36a308c4ad36d253f090d9996b1c83a5dcaec8ccd2d26c68db80"
	/// 購入後、新しい注文が可能になります
	case GesoTown_Rule4 = "67e6fdf0545c5466516cc47c99f27f261c7fb0773d567b0ea64cfb38d8399ea9"
	/// ただいま販売中のギア
	case GesoTown_Stock = "11c19fd238d37f7c625208ff3e74164ed6917b97891dfc6fce205f353cac523f"
	/// 商品は4時間ごとに入れ替わります
	case GesoTown_StockGuide = "a9efada67d18c74b0fe4f256c55246092372c0e9241797815799a2d3bafe34c0"
	/// ゲソタウン
	case GesoTown_Title = "c4f8c7c190376f1d312309458c18303f14ca461bfabf3dd62a4ff3f9c3c8564b"
	/// 受付できません
	case GesoTown_UnableToOrder = "e653b05c33565580668944813d64519e070c142c758f6316a3bfdd1d2af60a76"
	/// この商品は現在取り扱っておりません
	case GesoTown_UnableToOrderMessage = "6e39f252e7d33edec2f0972b959e80d43129f4ad46af42bd0ae307b7e9ee5494"
	/// １号
	case HeroRecord_Agent1 = "78db36e2aeb7099150e0022f87d12bfcfb07274a56273e1d3444438c94932b02"
	/// ２号
	case HeroRecord_Agent2 = "be0eea4cfad56105297997ff2eb1cea8d5d58e4c377e3b972e42b533fc427227"
	/// サイズを選んでダウンロードしてください
	case HeroRecord_Annotation = "bc37f2b2ff5a5a9cf23a520947b3ed6fb1110b23985295e7b313fb8c94b57aca"
	/// ヒーローモード
	case HeroRecord_AppName = "c20df25ded8d8198ac006f436dabd4e04020e292e61b2ced9c2ee52ac67cd849"
	/// スナップ写真
	case HeroRecord_AreaMemorialPhoto = "664c6ee2ed75456e647402c917bb656012dcbbf4ef667535ae15c4874282ea81"
	/// ボス
	case HeroRecord_BossStage = "52a92f6afc3e36604aefcde6c9bf21330eb060c9fc9c9eeae3b04e80a81cca83"
	/// ヒーローモード クリア特典
	case HeroRecord_ClearReward = "9ea45be2a8f89b1bec46c5969a8eaa72a6d8b6d71610af8b35221137f429033c"
	/// 特典をゲット
	case HeroRecord_GetReward = "49aef0efe6fbf5370b4e31d4d75a283d182956f76d94182ec0deb84f69fa0e36"
	/// オルタナ探索率100% 達成特典
	case HeroRecord_NawabariMapCompleteReward = "d474f82001bc820ddcb699cfb23daf977e0fb8b8352a9e6ca17c97be8ac37b7d"
	/// オルタナ探索率
	case HeroRecord_NawabariMapProgress = "8b09be741be25409f5c5ca1e0daa0e5d7fad578891e442c60afba8241c1bfd06"
	/// クリアおめでとう！
	case HeroRecord_NawabariMapSubCleared = "99ceaa626850f9377bceee940d39b2df64882e4c0610056962a6fc47ee6d3347"
	/// 100%踏破おめでとう！
	case HeroRecord_NawabariMapSubComplete = "60680caf93a7af48e7c2d73bf89a1277b3218dde3636f568c3bd309c79513fc7"
	/// オルタナを100%踏破すると…？
	case HeroRecord_NawabariMapSubInProgress = "5256887656bda83e041030556700786b47717d998f08890fb658af00b9906dca"
	/// 次へ
	case HeroRecord_Next = "f1a7a1f5d520ecca8f04c6f8abdb8079332944727799ec918d7e7976e8c60c76"
	/// そうびなし
	case HeroRecord_NoEquipments = "6924298f0b9e338b1d75db099c8d0a9bece27637e1f0d1658fbe5709a2949bef"
	/// 前へ
	case HeroRecord_Prev = "00d89356f740988123dba199cafb04c82a612694753bcf9194dae7d743d313be"
	/// イイ目をしたワカモノ求む！！
	case HeroRecord_Recruitment = "b88e9beadee5aef860cec929e52b4c6dcff8ed4f53076d59cecb0caec02a1fd8"
	/// ヒーローモード をはじめて冒険をすすめよう
	case HeroRecord_RecruitmentSub = "e3a2e3b7915067f161dec8967f78f0a13d8a17eda9fad572acd972f5d46daee9"
	/// 探索率
	case HeroRecord_SearchRatio = "c4a2648cf8289e40013d0aad64b1cc37845289e958b300ecdd295d0ec7de3319"
	/// スナップ写真を見る
	case HeroRecord_SeePhotograph = "25034f3701092e90469cedc4b7d902e9b462895aa02a19a12f0512fb76ea01d5"
	/// サイト { 0 }
	case HeroRecord_Site = "c71d67596a47c5d7cbf41bfa8444dba3907baa08d3da0216ab33d87fe6e94be0"
	/// みらいユートピアランド
	case HeroRecord_Site1 = "951e97bda3436738b4067b5feb135231fc5357f8bfe9b134db44dda708c4f5cd"
	/// あんしんライフファクトリー
	case HeroRecord_Site2 = "25c00889725409edcae151323815056b420dca3a42d537a5011b12da434e08bf"
	/// ながいきヤングニュータウン
	case HeroRecord_Site3 = "4befc92b2098f8742f99d2192cd03f4a6766d6224cf4166ab9b4ecf5e4254e68"
	/// うめたてドリームランド
	case HeroRecord_Site4 = "e9a3e40e3c780ed16aa66d874682dcc4f63d462d92b0f5485b4608b9bd103ce2"
	/// あすなろグリーンヒルズ
	case HeroRecord_Site5 = "d2973f92f424439cb592a5197d87e12686170d5ad3e473cbe4609360f2eadd58"
	/// しあわせリサーチラボ
	case HeroRecord_Site6 = "6be5c8f11a3c22d07ed862483d0aa40b6fd5fcdb6b8151284e9254b4ae9b483e"
	/// ヒーローモードのきろく
	case HeroRecord_Title = "1d3ff64ec1c57fa4236cebb2aa623baf18fb8503cc71cdcef8a7d0b080676965"
	/// 特製壁紙
	case HeroRecord_Wallpaper = "a2870e264647c5fd5251d38466cc6bb6e862aa44aa69fc50bd310f463152e2e8"
	/// すべてのバッジ（{ 0 }）
	case History_AllBadges = "97612ce9a079dd2f161bff8d4fe0acfb3a46408a77333300c04cb62ea5bc4717"
	/// ヒストリー
	case History_AppName = "2cb09fa6aeb61c2018763b135ecb4baf47beae2b96ef01e35215b9e51505aeb0"
	/// バッジ
	case History_Badge = "bc888c57524445881e954afd493364718923c4ec4a7b21603ce8fa81ea07bb84"
	/// { 0 }<small>回</small>
	case History_Count = "d8151df786a02c632586e7c26e4d3c8fd0df8f8adb19b98f380a1862ba318db9"
	/// もっともよく使ったブキ
	case History_FrequentlyUsedWeapon = "33be67a6de9fcb6dfb7ceef6ec422d88f406305e72fa3dcb013bca8deac440e3"
	/// 最高ウデマエ
	case History_HighestUdemae = "8ae83a282c86ef1bf846d2e3009ada60853fea49efd29f98b2343d9fa079b2d3"
	/// 最近 3ヶ月
	case History_Latest = "fd43994417f5d8896e09959c16d30939030ccd993f5f1e781619ea54a4b38e1b"
	/// 最近ゲットしたバッジ
	case History_LatestBadge = "9b4e1ae165f52d6a98771b54490e8b2d6b97ba58548cc73e2445b1c818bdd3eb"
	/// 月間
	case History_Monthly = "1541397c68241ca3c6d7bbf54c4f2e24c5fe3dfc7f244bf6c17a3147167a951e"
	/// その他
	case History_Others = "49603ebeff7e758481937bcd1d5a0a8cfc2d310d7cf8fdf95405447083e0d059"
	/// ランク
	case History_Rank = "ec879a2538a732b65313092a3b84f78328e7ce79a3bc820e8245b4a17ebaf445"
	/// シーズン
	case History_Season = "88478c17f8793593edbaf37885e298a7f2705b71d1387ab85a37e642e15e4bca"
	/// すべてのバッジを見る
	case History_ShowAllBadges = "c6a7c130a2d27e3773d9e2cfe6149b0ecc77a5d36ba5180d3d39022554b1d382"
	/// 表示を減らす
	case History_ShowLess = "2b761bd2b058055e2fd44ffdd382795033e24c2d6eb22554b95b92c6703e541c"
	/// もっと見る
	case History_ShowMore = "496ee6a57c9e57bc0acea170f6e9eeb2a7789ff9a069b2ca146d79b274059ba2"
	/// { 0 } からプレイ（{ 1 } 更新）
	case History_Since = "598884ef7c80fd7be04ef1f286bb2599278787803bce3652aa96a8258b85dc51"
	/// サマリー
	case History_Summary = "a945ee45c291a4bed58b9d0d2c3fa137aac69dce26f1089e16889aef84d6db9b"
	/// ヒストリー
	case History_Title = "263b826525893ac51523976d8f553a8cc64e04e887e9c873e09ae5a4519d324e"
	/// 今まで塗った面積
	case History_TotalTurfPoint = "2b7d466d087e60265fc3f84145b2ba9276a5d73434b3385d897e8d706e7580ee"
	/// 総勝利数
	case History_TotalWin = "80b465f770274c90e9bc3ef50180c5bf180cc69571d062cdd94a3b72b4444a69"
	/// { 0 }p
	case History_TurfPoint = "07ce1796dc5d13831abc2c97942b52a9c4d860141d55311f0453525cf0b75a5f"
	/// ウデマエ
	case History_Udemae = "21a6021a4d7cf29c8a5906231761dea45f276f2c7a0f4517d6ddbc528d9a1058"
	/// ブキヒストリー
	case History_Weapon = "b4a52d1c7299854e81fd80530dd03f7d6c6d723ad0eb7158ba81ad10eb17e8db"
	/// ブキ使用率
	case History_WeaponUsage = "cf96c683fe80dc3b943a30df6019235f9d37d8a3cb79dcab5bab7079b988b62f"
	/// ※アプリをインストールしていない方は、このボタンを押しても開きません
	case Landing_Caution = "7d24b25eabb992ea79b17d066a4bd56c367c3c1e42c575e4d681d7db3892b547"
	/// Apple、Appleロゴ、App Storeは、Apple Inc.の商標です。Google Play および Google Play ロゴは Google LLC の商標です。
	case Landing_Copyright = "cda4759681fa7af3734e9842fe04e54f4ec0780859226c64b89b8a04691dc18c"
	/// App Storeからダウンロード
	case Landing_DlAppStore = "6885379b6a57d0d3cce99958850f996f5f1420534f31c1298956d925479b7dc1"
	/// Google Playで手に入れよう
	case Landing_DlGooglePlay = "d327f31aac100705f14a6f4c8acf7436d50fdd4d87a4b09cc09f85c2c9d731f1"
	/// アプリのダウンロードはこちら
	case Landing_Download = "7330ab457867be5eef5cbcf31500edb520bcc7e79486d5ab152ed7f8f77a7058"
	/// Nintendo Switch Online
	case Landing_Nso = "b56f6177e5db6252e3edb7ca196c98b6510619b37015668af0ea1e8786c9c079"
	/// アプリを開く
	case Landing_OpenApp = "6fc0201b615e99c3b2e527abab3339011dd99df83d42bb481c697f4b14d326b6"
	/// スプラトゥーン3
	case Landing_Splatoon3 = "23fc992e6f42b80ee747362ddb3f26fdb1cd46e02d82218bc67092489442bc5c"
	/// スマートフォンアプリ『Nintendo Switch Online』を開きます
	case Landing_Title = "069e1037c239070d1dfb80e52e615ff0f326383a7c9dc64f0d405be8756e2128"
	/// メモリープレーヤー
	case MemoryPlayer_AppName = "cd66b0a7e75b3017e948d95f45a0aa2a871767006c36defa9dbc1a1b8e8d6d9d"
	/// コピーしました
	case MemoryPlayer_Copied = "76b3edc6aa29d5696b1e8781479bcb259078b539f22affa45fc837bfc0e58412"
	/// バトルメモリーのダウンロード
	case MemoryPlayer_Download = "01c38f9ca13bd4b93dbd2bf8d0d85a1a0b7cb478fa2a0397fd0f4a81193888df"
	/// ダウンロード予約に失敗しました
	case MemoryPlayer_FailedDownload = "108c61d8056eb44865c78c759fb7097cac62981c1095e627c46c181d8cb75491"
	/// ダウンロードしたバトルメモリーは<br />スプラトゥーン3のロビー端末のメモリープレーヤーで再生することができます
	case MemoryPlayer_Guide = "a042798d8982de32f374a6afd3afc81ea8d561eb45a1876b7319b39990fee3fa"
	/// Loading...
	case MemoryPlayer_Loading = "6607eb3280b8c0dda062d0b9ac6ef371098dd222c0e869d9e72fca65cac3e3b4"
	/// 最新の50件を表示しています<br />保存期間は30日です
	case MemoryPlayer_Notice = "7cf66eb2395dba0dd508661bdf0e7b3f93eac7077da0e6ba3c309ac08061d948"
	/// コードを入力
	case MemoryPlayer_Placeholder = "18cbd021bb57a11c449165c5aca0a9fee5d53aaa288ebfcbf79920e1627ea6ee"
	/// ダウンロードコード
	case MemoryPlayer_ReplayCode = "e6af33d99bb204f49ee969e26a652f937dd9dda9958befbb21fe59ddf8e5a458"
	/// データが見つかりません
	case MemoryPlayer_ReplayNotAvailable = "b985a0b65a836480ad6724824213db5d9e69e1efcd005d03c10f73bd0a398a34"
	/// ダウンロード予約しました
	case MemoryPlayer_ReservedDownload = "0a95e7769e60870f58a3343cafd4420b7052a35d91388145a37bb21d6c111092"
	/// 送信
	case MemoryPlayer_Send = "a85118d14599527d5084c6b9608f9dcb2b0e7df43fe60358e65826e7d7884a76"
	/// メモリープレーヤー
	case MemoryPlayer_Title = "6eed25431c3ac267055f194a013100432943422d57f32dbdc90455c3164e686c"
	/// アップロードした人
	case MemoryPlayer_UploadBy = "462839e6d9a8a5da5cc17ea21124d7f00fb3253901d9d52222f0c3ffabd0cf8a"
	/// アップロードしたバトルメモリー
	case MemoryPlayer_Uploaded = "a5a92c2af5aab2dc6d18c1ed1466914aa93563842e05e90b76396bac1d897783"
	/// マイコーデをつくる
	case MyOutfits_Add = "6cf006eac62cdf264a5cc5d66dccaf9989f556958a4476796adbde4a0bea5372"
	/// + このそうびをマイコーデに追加
	case MyOutfits_AddCurrentEquipments = "b32a290a773fbec9ff3e32572f2b312fe928d8c7f319c8a332b710312df6fc3b"
	/// すべて表示
	case MyOutfits_All = "b73b3fbd5fe875cf16572c735afcb4551c9757cdce4888cf17909a370fa1610d"
	/// マイコーデ
	case MyOutfits_AppName = "f8eeca91ba23ff800cc0e8b892cf624d87f7c68fa79959c353a15075a73ac819"
	/// ブランド
	case MyOutfits_Brand = "ddfc3cc6f91930d57cd1aff3300aad1d5ebbc302045c246fea97d9e14d19461f"
	/// カメラオプション
	case MyOutfits_CameraOption = "25fce505c68613afbe876beca3c4d3f78b3160c806f6570f746e017ea33af0c3"
	/// カメラオプションを隠す
	case MyOutfits_CloseCameraOption = "cb8c132b491eb15712303c47d5a338f039dddc8bfa19f216bbef0a47a4903e5c"
	/// フク
	case MyOutfits_Cloth = "30560a5c9d58f9d6480909f1d2c87a91ee9f9044fde27f785a5dac857b0333f1"
	/// 現在のそうび
	case MyOutfits_CurrentEquipments = "63508cac47ff5a926b4be4b2b3e9137853e3fcaf9d6634f7ee11382fb54c2a7c"
	/// 現在のそうびは最後に対戦を行った内容を表示しています
	case MyOutfits_CurrentEquipmentsGuide = "77384f65865c9386f0630a7f9cb0e3c6023996b7e502eac042bca7f652ed94a7"
	/// 選択中のギア
	case MyOutfits_CurrentGear = "cebf1065d9a05e98a5b56715580908cf4e09349fe7c27f52805d9fd3cabe0d4e"
	/// 選択中のブキ
	case MyOutfits_CurrentWeapon = "5c842ef28bf4018427e98f38c21315163f1e9575fb6a702061a5662c319db64e"
	/// 保存に失敗しました
	case MyOutfits_ErrorSave = "2833ddc57425de45beed765caa07297c2e59329cd6e42cd9961de5bbcc6146dc"
	/// ケイケン値 <em>{ 0 }</em>
	case MyOutfits_Exp = "12fd7af7f0fba5352e5ca37327492311a80b6e50830a7ac06cf6c7422772b06d"
	/// 絞り込む
	case MyOutfits_Filter = "fc0ac4431150aa5cebc48a4fda2982acb5226fcc5653429911f3801ad95a87c4"
	/// ギア
	case MyOutfits_Gear = "e7b90a9b91245ea375962ec4c0a010bc4f36fbc90221b5fb6379c29f1a64cc4b"
	/// ギアパワー
	case MyOutfits_GearPower = "209efc410386c9e32ce1852e5b8539ebddb49bc76180261ff42600b82be2804a"
	/// 追加ギアパワー1個は、基本ギアパワー0.3個分の効果です
	case MyOutfits_GearPowerAnnotation = "d3a5692965ce66940b8531ebc9218e09ec8e490baaa7a5d95fc8012c762a96ac"
	/// マイコーデをつくってみよう
	case MyOutfits_Guide = "45f94296748b46296f5df4997559e47900ed3c413a13c9309f25ee3523d44493"
	/// ギアを選択するとギアパワーの内訳が表示されます
	case MyOutfits_GuideGearPowerButton = "a17b8bcb2208dc90cb0ecb4e3f3e4457cccac20a6e1043778918dc1a6116fd57"
	/// マイコーデは5つまで作成することができます
	case MyOutfits_GuideLimitation = "bb84190e111d17bc730e087bd63c0f1b0c67e13463ca23e8a2cc333ef18b9d40"
	/// ジャイロ操作感度
	case MyOutfits_Gyro = "3c6dafc80d2a4ca04d1c982146d7c8f4fcf2fda35e44809f18127254870f0806"
	/// ジャイロ操作
	case MyOutfits_GyroControl = "784417f5c43fd5493c3a5b27004bd5053a67df03798990e56070ff33c2f004c5"
	/// 携帯モード
	case MyOutfits_HandheldMode = "aac3ce897888ff15d89b67d10e57a3f8cf9b6edc34183d2be23e1a82dd695b6e"
	/// アタマ
	case MyOutfits_Head = "ca4ab97d6ca202fa0e48110586fa0525e53f51626bbc4828e56a8fdea987c387"
	/// メインウェポン
	case MyOutfits_Main = "fb58b4b6e8110ebe2288fbaebb25859d2df424554b360867b813f03891c19445"
	/// 一致するギアがありません
	case MyOutfits_NoGears = "69abf58f03d021acf14c2cff8b975d7848120b24a6a22f404d9d1ba82ab2b29a"
	/// 一致するブキがありません
	case MyOutfits_NoWeapons = "f3e34ea4da85f57d50d8bdfb20b2abf0bde4836c60ee6ea546a48993cd77f64e"
	/// ノーマル
	case MyOutfits_Normal = "5ce7aff96ddf8373168dee503adb131bdafafac975f3c9ff8663030c760ef03a"
	/// マイコーデ { 0 }
	case MyOutfits_Number = "c4328dcc9cfa1ea8587d4fdaaf8744a376072463095924146894e2b636859051"
	/// OFF
	case MyOutfits_Off = "b2fb341e29fe1e86f5d18fa1c4d48741da67a43381ea5bfb27290dbcbc3be91e"
	/// ON
	case MyOutfits_On = "057c49fd9d5c47355805b94bef83af8a8a368226e466f281529f64a8da228259"
	/// カメラオプションを表示する
	case MyOutfits_OpenCameraOption = "a2adad4fe9a0f00f41035ef3bfac3db0dbc5037e8fd38a8316ca1f934ea4d76e"
	/// { 0 } 左右操作
	case MyOutfits_RControl = "7c3743e83d591af6def5e0da3a0fb5bbee08d4052e4081d5715f419ecfef6fdc"
	/// { 0 } 操作感度
	case MyOutfits_RHorizontal = "2bdf671145304f843a6bcd30f5f9d0cbe64f5bded10dde965a3bd1b3eafb0563"
	/// ジャイロ操作OFFの時は無効になります
	case MyOutfits_RHorizontalUnavailable = "42681fffc3347caeec7ef0bc97e8d11eb6f8c7e154c808809f1b60eb2cb6fa2a"
	/// { 0 } 上下操作
	case MyOutfits_RVertical = "4a2d1323b64246ac611df7cd3d8a7c7f2ffadb2d750067c7bcb59dfd19651563"
	/// ジャイロ操作ONの時は無効になります
	case MyOutfits_RVerticalUnavailable = "d3d30f3b4d19a86238f2be29f9e73a9528f4a4830ff13b594ef3655b965de7bb"
	/// レアド { 0 }
	case MyOutfits_Rarity = "4c7621b437bc25a16aa6ce96acb8c98b11ee4a1e87b8acc2d3947e3d3d418489"
	/// リバース
	case MyOutfits_Reverse = "aed471185816ae765dbe430a01f45ef8846a40e6a654fb7f747fed9c67ca8882"
	/// 保存
	case MyOutfits_Save = "59910ca933baa571600ca757434ae68dc0a7df678b852009d21d5ef22b08abe1"
	/// { 0 }を選ぶ
	case MyOutfits_Select = "28fc62bf474c7389e4800810c42f9d3a9cd029364c82aa7fca89d70a400744a3"
	/// フクを選ぶ
	case MyOutfits_SelectCloth = "c733007bbf854107ccdb8e1a1900c657531056177aaad138cea910797df57d30"
	/// アタマを選ぶ
	case MyOutfits_SelectHead = "96cb7e3c8860e1505af045afc99eff72222da99ad3f341a3f238359d796b549b"
	/// クツを選ぶ
	case MyOutfits_SelectShoes = "b59bf1c08d5d48db635b3690aa31ae9e1f18f3c81cca481b390dff732249be42"
	/// 保存先の選択
	case MyOutfits_SelectSlot = "a54fbcceed77c7fc41ec011b6d8332934847c9361e7f660958ac126d0f6aed6f"
	/// ブキを選ぶ
	case MyOutfits_SelectWeapon = "9ba348a8d1821c8362a0caf3a381c17862e527b40ad1b230a08ac04867cb0b76"
	/// クツ
	case MyOutfits_Shoes = "2c7d102edb4b3cdea03cab0d5f356ce2f2f6d16f5c3739bdd5eb61fde021cc9f"
	/// スペシャルウェポン
	case MyOutfits_Special = "98d4c09626ed55a61aef8550059a5b2cd53bfdf1a71957d7db6bd37e4407cfeb"
	/// サブウェポン
	case MyOutfits_Sub = "e7ef9bc4c55947e6c4d846c44cbaf413707f02c3d79e39bd29b9e21798742f61"
	/// 決定
	case MyOutfits_SubmitGear = "341a3600a64d7bb5c167a0f8ff4669544ce9efd1c6a5c9b94bd5fb57b51864dd"
	/// 決定
	case MyOutfits_SubmitWeapon = "89e27f5a00aeedbf28e1167953b483332c43d5a624fb2f512fa330a28b393c09"
	/// マイコーデ
	case MyOutfits_Title = "77c7f0863e22331cf6e3424ae8b45eaa14dd8faabbebfdc4c97edd3e2d30ce85"
	/// 今まで塗った面積 <em>{ 0 }p</em>
	case MyOutfits_TurfPoint = "1bcb6cc8308515c27f2990f2dfcd8b58c0316b619f6d283b1d4d2ed7dc352c23"
	/// TVモード/テーブルモード
	case MyOutfits_TvTabletopMode = "f64e74552d7a19c07faf105b39f4a2257d9f2a32d52d02dc7df8637d6e69e624"
	/// ブキ
	case MyOutfits_Weapon = "7ee970b9c347966a5d7613cbf966cf067d6ddbeffb9c0add265f88e5978c92b7"
	/// 写真は20枚までアップロードできます<br />保存期間は3ヶ月です
	case PhotoAlbum_Annotation = "f68d327a2913fc9fda815f08c6f831c9ab1f3887a7d8c3b81a22e21580c1e458"
	/// アルバム
	case PhotoAlbum_AppName = "135fd4203fb3c99bd466305104443c500618cc9223829b87af179dd87efcb210"
	/// 選択
	case PhotoAlbum_Select = "1e8f4316b29889e7c5526827fe7ac16f0e32960e1bd0b0d49f34aef506125cf3"
	/// フォトアルバム
	case PhotoAlbum_Title = "d65df64ff530ab5d85bb1c76dadd56d54277c79c11e60facfef4633885eb6b00"
	/// QRコードリーダー
	case QRCodeReader_AppName = "acf134b6a6330ff864034734913e9286e3093f96bd1a1f34d7f65bde58dc0702"
	/// 日時: { 0 }
	case QRCodeReader_CheckinDate = "36b77007ebd7663611a815741b064b4cd45ee2b4d8d88712c4e02e677dbb6c89"
	/// 許可
	case QRCodeReader_ConfirmationAllow = "e243015455eaca7ef0635f52379d985577ca76dcdd441842c592a7806b7b96b5"
	/// 許可しない
	case QRCodeReader_ConfirmationDeny = "00be4dca29bf75ee36169262fc9003a8975ec7d00b307382e1ab9b3d3bf10c58"
	/// このほうしゅうはすでに獲得済みです
	case QRCodeReader_ErrorAlreadyGotDescription = "c574121d882539c56f21b7af08bc0ea1d2781a32565a81be29d9cbc90dd04b0d"
	/// すでに獲得しています
	case QRCodeReader_ErrorAlreadyGotTitle = "58f89248eef76f2acc4598fd49b73786ae9cd25d4059eee02dc99e0b3a10d075"
	/// イカリング３で読み取ることのできる<br />QRコードではありません
	case QRCodeReader_ErrorNotCompatibleDescription = "7cbab1f2f84efe69f94797e5992144be21fdebb114e7e56c01828f4e79f8af4d"
	/// エラー
	case QRCodeReader_ErrorNotCompatibleTitle = "37ff7897bb6d2d01712e5faa3cfc931a4e842b3c93857e1e4e8f098327ba1dbb"
	/// このQRコードはすでに無効です
	case QRCodeReader_ErrorRewardExpiredDescription = "7d6512aba0118314cd0f881c50003f0c7fa553b49d3723a8b3553ec36fe98eb1"
	/// イカリング３のQRコード読み取り機能がご利用いただけます。<br />QRコードの読み取りをご利用いただくと、どのQRコードを読み取ったかという情報が任天堂に送信され、アプリ内でQRコードの読み取り履歴を確認できるようになります。これにより、任天堂がお客様の位置情報を知ることができる場合があります。<br />以下のお客様の選択は保存されず、QRコードの読み取りをご利用いただくたびにお客様の同意（GDPR【第】6条【第】1項(a))が求められます。
	case QRCodeReader_EuConfirmation = "ea417c538d00951e256ca3aa5e56e9e544716970b2ca8ae78e9c77e4e9af2087"
	/// 特定の場所にあるQRコードを読み取ると<br />特別なほうしゅうをゲットできます
	case QRCodeReader_Guide = "1f5e5983b860f7cce9a3031b4af3b386da14ab4b88e7876da7a2734fdacdefbc"
	/// 履歴
	case QRCodeReader_History = "ea595b2c09e89e40471d087ad75b3c3d2fcac1229aea671e4de8a47e0fd61968"
	/// ほうしゅうの受け取りは<br />スプラトゥーン3のロビー端末を使ってね
	case QRCodeReader_HowToGetReward = "83e8099d7ac50e61d8f2ebd645bea43a3369d3487acf37daafa30b09b02073c2"
	/// これまでの読み取り履歴が表示されます
	case QRCodeReader_NoData = "e9fed0bd6c187a7aef73682be1985cf5dc07a6e98fd5c816d37997e322fdc251"
	/// カメラでQRコードを読み取る
	case QRCodeReader_ReadQrcodeByCamera = "a781e83e462efce6f3ac0831229d9f57f01f92df71544e276280cda115c0ad14"
	/// 保存した画像から読み取る
	case QRCodeReader_ReadQrcodeByFile = "122f2f019b09bc013cca45da2500451838889ff96a5cd62de45d5fc09503fdb6"
	/// QRコードリーダー
	case QRCodeReader_Title = "26280931962111393fb6b33f686bf8b4bb808706600f6f1e11de84535554ca5a"
	/// 最後に遊んだ
	case Record_LatestPlayed = "d3597aa6c39ec6b89dbd92dc82e8892506e88f5e52010effaf2816ffc4aa5c74"
	/// よく使う
	case Record_LatestUsed = "66ebda33a211ec0d6fc545803e0ea1a0269692604907f3dc6f7c138ec284743b"
	/// メイン
	case Record_Main = "4d33f36d4e86f505d4b1e5f4a8095d1a83d422d51f210282576834c5424054e4"
	/// じゅくれん度アップまで
	case Record_NextSkillLevel = "516e6b945f5f3067202fbf3f40cc4e1f0ca32189b843bb4066662677d2e0f7ff"
	/// じゅくれん度
	case Record_SkillLevel = "d394e44bf867cf9046a15a27b9482587dbb3da25159679c0034f6f98b585fdee"
	/// 並び替え
	case Record_Sort = "e29447c6f430f21840322671a552071bccda8d45484f35861acd5342d6a0204a"
	/// スペシャル
	case Record_Special = "81f104b6b6abd5d5c3a316c586d945c1d961e96c01cca81fe4c238cdf173900d"
	/// ステージのきろく
	case Record_StageRecord = "6bf1d04fd4ed601de8751730fab69c3ebc3678a8dcbc5d8a45b642b10d411f99"
	/// ステージ
	case Record_StageRecordAppName = "1d2c691d8a2bc43d5bebaf1220d476e9235dead0cd1096039024fc6548bfebcc"
	/// サブ
	case Record_Sub = "16a7a066b74800d7c0c6950f36ffc59715a847fe67f74f5c5275c7240d21610f"
	/// きろく
	case Record_Title = "5badcdbc0209c54ea430f1019c2cd45c66293b697c0b43693d1d206d7a255ff0"
	/// { 0 }p
	case Record_TotalTurfPoint = "ac3c2be7e1386a992f4612642d6d7915d8abdb7647dbf7ca35444707c6d752f7"
	/// 塗りポイント
	case Record_TurfPoint = "fe2d8189e7751ad33a5ccc29c4055253dcac39ff4fb68ebdaf1b667d45ee5a4f"
	/// 遊んでないステージ
	case Record_UnplayedStages = "e360bb96fa8c54c2ed20ca3c99ef3bbf3eca9681fe83460eb4c3b1b4a4773fb6"
	/// 未所持のブキ
	case Record_UnusedWeapons = "ff39fc59b51258be6f900a65bd1de165e9a6f3d653e7a7cc8207aa89c3d60fe4"
	/// チョーシ
	case Record_Vibes = "49746ed0c63296cc798fb66a73d6054290b815a6d11b154f87fde973eb8abdde"
	/// ブキのきろく
	case Record_WeaponRecord = "52acabcbc0e72db6f1f862016d6ecd4cf07fe1c6cce3a3a894a57d98427b1664"
	/// ブキ
	case Record_WeaponRecordAppName = "4df3677ac5f58c2ea038a5b94445002fb2029ad1a98feddf55f31ce07fcb795a"
	/// 勝利数
	case Record_WinCount = "cebe301323ea009e422220453fadab20a135f8afdd5b8f2cb83ec719e6402e5d"
	/// { 0 }%
	case Record_WinRatio = "eea35bad4b771d0f5dbee597573278f0374e7e299c34644767c75854ab53f54f"
	/// 権利表記
	case Settings_Acknowledgements = "6c7655b9ded0686397148a88af93602f220de65c80639084d9602fe95354e450"
	/// 設定
	case Settings_AppName = "9dbf85bfd414eb1c79b7d90a8249e7ea2111d00ffc81af349c06b3129f6e8455"
	/// クレジット
	case Settings_Credits = "852de3a748d48d506fc1de8898bd7821c041573b8e09b54fc39014c218b01567"
	/// 設定
	case Settings_Title = "591a3a4aa4992444a1c8c648133591dd55ba75c3ddf1f3c6517191dd3f250708"
	/// バンカラマッチ
	case StageSchedule_Bankara = "0e83101ac9050445bc9a8110d99e3b8aff034542f97acac563ce8b76c24d9a64"
	/// オープン
	case StageSchedule_BankaraOpen = "45bce59a87edafc608efbfd40096e71f7230a4f33ef9934c6983954ed00e50d2"
	/// チャレンジ
	case StageSchedule_BankaraOpenChallenge = "a5f2e8db8d7c7b7da353d503daf456c7f4884b8be3f30f54278295865786d580"
	/// サーモンラン
	case StageSchedule_Coop = "5f91a9486dcb7ead54fd41a4e8267c5d1ccf36f9f760d319ab9f75108b3f546a"
	/// NOW OPEN！
	case StageSchedule_CoopCurrentPeriodStart = "f143af2c1e763adabd7eb2d06fad788081515c9d884a68db5bc2bc337a24afa4"
	/// イベント開催！
	case StageSchedule_Eventmatch = "4b64c0c2ff8cba7425918b71c2697c29ce7b8922badf910ad6aa10594c025f07"
	/// フェスマッチ
	case StageSchedule_Festival = "230190061a68c075470c04711898321fcf0f664ac8e9a6ed43fde73a1a1463ef"
	/// もうすぐ開催
	case StageSchedule_FestivalAnnounced = "8fabce2c4762a30c4b8f972937e4598bb52bcd741934ccfd571e6e0f8217d03c"
	/// { 0 } スタート！
	case StageSchedule_FestivalAt = "f4fbbcefe63333105ad0bcabb7abf2b274679fa8e3fc70477e4be71e5560e284"
	/// 攻撃
	case StageSchedule_FestivalAttack = "9275b7f0d6e0e7213c5a41963ed2c585836b90e41553a2a7eea3b682c9deebb1"
	/// 守備
	case StageSchedule_FestivalDefense = "1a48028426538c7a06d394bf2a19958def8e14ccf03817e654fab3f874ff7243"
	/// 開催中！
	case StageSchedule_FestivalHolding = "0c83f80470668de8acc4eebfc0a89979265fb010df44e0ae0c76c2a7a08b9728"
	/// { 0 } - { 1 }
	case StageSchedule_FestivalPeriod = "09498f2d941d7862b43131c4ce975f1e9414e4a6542b889376ae5332de40b329"
	/// そのつぎ
	case StageSchedule_Future = "d8c9aefcd3566c9df21a37c7c0d5cad2dafd9d6bd11a05660935b233ab2356aa"
	/// リーグマッチ
	case StageSchedule_League = "3712aec44b25f9fb81517e0658ac9f98625dfbcbe494193798a4bc92b85b3511"
	/// つぎ
	case StageSchedule_Next = "ecbaabceb0ed5e6b497a98c6250a8a2a9b24a993633f597a94fd96d16201b62d"
	/// フェスマッチ開催中！
	case StageSchedule_NowClosed = "53387853b53c8884f9a3e3994170ada076c9e4d33e713f75807b97bbf5b5f9a8"
	/// オープン！
	case StageSchedule_Open = "94c40ccbbd87eda3b9d0de5efc8028015b7eb9a44b2d6ecb136793754586d073"
	/// プライベートマッチ
	case StageSchedule_Private = "770948cc44ea0d73c2a649d9441551932b3919393d5f347f410bb9f81d612883"
	/// レギュラーマッチ
	case StageSchedule_Regular = "e9680058d0336f426765b542402cd5db9958b2995d46ab7da26c19fb5c22abb9"
	/// フェスのきろくを見る
	case StageSchedule_SeeFestivalRecord = "0411f56a838c023a58490f4584f736bd6090739450c22d7c2a32f8692a21c305"
	/// ランダム
	case StageSchedule_SuppliedWeaponRandom = "d0bc3f48316b89fabaafcc292cfc4ab93cfd75945e25f9046c2244caaa2fd15b"
	/// 支給ブキ
	case StageSchedule_SuppliedWeapons = "9ed2996ee6a90644ae1757ace69be615975f5cb3f0dbb8502d970becf6c57c7b"
	/// スケジュール
	case StageSchedule_Title = "4847704abe02e16687e60d8a135659b5bf0da3050d73a9db19b0565ba31ae74d"
	/// ルールごとの勝率
	case StageSchedule_WinRateByRules = "589ce3e297b9e8ee3566d75044994a812786ad4ab0874d077813cdfc3b0fd2f7"
	/// Xマッチ
	case StageSchedule_Xmatch = "029912562485c13f9a7a3f0eafcc7100034972ad958be725af0036f82fdb3c4a"
	/// １００倍マッチ
	case VSHistory_100x = "bec43439ed994b646019bb4b4e9224b4f9b9169e4897af48b1a8e3b7cd276a28"
	/// １０倍マッチ
	case VSHistory_10x = "0c6c28e18f13dd903805fd948b00f5f0ba055e9228af0fd133f266da91f03f63"
	/// ３３３倍マッチ
	case VSHistory_333x = "dc5dee801710edf17ef1cdf794aa5861734fe8ef3b13a587c2c74da0cd4bb71f"
	/// 人数が少ない時間が続いたため、負けとしてカウントされませんでした
	case VSHistory_AnnotationExemption = "345d3e19fb0ec9e90449e1d379176c7a688a35adf9d5ca26155a13b0d41a76e5"
	/// 無効試合になりました
	case VSHistory_AnnotationNocontest = "5eae85742cc0226a885daaa41367423d21d59db06f3b725f383e946ed0b60543"
	/// 正常に試合が終了しませんでした
	case VSHistory_AnnotationPenalty = "3977bca6bf43bbb7e3cb3e550b631c25aacc2ed4fa9b2b35fad7933f19ad8821"
	/// 攻撃
	case VSHistory_Attack = "74df8c34b9731899ef89db9729ccb4a1dbd45123c5811fb112b655f59e592407"
	/// { 0 }分あたりのアベレージ
	case VSHistory_Average = "592b28dff38c51ec781e7d882bd609f025d4aefab5e1e46139ff565ee8fb3725"
	/// きん
	case VSHistory_AwardGold = "c5ac41a5e77580bafec20cea07973886009a4d0c548a72e8b23930ffc564e32f"
	/// ぎん
	case VSHistory_AwardSilver = "a021f2f0a0bb56680e967f05cf8d64b733abdda98de77552168348496613e60b"
	/// バンカラマッチ
	case VSHistory_Bankara = "80037463555c44f96dcec83bff97c82373bf0beaa57f198ba347bab4932cb2be"
	/// バンカラマッチ チャレンジ
	case VSHistory_BankaraChallenge = "f889b8f3110a483d2f7fb2234a725d53a7c111fad3350c2d571543ecca286e1c"
	/// バンカラマッチ オープン
	case VSHistory_BankaraOpen = "38d153e348725250483fec7aa2d7383121a6ffb27a1840cc37a02e29bdd79b63"
	/// 清算
	case VSHistory_Cleaning = "67bd447a4a0ccb1411fae063eb2fc318bf04ee6d00b95d3f1b27fe8509b4571a"
	/// こうけん度 { 0 }
	case VSHistory_Contribute = "c4e645004653d3d4c79c9cf5609a831a7c91983205226b1909c8e26d5bbc9c60"
	/// { 0 }カウント
	case VSHistory_Count = "f18566114b1629df0cb0be3533ea8493f62afa03000415f27ed791373577930e"
	/// たおされたかいすう
	case VSHistory_DeathCount = "4c4da32272536b5e542c63f5f4deba1deecae4118ff08c69ff06f546616ba9e5"
	/// 守備
	case VSHistory_Defense = "de84c245bb927a0ddfee69da991f96d74bd9cffe1e855e485a670dd548b36af0"
	/// DRAW
	case VSHistory_Draw = "1c1351cf72414b07108c8f5927d5c54abab3e3e46bf398fdc42ab25acef3e8b3"
	/// そうびしていたギア
	case VSHistory_EquippedGear = "8d6ec2c41c2f0de034bfb0ab399ad020025f82278c3cf3ce6aecb6a15bec1876"
	/// そうびしていたブキ
	case VSHistory_EquippedWeapon = "97c00cfc3ea8394a13303602aa202a33d994c6bd3aa5be05008c2aa8e3365170"
	/// フェスマッチ（チャレンジ）
	case VSHistory_FesChallenge = "e484328375edebc7ec6635e148394c9ec8b06b0a9ac72533482aec56b0ef66d5"
	/// フェスマッチ（オープン）
	case VSHistory_FesOpen = "25b6b40baeac356c7b67512bdcc9e9b2a647bf9cab216ef704240ac881f135f8"
	/// { 0 }チーム
	case VSHistory_FesTeam = "cd0898bf01a35ce13313555495a37e630046356db80d1a603274888b814d9517"
	/// オマツリのあかし
	case VSHistory_FesWinProof = "436e8a4829711926969727545560c62398c3bc5b4b0c845f7728d561e4ede7d9"
	/// { 0 }{ 1 }パワー
	case VSHistory_FestPower = "9ad49db23db0451e86c0be1041148dfc4a8acb8dfdd3e47fac5dc8fe11df333c"
	/// フェスマッチ
	case VSHistory_Festival = "dca6d50ed8ba8f09fc4b9be3af979e25d16d77f204bdef1c39e5b55b17b4f9e3"
	/// オマツリガイ x{ 0 }
	case VSHistory_FestivalShell = "f6642087542e65370574c8905be7468ca1540675713c82785a3be9cbf20315b7"
	/// バトルのきろくに戻る
	case VSHistory_GoToStats = "0e68727d62245b1db815eca77c198bcc6f46b1912f1b7f32d13431040a02b7cb"
	/// ゲットした表彰
	case VSHistory_GotAwards = "d9046b74c5aa5b9b0e5aac8d257966ace664ba14ce1aa2a14fca504f32453b95"
	/// ぬりまといかくほ
	case VSHistory_GotTricolorTreasure = "20ebce3936375b0e7a34380cda68d765cfaaf62766ecd8f23e6b7b22e0b284df"
	/// 挑戦中
	case VSHistory_InChallenge = "2a723d9af78475e82b9c847d54d8a1ffcb7ea11d41ba1ef4433a2e7baf91e7cb"
	/// たおしたかいすう
	case VSHistory_KillCount = "bf0644b773f17fdec3543daabffeca4b08c23d456ce2ad7e4bdb3f0b572a390f"
	/// ノックアウト！
	case VSHistory_Knockout = "81eff5cf0511f87485e7e3585da6ab043edb5ec9993c2ed74bf83f90637f916b"
	/// 最近の50戦
	case VSHistory_Latest = "0ed60926c77b7bd0878b0b843f48f06facca5d8f0ce21fafd86ef06c7c7d7e79"
	/// 最新のバトル
	case VSHistory_LatestBattle = "5b2b8f46eb7b670ab5a380a98fe1be226638ae2f515802e447beea94a2757247"
	/// 最近
	case VSHistory_LatestTab = "fb9af75d654d6d0d55fdd61076053dedeb375305e892c2173e8295cac037e0eb"
	/// LOSE...
	case VSHistory_Lose = "cba9de8f2cd7345abd56500e8784a5608f9906937f3f7a52a4daa76178fde787"
	/// 次のバトル
	case VSHistory_NextBattle = "983efa5094f5f16b194c76aa462dd2dceb5f0b57247e086794c56616b98d5ce9"
	/// バトルのきろくがありません
	case VSHistory_NoData = "7947f7e1b1fc89fdbd2caf1e7acd4d4affd35b542821da9feca0dc876618ea48"
	/// バトルのきろくを表示できません
	case VSHistory_NotAvailable = "7975246140d003c121a0de9b681d638508cf29219527d7bcf1b362d2746a8daf"
	/// 閲覧できるバトルのきろくは、モードごとに最新の50戦までです。
	case VSHistory_NotAvailableDescription = "49102643b4364bdc31c8ecc73feb752a4dcbef03e382c67344b96beec9d1a9de"
	/// 前のバトル
	case VSHistory_PreviousBattle = "1857f34d1137fd47f31da2f57dab17f63cd80bff32ba70dcca5dc2ba3f7ed96a"
	/// プライベートマッチ
	case VSHistory_Private = "af2ce706fe43c6744d00fd2a19b13c6d0452ea0c0ea799b67914236aa2c3d13b"
	/// 昇格戦
	case VSHistory_Promo = "82a1c2b1b65721eb586f2c298d618e68bd976062574fc38a0d44a7c8858c36f4"
	/// レギュラーマッチ
	case VSHistory_Regular = "480438be0ecff40c5d9e53abc59bf731ddecaf7a655334100fb00d81f8ea514b"
	/// スペシャルウェポンはつどうかいすう
	case VSHistory_SpCount = "2b0dbbe570516674e1e42cc36e366f7d8a412a99974fa076784eab87404463f3"
	/// バトル
	case VSHistory_Title = "8ad35d7a1e53bdb7b18c1e7fb108d90740162c299b015cb5090949741a7609b4"
	/// トライかいすう
	case VSHistory_TryCount = "840cb5f1f162b6b2597aae15919baebc18c457ce67d318a3a39ccf0eadd85ab6"
	/// { 0 }p
	case VSHistory_TurfPoint = "6b43a410fdc350cb0f2f50fec7ccd33903911b4be0bab0ff1c470618bbc65adb"
	/// ウデマエポイント
	case VSHistory_UdemaePoint = "350a4395a5416a2911252300487f2f8a3b133fc58de2cf16713a6dcddaa7ac39"
	/// { 0 }p
	case VSHistory_UdemaePointScore = "da9fae0bfa8b3fd6a7fa0da81da14321d946aa25eb05c54d5c2ed5fb8e4b9d93"
	/// ウデマエアップ！
	case VSHistory_UdemaeUp = "c5a04c6c1bdb81c29c5365ee2611b758b7de5cd547dc18c27c1e34d2100be5ef"
	/// WIN!
	case VSHistory_Win = "a2f6a907beb844b206f0faaf126a46d89b57ab729a2c36c2eadc097b693afeb2"
	/// 勝敗数について
	case VSHistory_WinMeterGuide = "fee51d1d05dee211c7a8f9755956ddf21dc66cbbb673e8960ff6e277f82b8c93"
	/// イカリング３はスプラトゥーン3と連動するサービスです。<br />ここで紹介したもの以外にもさまざまな機能があります。
	case Welcome_About = "f1586186e0c39db69a43dacc571c0a2f8514ebe856861f3cfabaf1cceb2128bb"
	/// バトルの戦績やスケジュールをチェックして<br />ライバルに差をつけろ！
	case Welcome_Feature1 = "21acdaa84e62d37e3257bf1514acb9667c120634c3b77aadde76d1d7d9981120"
	/// バトルの戦績やスケジュール
	case Welcome_Feature1Alt = "ae1ff47612fcb48a2d74c13ee2e8092f1f3330ad8d50089ee34bf6bb4f288876"
	/// ファッションリーダーたちに朗報！<br />いつでもマイコーデを編集できるぞ！
	case Welcome_Feature2 = "e66a1c7046c69c238f097919195d8acb6e6b3433d1eb9a66d8142b3288db299f"
	/// ひとり旅に出たロブを支援して<br />特別な報酬をゲットしよう！
	case Welcome_Feature3 = "5e5e4bbe80042b2f0742c441fb10e13ca53954d48719aac3dd56f93f6d47fe6f"
	/// ここだけの特別仕様！<br />ゲソタウンで限定ギアをチェック！
	case Welcome_Feature4 = "905e5236d387c4baafa4b701a59ec4a1d09fd577c99dfb35be9393f27943d0cf"
	/// Features
	case Welcome_Features = "a9bc9d7eae8de7287ef52a086bd2c70155cc3df794a62b4c1433aac2baffc60f"
	/// https://store-jp.nintendo.com/list/software/70010000046394.html
	case Welcome_Link = "b2c9a47759ead8f267e77ceb8581769228a85622c686354d80be4abd8177d488"
	/// 他にも便利な機能がたくさん！
	case Welcome_OtherFeatures = "c7c9ca54e6cb49467f946a575a3ac5a64530b1d48e2130ca150958d07a4a67db"
	/// 本気のヤツらのためのイカしたサービス
	case Welcome_Service = "f239aaa059b45e4013d4f9b42a299567db457c833aed33ea5cf7a76c970ba45c"
	/// スプラトゥーン3
	case Welcome_Splatoon3 = "b3e83e26112a46f65bea8c3b3d4a09838a9a5fb537be3128de89d80896bde76f"
	/// 購入サイトへ
	case Welcome_Store = "f5e5187407e8be073703fbe7e9516a5cba7f5bbfaa7bc2f3018a3c2274181f1a"
	/// My Nintendo Store
	case Welcome_Store1 = "98ab8d5fc0c7c01c529f4c59d07fb7af3517c1dae2b880f1f1e7fa6447767a9f"
	/// ウィジェット
	case Welcome_Widgets = "e42570b0044521021434c0b5d16d577d81861fe1f5c4eb594a025d305122c7fb"
	/// イカリング３のアルバムの画像を表示します。
	case Widgets_AlbumDescription = "6c09243d6c1861e27d63284d905217bc0d017867ee2716a7241d2d633005300a"
	/// スプラトゥーン3でイカした写真を<br />撮影するとココに表示されるぞ！
	case Widgets_AlbumNoPhoto = "6f7c3e4dc7c2f3230df2721bfb2b24974f905fe7e5562c1132cf96e4f93c13be"
	/// アルバム
	case Widgets_AlbumTitle = "5745e6cf37326c23451541a24e62fbe7a015f8abdd199bec0bfd3ffd357e82cf"
	/// スプラトゥーン3の現在のそうびを表示します。
	case Widgets_EquipmentsDescription = "d1fbfc8e580ef35db68e106cc2601a066e4e803be4fa742727d1d62c771bf21d"
	/// 現在のそうび
	case Widgets_EquipmentsTitle = "2bfe76ed6ddd1566c623f14278a4de2fe048dfdd3cbd3b12a7247649134eeaf1"
	/// このウィジェットはスプラトゥーン3の連携サービスです。ゲームを遊ぶとデータが蓄積され利用できるようになります
	case Widgets_ErrorsNoData = "00636b567577ae85a5f92c98d13764f5473f4bfde3774b175011517d85c88e76"
	/// スマートフォンアプリ『Nintendo Switch Online』にログインしてください
	case Widgets_ErrorsNotLoggedIn = "e16e3edf25cb3432920a65718fb19df7aaba5995ed6990244cb3ae7adb18d2ee"
	/// 現在利用できません
	case Widgets_ErrorsOutOfService = "4fcecec3697493df4e1fda59f02338b7cf16696e01cf8ba990571e610140726e"
	/// Nintendo Switch Onlineアプリを更新してください
	case Widgets_ErrorsUpdateRequired = "db5f6fa63acf6ad564d9f41d5283a85031c9be2e0f09f25ac90ab99dea6bb831"
	/// ロード中
	case Widgets_Loading = "9349870f0195bee06c49131a5336eae5ba5b03c9c3fbbccfbda932a43f04b43b"
	/// バンカラマッチ
	case Widgets_StagesBankara = "c5ecb1b4810d0f52ecd11939d4af015d25015fd30829466c4829d06733cb0684"
	/// サーモンラン
	case Widgets_StagesCoop = "286c2474225a669afe85633b852854d922eb33b161ba8906c2ec1b374ca124a1"
	/// M/d HH:mm
	case Widgets_StagesDatetimeFormat = "089496aa094f44d5a25c4c6bcef4f095fb41a03d64e6a6c4b3f7929161445d6b"
	/// スプラトゥーン3のステージスケジュールを表示します。
	case Widgets_StagesDescription = "9f3d2ff275a87c51ac27240808495e799692e064f5448d00a987794361fb4e06"
	/// スプラトゥーン3のステージスケジュールと現在のそうびを表示します。
	case Widgets_StagesDescriptionAndroid = "25baf3fc9e3f022c47ce979100714188f3862eb99d7e27169750f1a27d1ee944"
	/// フェスマッチ開催中！
	case Widgets_StagesFestMatch = "763425040e9bdc92a8f175290e573dfa7bf36222e6d430ed25426571a660ce11"
	/// まもなくフェスマッチ開催
	case Widgets_StagesFestMatchAnnounced = "e21cb454675a1a3ca9d423b7d6ad61763bc603234a6be4210a47e3070141780b"
	/// リーグマッチ
	case Widgets_StagesLeague = "26f950bb5bea0406794b88b21b9b334b4db78eab374fc2c09e0f413ef810006b"
	/// スケジュールがありません
	case Widgets_StagesNoData = "6d32bd24432306144ff77e5199964b3b6fd266dc029f47ecfbe9e3d3e96888a2"
	/// オープン！
	case Widgets_StagesNowOpen = "b147f1ec29300a8cf8222869add46c81d904fa3bfd3b188bba41130c48b8e955"
	/// マテガイ放水路
	case Widgets_StagesPreviewScheduleStage1 = "bffcbdb807e53d78f5db771cc2e68b826ad8cb837a48b206eeabc995a2eea8d4"
	/// ヤガラ市場
	case Widgets_StagesPreviewScheduleStage2 = "8c64d754ab7c76dcde432978b0c6a7a4ff1c4f722620c99593674347e54465b8"
	/// ゴンズイ地区
	case Widgets_StagesPreviewScheduleStage3 = "1de10cb35874019501a557930d1c5f5c6a46e2ae08d3dab34565d5e895e5b8c7"
	/// ユノハナ大渓谷
	case Widgets_StagesPreviewScheduleStage4 = "b339fc000476662de2a06e1b6daa0dddbd299c301a7c264dbbed2117e18d9ea8"
	/// 09:00 - 11:00
	case Widgets_StagesPreviewScheduleTimeSpan1 = "1ddee39ff22001a2c34d3309c0c18d10a542c9876830282bc15f47c200bd1d37"
	/// 11:00 - 13:00
	case Widgets_StagesPreviewScheduleTimeSpan2 = "3d673645e01b21ab1b24b1a1170ad35990e80881f8d3b3385a5ac835d0848996"
	/// レギュラーマッチ
	case Widgets_StagesRegular = "8c7e00412205d8cc588f8cfc055814a6f66d2042a283133d8b4ebc425499fcf8"
	///  - 
	case Widgets_StagesSeparator = "13341de71f4147b50bd652103f6928235a1ee4b8e744a36d5fc1027d4274d3df"
	/// 表示するモード
	case Widgets_StagesSettingsMode = "58bb3c55c46c45eb1f85e03cd168472573a795cbd8ab563641a45a89280409c4"
	/// 支給ブキ
	case Widgets_StagesSuppliedWeapons = "106d2be15bb4291f3f35964f64083926f5c96134efabfec1cfd5df8ca7f2296a"
	/// HH:mm
	case Widgets_StagesTimeFormat = "74c680f8ebb5c4c5459281187004195627ec983a6400927be8b134b139c2132d"
	/// ステージスケジュール
	case Widgets_StagesTitle = "953ba00b840ad1d122137d29e4a7e010d2a82ddbc1d2c478e46691c9b4b5bbf0"
	/// Xマッチ
	case Widgets_StagesXmatch = "24c92756a447af77bd0ee4813acea59b0ee79c46da27dc2338442a2cc38293d6"
	/// yyyy M/d HH:mm
	case Widgets_StagesYearDatetimeFormat = "6c98b27367a580a45b4b38ea053c013b04005a45f9423c76a040998fbc355d87"
	/// %@カウント
	case Widgets_VsCount = "c3850f235408152b3f7c2748c7074073acbd6f10a0e1cb19f2867debab77a556"
	/// ノックアウト！
	case Widgets_VsKnockout = "fe6b79f8de685535d889b6305d2adef95046d24b54766b47a202bb8c2a2f47ef"
	/// バトルのきろくがありません
	case Widgets_VsNoData = "7c36cc1f37bba317e2bdda5da7da8646b77346f0bb3fa5e4f8d62560e0722db9"
	/// %@%
	case Widgets_VsPercent = "9aafbe17c231bce2b5ff24b329ac2a71f57eb074f366528fb985121b5c2b43de"
	/// ナワバリバトル
	case Widgets_VsPreviewRule = "991278172c454764a87345457c7ef0a00b881307625708c19f6cdfd84447aff8"
	/// 38.4%
	case Widgets_VsPreviewVsLosePercent = "de5c52694163632f5728890d838f9acf32c4b7ec8118ce6906a8c8e6623feaba"
	/// 533p
	case Widgets_VsPreviewVsLoseTurfPoint = "2a7e76ac62d56c224cc06841479d63a59253e61d5daf32ed796c051c6a96e775"
	/// 63.7%
	case Widgets_VsPreviewVsWinPercent = "2fbf1401be2e9e8644e5634db29d95519e0ccb7e2d3536c688e78b24c615f856"
	/// 1162p
	case Widgets_VsPreviewVsWinTurfPoint = "beecb6ce10d6357350b542efd299d60e2ca736511a1be3026b3af0da39b3225e"
	/// %@p
	case Widgets_VsTurfPoint = "55e91d93cd74b5c8cb05ccb216b58b78b7f12e2a605b084a045c48f244676d2c"
	/// スプラトゥーン3のバトルのきろくを表示します。
	case Widgets_VshistoryDescription = "9dea92299d637fcfcd8b8c8d844e00e2a903c5ab19fc57ab06af0676ca6cf106"
	/// DRAW
	case Widgets_VshistoryDraw = "b4a40bebf1aab30af3e46559314211b21231f62be22cddea66f0327b85636363"
	/// LOSE...
	case Widgets_VshistoryLose = "80272cfbe2df2b4396b14845e50496c0e2fb3bcfd0b6995f9ff1dc58458ca023"
	/// バトルのきろく
	case Widgets_VshistoryTitle = "6031c92a5f8d7b0a4e8e4932658fae95869535cc20a675e8f51f84a0b845cd25"
	/// WIN!
	case Widgets_VshistoryWin = "070dd3cec699a678672bf22af57a410f269ab08b455b6b77d760843f00cd073f"
	/// ja-JP
	case SplatNet3_Locale = "0a36005a87296c7edced11a972453133f6becb79f90224e4457da146ec36204d"
	/// ヨコヅナ
	case CoopHistory_KingSakelien3 = "9bc1c1d0341a2049db2ae54546b7335074dda0d2ea88f32c1499771850b7a904"
	/// WAVE 1
	case CoopHistory_Wave1 = "9fee890ae2d6bb7f916691c0f4cdd948fb2539fe77d57945700aacb53735aca1"
	/// WAVE 2
	case CoopHistory_Wave2 = "f979e54cad66243f388c4b899141cfeb168b7d602f7404e3b00593bcbdae7824"
	/// WAVE 3
	case CoopHistory_Wave3 = "c76dc4e8e2a4cb85a80e776484b7d48339b8b2620bffff9ff509b356994f5164"
}