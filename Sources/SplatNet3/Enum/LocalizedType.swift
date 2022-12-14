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
	case SakeArtillery = "2c7a648b4c73f291b5ede9c55f33d4e3f99c263d3a27ef3d2eb2a96d328d66ac"
	/// ドロシャケ
	case SakeBigMouth = "f0dd8c7eb5c2e96f347564cac71affe055f6c45a3339145ecc81287f800759d2"
	/// ドロシャケ
	case SakeBigMouthGold = "3211c6b9655730fdd890f25dc7c7f95dc5c97c8a6f243475fda47e99e2606e4f"
	/// シャケコプター
	case SakeCopter = "7a8dd0dd9f999de3f9b9ea85be3c237063626c46253492063d547fe31b6fb091"
	/// ダイバー
	case SakeDolphin = "dbbf89da359fd880db49730ecc4f66150b148274aa005e22c1152cbf1a45e378"
	/// タマヒロイ
	case SakeFlyBagman = "21359d8aa73f82aa8207ee1b3d50b552332754ce2cf5993dd017a744a501d104"
	/// ハシラ
	case SakePillar = "fb4851c75f62b8b50d9bac2128d6ef1c703c7884b63402762ddf78c1555e364a"
	/// ナベブタ
	case SakeSaucer = "2185696079cc39328cd69f0570e219f09b61d4a56508260fe97b16347ae8a55f"
	/// モグラ
	case Sakediver = "fd5abb7a9087c528e45a7a4e29c9c03d673b69d6f0ba2f424f6df8b732d9919a"
	/// グリル
	case Sakedozer = "8cd6dd3e1bb480e2897afdb434315bc78876204a0995c1552084e1d3edfe0536"
	/// バクダン
	case SakelienBomber = "f59fe344bd941f90dc8d3458ffd29b6586c1cffd00864967e7766a5a931dc4f6"
	/// カタパッド
	case SakelienCupTwins = "03c31763738c5628db6d8e7dd3ba0fd2fcb79a1f47694488b51969375148edde"
	/// ヨコヅナ
	case SakelienGiant = "75f39ca054c76c0c33cd71177780708e679d088c874a66101e9b76b001df8254"
	/// キンシャケ
	case SakelienGolden = "a35aa2982499e9a404fdb81f72fbaf553bc47f7682cc67f9b8c32ca9910e2cbf"
	/// ドスコイ
	case SakelienLarge = "e53dd47586bd49595da1234375915e443717dc1d0ad5c67c6273065b03f07a81"
	/// テッパン
	case SakelienShield = "3a3e2c87b96b92e31ffc59a273b7d6aca20f9941e05ad84d6ae26092a627aa34"
	/// コジャケ
	case SakelienSmall = "a6e82107212e31edc530ea5a40a064debcbe5073b15ba59610e7723e46f6fc51"
	/// ヘビ
	case SakelienSnake = "999097a0908a4560f05a16e3f97c07b5d10bed22bee6d2ce0eedb2e6a6dcb9d0"
	/// シャケ
	case SakelienStandard = "019fe477ae344d461f83f7709e2a806c912c75b0be74ef7b92ccf05c013a8ae6"
	/// タワー
	case SakelienTower = "2d740da6f03364c3c289625455374f734fd8a96b25c26fde13912e90f3aea68c"
	/// コウモリ
	case Sakerocket = "faed7977b2144ac5979de0ca7d23aefd507e517c3fbe19431054ac5a6ba300fa"
	/// かけだし
	case Grade_00 = "b4f1e5a491aa8f1952352fb4831a4e6a82817bc1179b51739928c6c5a1deb484"
	/// はんにんまえ
	case Grade_01 = "a7d6f7f0e87585179ae1e746afef2b67af4eddabd90cb06e1fe9761aef1cce07"
	/// いちにんまえ
	case Grade_02 = "8ced40cefb44e796793d62be1647ee6dd8b16ff92dec956aaebc96efdae9f112"
	/// じゅくれん
	case Grade_03 = "8de95a5c09c429d4a508124c1792240b1559224e21f5450fa6c0776939b85287"
	/// たつじん
	case Grade_04 = "ac6997f9bc8f0852d0df6f70137d09f3154dc271c1b9f670dbd1570d69dc8e3a"
	/// たつじん＋１
	case Grade_05 = "533d5cce4a7efad282acfbbf2188e92653cc91232dfd55d1b0053d9c1aaa51da"
	/// たつじん＋２
	case Grade_06 = "97aef457a99b051b0ec454e0e44f038d4acce212f82fd6a968f4206e949bbed2"
	/// たつじん＋３
	case Grade_07 = "ee9651050a08fe058782eea37b988dfe7466760ca4dbb84acb45b19bc1c8476e"
	/// でんせつ
	case Grade_08 = "0c80649527617f716da3ce8142a0924c37cfe598b43da69c2721b7899487b5fc"
	/// かけだし アルバイター
	case Grade_Arbeiter_00 = "964c8f17803119b4aeeac69680e07de5f98a6a1729b256e62453fbcd9ab76ae6"
	/// はんにんまえ アルバイター
	case Grade_Arbeiter_01 = "e2788fec80db2a24cdec147445ab06d56d7c9d0e74fcdea0b37c0f250404ce5c"
	/// いちにんまえ アルバイター
	case Grade_Arbeiter_02 = "fd12bd7197e7b8b68bf7f816337f764ca65563d84da07185b284666ec221c672"
	/// じゅくれん アルバイター
	case Grade_Arbeiter_03 = "8b24a3bb25b38f418381b46d557bf331a8c9ce7d57ddbd3a1775086f4c677213"
	/// たつじん アルバイター
	case Grade_Arbeiter_04 = "1bace486c17f8533514e6566c8954d945041e5c456d4f21725591dbf68fbf863"
	/// たつじん＋１ アルバイター
	case Grade_Arbeiter_05 = "6844588f7c8bcc9344daedd93cc4ac7d657e928b1c9fea0c29cbc8e6434454c4"
	/// たつじん＋２ アルバイター
	case Grade_Arbeiter_06 = "a3d6cf43d6e3866778c7db7836c316b63e269ca209cf2b5c8199d2964c90c9da"
	/// たつじん＋３ アルバイター
	case Grade_Arbeiter_07 = "b4b150ab7addb3281db723372902472c65a673a61d1750d1f729e427aaeebc08"
	/// でんせつ アルバイター
	case Grade_Arbeiter_08 = "cabe998b30dcace3cf7206a06733ea84e3e070fbc3289db72c6929f43cc752e0"
	/// スメーシーワールド
	case Cop_Carousel = "2276a46e42a11637776ebc15cf2d46a589f1dba34a76d5c940c418ed7371d071"
	/// ムニ・エール海洋発電所
	case Cop_Shakedent = "f1e4df4cff1dc5e0acc66a9654fecf949224f7e4f6bd36305d4600ac3fa3db7b"
	/// 難破船ドン・ブラコ
	case Cop_Shakeship = "1a29476c1ab5fdbc813e2df99cd290ce56dfe29755b97f671a7250e5f77f4961"
	/// アラマキ砦
	case Cop_Shakespiral = "3418d2d89ef84288c78915b9acb63b4ad48df7bfcb48c27d6597920787e147ec"
	/// シェケナダム
	case Cop_Shakeup = "be584c7c7f547b8cbac318617f646680541f88071bc71db73cd461eb3ea6326e"
	/// アラマキ砦
	case Cop_Tutorial = "744f65e62b538b63128469805c23592429f9830de7a1c12fdc910941fbeedfc4"
	/// ？？？
	case Cop_Unknown = "ffa84f05a6437395a0a128cad1a99e8dd0f303ce4fd687fa648617a0075d7ad9"
	/// クマサン印のブラスター
	case Blaster_Bear_Coop = "0962405d6aecff4a075c46e895c42984e33b26c4b2b4b25c5058366db3c35ba4"
	/// Rブラスターエリート
	case Blaster_LightLong_00 = "954a5ea059f841fa5f1cd2596bb32f23b3d3b03fc3fa7972077bdbafe6051215"
	/// クラッシュブラスター
	case Blaster_LightShort_00 = "be8ba95bd3017a83876e7f769ee37ee459ee4b2d6eca03fceeb058c510adbb61"
	/// ラピッドブラスター
	case Blaster_Light_00 = "0a929d514403d07e1543e638141ebace947ffd539f5f766b42f4d6577d40d7b8"
	/// ロングブラスター
	case Blaster_Long_00 = "0d2963b386b6da598b8da1087eab3f48b99256e2e6a20fc8bbe53b34579fb338"
	/// ホットブラスター
	case Blaster_Middle_00 = "29ccca01285a04f42dc15911f3cd1ee940f9ca0e94c75ba07378828afb3165c0"
	/// ノヴァブラスター
	case Blaster_Short_00 = "10d4a1584d1428cb164ddfbc5febc9b1e77fd05e2e9ed9de851838a94d202c15"
	/// パブロ
	case Brush_Mini_00 = "260428edbf919f5c9e8c8517516d6a7a8133cf7348d216768ab4fb9434053f08"
	/// ホクサイ
	case Brush_Normal_00 = "ce0bb38588e497586a60f16e0aca914f181f42be29953742fd4a55a97e2ebd22"
	/// クマサン印のチャージャー
	case Charger_Bear_Coop = "5cc158250a207241f51d767a47bbb6139fe1c4fb652cc182b73aac93baa659c5"
	/// ソイチューバー
	case Charger_Keeper_00 = "2b349390a464710982d7e1496130898e7b5a66c301aa44fc9e19332d42e360ad"
	/// 14式竹筒銃・甲
	case Charger_Light_00 = "9c71334ea792864a00531040e0d05a183512e11277fd1fa681170874ba039268"
	/// 4Kスコープ
	case Charger_LongScope_00 = "ebc007b2f27b0813f0c9ce7371bdab78c62e6a05777c928bf34222a79d99de8f"
	/// リッター4K
	case Charger_Long_00 = "ed294b2c7b3111988d577d7efddb9e5e475efc5e0932e5416efedc41fd98eb04"
	/// スプラスコープ
	case Charger_NormalScope_00 = "f6354a66c47ec15517bb457e3c48c97c3ff62d34ff38879dbb3e1665dea1be5a"
	/// スプラチャージャー
	case Charger_Normal_00 = "3f99800b569e286305669b7ab28dc3ff0f0b1b015600569d5ac30ab8a97047a0"
	/// R-PEN/5H
	case Charger_Pencil_00 = "082489b182fbbabddde40831dac5867d6acc4778b6a38d8f5c8d445455d638eb"
	/// スクイックリンα
	case Charger_Quick_00 = "0cdd6036a6677d68bf28e1014b09a6f5a043e969027e532cd008049baace6527"
	/// デュアルスイーパー
	case Maneuver_Dual_00 = "b8f50833f99b0db251dc1812e5d13df09b393635b9b6bd684525112cbb38e5e4"
	/// ケルビン525
	case Maneuver_Gallon_00 = "802d3d501738c620b4f709203ccad343490bd3340b2fda21eb38a362320dc6ed"
	/// スプラマニューバー
	case Maneuver_Normal_00 = "b43978029ea582de3aca34549cafd810df20082b94104634093392e11e30d9bd"
	/// スパッタリー
	case Maneuver_Short_00 = "f1c8fc32bd90fc9258dc17e9f9bcfd5e6498f6e283709bf1896b78193b8e39e9"
	/// クアッドホッパーブラック
	case Maneuver_Stepper_00 = "e68609e51d30dfb13e1ea996e46995ed1f7cf561caef0fe96314966d0a039109"
	/// カーボンローラー
	case Roller_Compact_00 = "29358fd25b6ad1ba9e99f5721f0248af8bde7f1f757d00cbbc7a8a6be02a880d"
	/// ダイナモローラー
	case Roller_Heavy_00 = "18fdddee9c918842f076c10f12e46d891aca302d2677bf968ee2fe4e65b831a8"
	/// ヴァリアブルローラー
	case Roller_Hunter_00 = "8351e99589f03f49b5d681d36b083aaffd9c486a0558ab957ac44b0db0bb58bb"
	/// スプラローラー
	case Roller_Normal_00 = "536b28d9dd9fc6633a4bea4a141d63942a0ba3470fc504e5b0d02ee408798a87"
	/// ワイドローラー
	case Roller_Wide_00 = "137559b59547c853e04c6cc8239cff648d2f6b297edb15d45504fae91dfc9765"
	/// クマサン印のワイパー
	case Saber_Bear_Coop = "480bc1dfb0beed1ce4625a6a6b035e4bac711de019bb9b0e5125e4e7e39e0719"
	/// ドライブワイパー
	case Saber_Lite_00 = "3aa72d418643038a9e3248af734b0d6a0bf3d3bf9793d75912b1b959f93c2258"
	/// ジムワイパー
	case Saber_Normal_00 = "ddd2a4258a70cdaf8a1dbc0ded024db497445d71f950fe7645fa8c69a178a082"
	/// クマサン印のシェルター
	case Shelter_Bear_Coop = "3380019464e3111a0f40e633be25f73ad34ec1844d2dc7852a349b29b238932b"
	/// スパイガジェット
	case Shelter_Compact_00 = "7508ba286e5ac5befe63daea807ab54996c3f0ef3577be9ab5d2827c49dedd75"
	/// パラシェルター
	case Shelter_Normal_00 = "15d101d0d11acbb8159e2701282879f2617d90c8573fd2f2239807721ff54ca4"
	/// キャンピングシェルター
	case Shelter_Wide_00 = "a7b1903741696c0ebeda76c9e16fa0a81ae4e37f5331ad6282fc2be1ae1c1c59"
	/// プロモデラーMG
	case Shooter_Blaze_00 = "5ec00bcf96c7a3f731d7a2e67f60f802f33d22f07177b94d5905f471b08b629f"
	/// プライムシューター
	case Shooter_Expert_00 = "5607f7014bbc7339feeb67218c05ef19c7a466152b1bd056a899b955127ea433"
	/// わかばシューター
	case Shooter_First_00 = "8e134a80cd54f4235329493afd43ff754b367a65e460facfcca862b174754b0e"
	/// ボトルガイザー
	case Shooter_Flash_00 = "db9f2ff8fab9f74c05c7589d43f132eacbff94154dcc20e09c864fced36d4d95"
	/// .52ガロン
	case Shooter_Gravity_00 = "01e8399a3c56707b6e9f7500d3d583ba1d400eec06449d8fe047cda1956a4ccc"
	/// .96ガロン
	case Shooter_Heavy_00 = "fe2b351799aa48fcb48154299ff0ccf0b0413fc291ffc49456e93db29d2f1db5"
	/// ジェットスイーパー
	case Shooter_Long_00 = "035920eb9428955c25aecb8a56c2b1b58f3e322af3657d921db1778de4b80c59"
	/// ヒーローシューターLv1
	case Shooter_MissionLv1_00 = "9f789ff48b7cb1ff45cfc194c0ab66ee0536b19a477119e261773707ca8e898a"
	/// ヒーローシューターLv2
	case Shooter_MissionLv2_00 = "e4347077cb1cfa9d0a1e5b19f15c0a7097d0a9c8a8648d5d7132bb95e4104717"
	/// ヒーローシューターLv3
	case Shooter_MissionLv3_00 = "b711a1f922ea29aacadab1bb49719b8fc94811be870fbfd0d788ae99b80f2100"
	/// スプラシューター
	case Shooter_Normal_00 = "e3874d7d504acf89488ad7f68d29a348caea1a41cd43bd9a272069b0c0466570"
	/// シャープマーカー
	case Shooter_Precision_00 = "25e98eaba1e17308db191b740d9b89e6a977bfcd37c8dc1d65883731c0c72609"
	/// スペースシューター
	case Shooter_QuickLong_00 = "8034dd1acde77c1a2df32197c12faa5ba1d65b43d008edd1b40f16fa8d106944"
	/// N-ZAP85
	case Shooter_QuickMiddle_00 = "e6dbf73aa6ff9d1feb61fcabadb2d31e08b228a9736b4f5d8a5baeab9b493255"
	/// ボールドマーカー
	case Shooter_Short_00 = "6e58a0747ab899badcb6f351512c6034e0a49bd6453281f32c7f550a2132fd65"
	/// H3リールガン
	case Shooter_TripleMiddle_00 = "418d75d9ca0304922f06eff539c511238b143ef8331969e20d54a9560df57d5a"
	/// L3リールガン
	case Shooter_TripleQuick_00 = "96833fc0f74242cd2bc73b241aab8a00d499ce9f6557722ef6503e12af8979f4"
	/// オーバーフロッシャー
	case Slosher_Bathtub_00 = "0199e455872acba1ab8ef0040eca7f41afca48c1f9ad2c5d274323d6dbc49133"
	/// クマサン印のスロッシャー
	case Slosher_Bear_Coop = "bf89bcf3d3a51badd78b436266e6b7927d99ac386e083023df3551da6b39e412"
	/// ヒッセン
	case Slosher_Diffusion_00 = "f3dbd98d5b0e89f7be7eff25a5c63a06045fe64d8ffd5886e79c855e16791563"
	/// スクリュースロッシャー
	case Slosher_Launcher_00 = "bd2eca9a7b4109c1d96e804c74aaf2ca525011e1348d0b312fe4f034e35e5d4c"
	/// バケットスロッシャー
	case Slosher_Strong_00 = "4a8bf6b4ad3b2942728bbd270bf64d5848b64f3c843a3b12ef83c0ebb5de1b3d"
	/// エクスプロッシャー
	case Slosher_Washtub_00 = "1e32f5e1e65793585f6423e4fcae1a146a79d2a09e6e15575015af8a2032a4fe"
	/// クーゲルシュライバー
	case Spinner_Downpour_00 = "206dbf3b5dfc9962b6a783acf68a856f0c8fbf0c56257c2ca5c25d63198dd6e1"
	/// ハイドラント
	case Spinner_Hyper_00 = "34fe0401b6f6a0b09839696fc820ece9570a9d56e3a746b65f0604dec91a9920"
	/// スプラスピナー
	case Spinner_Quick_00 = "32dbc48e000d5d2015468e1dafc05e7c24581a73e54e758af0c8b9e2db3db550"
	/// ノーチラス47
	case Spinner_Serein_00 = "be4316928f4b031b470ec2cc2c48fb922a303c882802e32d7fa802249edaa212"
	/// バレルスピナー
	case Spinner_Standard_00 = "fd06f01742a3b25ac57941150b3b81d56633831902f2da1f19a6244f2d8dd6fd"
	/// クマサン印のストリンガー
	case Stringer_Bear_Coop = "36e03d8d1e6bc4f7449c5450f4410c6c8449cde0548797d22ab641cd488d2060"
	/// トライストリンガー
	case Stringer_Normal_00 = "676d9f49276f171a93ac06646c0fbdfbeb8c3d0284a057aee306404a6034ffef"
	/// LACT-450
	case Stringer_Short_00 = "9baac6cc774d0e6f2ac8f6e217d700e6f1f47320130598c5f1e922210ccdcc89"
	/// カニタンク
	case SpChariot_Coop = "0e4617cb5ae2b0667e0aa5c23364d2dd8a40f272c0a0681074f56269fadfc2ea"
	/// ジェットパック
	case SpJetpack_Coop = "802649292d7cb1dd5c2ba9aa9fcd367a1080fbbd1c0bb972456ca137025729dc"
	/// メガホンレーザー5.1ch
	case SpMicroLaser_Coop = "31eda3d59262e1322d39f272dedc844258d00e56f26ecf2f2312dc1b382ff791"
	/// ナイスダマ
	case SpNiceBall_Coop = "28ed893319def711ff4ca8ba18569795677f1da0bcba71c4bbf921b7b0c5d998"
	/// ホップソナー
	case SpShockSonar_Coop = "27030b5001c06d0873253565a41f771b3a170e92c5459f14afda290e432df018"
	/// サメライド
	case SpSkewer_Coop = "066476cf90918c4db9a3641d74b52190126a5dc6cf73b845ba36c31d9eb17aa8"
	/// スーパーチャクチ
	case SpSuperLanding_Coop = "05d01d84b9b2a6694c4ef0e005374ca4cfadc42a80cdfc4c392b3e49eec39b06"
	/// トリプルトルネード
	case SpTripleTornado_Coop = "b1fe96ceaaa727a7cba324f744aa6840618408e3a6fd1d61e21f7b9e16407683"
	/// ウルトラショット
	case SpUltraShot_Coop = "9fb7c10f3d6e5ef69b3f1f0380f7293903f50ceacd20b1649b29a90ee6028f57"
	/// とじる
	case L_Bottom_00_T_Info_00 = "3280f3051bf57a5b27981655675b250ed0306b6e4c8b00f41310467597ff8159"
	/// もどる
	case L_Bottom_01_T_Info_00 = "7cc804b450828f3521c9ddef13ba5b2aa93bdf4c1e1b8ae0955dfab46e3e18b7"
	/// もどる
	case L_Bottom_02_T_Info_00 = "57e286ee0393119e55a32a9d3383940b212bb150717a1d02eccb5644d9e11ce5"
	/// もどる
	case L_Bottom_03_T_Info_00 = "506320d6eeb1174dc279c4ed7d339fccb05ba15622634faf4a9dcc71e3bd3a35"
	/// もどる
	case L_Bottom_04_T_Info_00 = "205211649aee41392feac9abffa61ed586ac4c84163e781bbb65a320498363d3"
	/// カスタマイズ
	case L_Bottom_05_T_Info_00 = "7f45eedf1fba759f495fe9c39eb16dff4349810a63b8c34ddd9a1e31479b3499"
	/// もどる
	case L_Bottom_08_T_Info_00 = "c91b42ef48306ff36e01ea366ce113eade0bb4613b5e9c7a104da4bf02258502"
	/// カードリスト
	case L_BtnCard_00_T_BlackText_00 = "8150f84a2ff56bffcd7c9a8982609bbce59c222d298fb1845e1fbc3d628b48bf"
	/// カードリスト
	case L_BtnCard_00_T_WhiteText_00 = "6000c76435afc2606e49f310666a47f6f117b7e3c44b177395e5f221e851f1f6"
	/// もっと見る
	case L_BtnCatalog_00_T_BlackText_00 = "c1ab3aaf6a390e9522541c40273e656e75ef3f45e31627e7f2d546a91bde5da4"
	/// もっと見る
	case L_BtnCatalog_00_T_WhiteText_00 = "4fba2ccf6653a67ff4758828f2becf440432ff2c9bc050e9c21703c2e399680c"
	/// フェスマッチ
	case L_BtnFestStage_00_T_BlackText_00 = "05f0db1b84f78f1c1d8f2751410f82893a41b1943c9da1e6f12a044aa5204e85"
	/// フェスマッチ
	case L_BtnFestStage_00_T_WhiteText_00 = "187a4b3e835ad7453e9752202ef1ab66da6be4fb72a38fa76fef079ad2ca3150"
	/// トリカラマッチ
	case L_BtnFestStage_01_T_BlackText_00 = "cd0282186fc415d6b41001ac2d94f68f0a091e699e82714f6c63275f3926059e"
	/// トリカラマッチ
	case L_BtnFestStage_01_T_WhiteText_00 = "c92631f8448957caf39b4bf25b3f1a7080a8c4408a034c594a25a8a2eb9c4b21"
	/// SALMON  RUN
	case L_BtnFestStage_02_T_BlackText_00 = "e9c3e3625fa7ecf844c188e40ec013f40df1b4e437d0ed92209fc6e872771ffc"
	/// SALMON  RUN
	case L_BtnFestStage_02_T_WhiteText_00 = "f6acbca9ad9376279d2e13d684e72a051d1c55a8f7e5ce9cc4c22ea94dba96c6"
	/// ロビー
	case L_BtnMapL_00_T_BlackText_00 = "53e36619c7303219a8f6abb3bc429cc4a0f72cb541a21fe5365c686c711ebd84"
	/// ロビー
	case L_BtnMapL_00_T_WhiteText_00 = "3ecbb6fff1912e75ff207cbb12e94cb0caed3655930500df0c91ee77de29a601"
	/// 広場
	case L_BtnMap_01_T_Text_00 = "0e2e4119de7a3de1e692285779ad86c2d79a63600342e2fa9539daa033cec81a"
	/// イカッチャ
	case L_BtnMap_03_T_Text_00 = "efd5cdb6739a567901eef85f77718936effc7993a09e09d35151e8d8d67d76a6"
	/// クマサン商会
	case L_BtnMap_04_T_Text_00 = "30d4556314d0a0c1760ac6c06cfdfd1d1b99f989f3026f7d1e784eb0c7e01676"
	/// ブキ屋
	case L_BtnMap_05_T_Text_00 = "04f0bec25d72ed8a66a43b14679f8484277987bf40a0b4e82a685263f3655ec0"
	/// アタマ屋
	case L_BtnMap_06_T_Text_00 = "d88c00cab7b3b0bef6cf56cb6613a96333363c0438c3269ae54d59384240e050"
	/// フク屋
	case L_BtnMap_07_T_Text_00 = "000d2f84e3fd7175973dc7c57ae069a8bf75dd84c268a2c2a01458780f15e064"
	/// クツ屋
	case L_BtnMap_08_T_Text_00 = "4e8718184f1b8caad921ed09294afa938f3affb2397971838d4a537fd45582ef"
	/// ザッカ屋
	case L_BtnMap_09_T_Text_00 = "35206c0e269c97481a1a29fb78fd946651740853b50c19821c9fd8fdd613a3e0"
	/// 変更する
	case L_BtnNpl_00_T_Edit_00 = "c22fc8d7cfcaad9400742e027ca82378c3a7142cdb9fefc424fc43cb616ef835"
	/// ノーマル
	case L_BtnOption_00_T_BtnL_00 = "7c5f285071fc8be4985f9ce0e00be6cd48bf459229aeccfcd7fea0821c506491"
	/// リバース
	case L_BtnOption_00_T_BtnR_00 = "d7236745b4d2c0662792144915ff3a571fb6b1d51ae8dc22f1ba9c6f727f3f29"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]上下操作
	case L_BtnOption_00_T_Header_00 = "a02c5add1590ac11013b9c677eaac64ff439b20401d2db38df1c5d6461d70af8"
	/// ジャイロ操作がONのときは無効です
	case L_BtnOption_00_T_Msg_00 = "d11141407835a6f03bb0f27017095475dea249eb812d435df965e465101be774"
	/// ノーマル
	case L_BtnOption_01_T_BtnL_00 = "63e3af0e7738989005b1a8411dbde66f989af7e9303ec3f3494aa1e946eaa0a7"
	/// リバース
	case L_BtnOption_01_T_BtnR_00 = "745708c07907d0ec09043359f5c80980f6c8ba6ea6326be4a15fca15e23ed5e4"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]左右操作
	case L_BtnOption_01_T_Header_00 = "eb101faef0c343847cde5ec268fe5b97f215886d90044ac6d7d80c50c370fdfb"
	/// ON
	case L_BtnOption_02_T_BtnL_00 = "730f5cd5fc92f4212ad4d2927ea1ebcb08b2019a313154525d81f702e4607528"
	/// OFF
	case L_BtnOption_02_T_BtnR_00 = "78b09e8a98561f071535d171711edf6e391a6d94208d362b20ddae9ea1d09adb"
	/// ジャイロ操作
	case L_BtnOption_02_T_Header_00 = "4945e8ae1ad66d39ccbe7d829dd219b604cd5b72ad04967d0d6cdd2a3bf414c5"
	/// ノーマル
	case L_BtnOption_03_T_BtnL_00 = "0c486a0e9955d0bc47b2f2140e9a60465bcac3a8ea875339b0aeee8bbeeac5c7"
	/// リバース
	case L_BtnOption_03_T_BtnR_00 = "899b9027097683a4ff413737ca6bffd73660f741c4b15341c90079d144f8677b"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]上下操作
	case L_BtnOption_03_T_Header_00 = "8f895629e4a3cfefd0b6991822832b3b397897e82126d8abc79d7490b57fc086"
	/// ジャイロ操作がONのときは無効です
	case L_BtnOption_03_T_Msg_00 = "836401c53cd067b01fc12cdd67e797e3152ad512b8c344fd89a680e7b6a99ac8"
	/// ノーマル
	case L_BtnOption_04_T_BtnL_00 = "a49e94dc64436ccd9e6e017edfbc3e00d996cd8cbe672ec3972de67a59e057c5"
	/// リバース
	case L_BtnOption_04_T_BtnR_00 = "6acd2a1e9ecd2bb5f478fd24d9e2ddf946a40c33eb96dc851798b91ad365da4f"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]左右操作
	case L_BtnOption_04_T_Header_00 = "d148c90dac76a576e52716e5f26e15fc458df04becb8e95774d26a8b46f235e5"
	/// ON
	case L_BtnOption_05_T_BtnL_00 = "10bb91ba2221e19ce11a33aee8af7176cebc60a41b9f3bd0696bc95b50e8ddb2"
	/// OFF
	case L_BtnOption_05_T_BtnR_00 = "4285a13ab34d06705f6fa4b6cd4a694317e05a9e9b7c3e4de9ac060b633948dc"
	/// ジャイロ操作
	case L_BtnOption_05_T_Header_00 = "95799f696c68e09fb47c56aa6b7389d54fde4a671add57108a0766f9d647f6f9"
	/// 表示ON
	case L_BtnOption_06_T_BtnL_00 = "44f6675820a8886b6e22725550a0d28ea5f315aead2160fde3d5785921819ba7"
	/// 表示OFF
	case L_BtnOption_06_T_BtnR_00 = "1284fdf3d653f0de6ad2194817474dda0c5eff064e6d1eccd3440a9692a82698"
	/// 投稿の表示
	case L_BtnOption_06_T_Header_00 = "adf20868a23b0f6d987ec38e34bd0935d80814e8d07203e2d0555027d7d1ddf2"
	/// みまもり設定で制限されています
	case L_BtnOption_06_T_Msg_00 = "3fc2dc3c2b7e5673ece749661b3bc729129c7f2139317a6020170ea9b5c9e4c8"
	/// OFF
	case L_BtnOption_07_T_BtnL_00 = "a416e1047ed347220409f267812c648f427d8fd5a90eafcabd3f3dc0fb976604"
	/// ON
	case L_BtnOption_07_T_BtnR_00 = "ae9d0e209bb5c4a9a54a21fb383443c1d666751b75d61e1975e4c6237fa6854d"
	/// 色覚サポート
	case L_BtnOption_07_T_Header_00 = "164f21aa4b4e6c2448984f84628df04b15498b85ceaa7a8130c8deb48f659892"
	/// 送信ON
	case L_BtnOption_08_T_BtnL_00 = "34feec6e92e2c598b018af8e4ebb6a2f53f4a19d5707e56324bc68521583a133"
	/// 送信OFF
	case L_BtnOption_08_T_BtnR_00 = "8cc0ec08e2a9048e14665c0c1642ddb4fa65eb4fc4773f9cf729055053f2f962"
	/// ロビーへの通知
	case L_BtnOption_08_T_Header_00 = "e2ee0e3ff62942f693f7951563e858a8e5951de91325fa82d186a9c9bc222dca"
	/// レギュラーマッチ
	case L_BtnStage_00_T_BlackText_00 = "38acd6e71493acfcb8c524e81480704e0896fdcf9ec513d5d6384ba111052272"
	/// レギュラーマッチ
	case L_BtnStage_00_T_WhiteText_00 = "b5e16bbcddde2d68eb6c7ab69e55224157833a494c27543713859934a0616650"
	/// バンカラマッチ[size=75%]（チャレンジ）[size=100%]
	case L_BtnStage_01_T_BlackText_00 = "7c5188f4962943ff4cf21903bb2af8449b84c0027d2df9efdb75841ac8e422e9"
	/// バンカラマッチ[size=75%]（チャレンジ）[size=100%]
	case L_BtnStage_01_T_WhiteText_00 = "92b90fcf1f9b3fc2d7771426c264ed0b29217cad7405a05c09e4c7838d68b0b7"
	/// Xマッチ
	case L_BtnStage_02_T_BlackText_00 = "98a1f7364d1ece9f749fa2d908f83b7d72a46adc76ad92846c30097d6b3aea2a"
	/// Xマッチ
	case L_BtnStage_02_T_WhiteText_00 = "19b38daa7853ad534ffb56f221119929b3628fd3ab1e8c8cdf30c7ada35b2eca"
	/// SALMON  RUN
	case L_BtnStage_04_T_BlackText_00 = "1215f2a2263806547fcaf64bf6c760d71f9256eb82d1dbf31663924660346430"
	/// SALMON  RUN
	case L_BtnStage_04_T_WhiteText_00 = "8b08d20b43a9bcf7def3e3a76c08accb35671f2d25d91a77ba9a2cfab434ae93"
	/// バンカラマッチ[size=75%]（オープン）[size=100%]
	case L_BtnStage_05_T_BlackText_00 = "55b413a939c2fb718077f8cea2b0b80377bbb1df154ac470fc0502b2c12ab394"
	/// バンカラマッチ[size=75%]（オープン）[size=100%]
	case L_BtnStage_05_T_WhiteText_00 = "d15e5edc040e93823f166c736b437bac33021916a3c0eb1e1990e65326b65021"
	/// MAX
	case L_Catalog_00_T_Max_00 = "edcbe940ac1d71c2fedec1c64d0adb5916fad6884cb4b7af939ef55a058a431c"
	/// カタログレベル
	case L_Catalog_00_T_Rank_00 = "54ff8e99336d28e094f640230e844c55bf9f770d2b6c50615daff0d23997e8a9"
	/// ジャイロ操作感度
	case L_GaugeOption_00_T_Header_00 = "f90bd2500dc28783fd7063c8c3d4d0cc2ae1778e10a9d7d72d098febe00b8566"
	/// ジャイロ操作がOFFのときは無効です
	case L_GaugeOption_00_T_Msg_00 = "bcd419ca0deb0d13c9db76306362154bdfc8610edd04350e30c0e2bcdceae8f3"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]操作感度
	case L_GaugeOption_01_T_Header_00 = "5e109e142033945dbc4a132edfb607172e496b812c73c0b84991468b9fe0cbcb"
	/// ジャイロ操作感度
	case L_GaugeOption_02_T_Header_00 = "46c9d590eea1b842e79ec953dd66aad815f1d379e104ee8dd61e60b1ec9bf253"
	/// ジャイロ操作がOFFのときは無効です
	case L_GaugeOption_02_T_Msg_00 = "eb2d76bdd991e9ec94cab72c2f8bf0bb979708262754fb9f971b17423cfc38d1"
	/// [group=0003 type=0008 params=00 00 00 40 00 00 00 00]操作感度
	case L_GaugeOption_03_T_Header_00 = "1655b4537c47418a4f02100cd52900a3edd98a7107a425005554db158cb2780c"
	/// 次のアイテム
	case L_NextItem_00_T_NextItem_00 = "771290f6a993cba44ca6de810df49af5660e7682a3ceca69834e27d3335f2830"
	/// TVモード/テーブルモード
	case L_Option_00_T_BlackText_00 = "e1b9fc8c63e8e478f4ef5bcd1cc04f284d7442c9cd01f6cf307dc3b057d6bdc2"
	/// TVモード/テーブルモード
	case L_Option_00_T_WhiteText_00 = "dff8c227897823403efa71a3860b879f3d4bea2ec13e0b8d1ec51b35c26a9705"
	/// 携帯モード
	case L_Option_01_T_BlackText_00 = "c5f154cb6b5ecc7a34a44ee2aab6c8a9cab447d2c937d9a2a0028e9b8f56885e"
	/// 携帯モード
	case L_Option_01_T_WhiteText_00 = "7a1445d885c9536d9a75f6b280c416f1b8af76ec6b09ef524f6a416ad5dc9f55"
	/// その他
	case L_Option_02_T_BlackText_00 = "d844678bd4a08d34f56a929aa6b6cddc9237c8f2e866a5efe6f02786a40fb30a"
	/// その他
	case L_Option_02_T_WhiteText_00 = "e63d71f890d34b10dd2c5e96cd80ad61ea4f33d262f9e9b7626e186b2845ab7c"
	/// プレイヤー設定
	case L_PlayerEdit_00_T_BlackText_00 = "06f5657619f8204c19db278856d3b67d56cc2d30025928af75662c5cc489977e"
	/// プレイヤー設定
	case L_PlayerEdit_00_T_WhiteText_00 = "b0794c5401adb428dfc90866b2eab964b25ceec9aa2ed8bfe29424733c65e0d9"
	/// そうび
	case L_Player_00_T_BlackText_00 = "531c0870f983c1e0842f27cc83eb9eeedb478aeed880a23310cf9c09f8f460bc"
	/// そうび
	case L_Player_00_T_WhiteText_00 = "dd1f1199bc84e3f116e719e80e22684102b570bf4d941c489184037441df8531"
	/// カタログ
	case L_Player_01_T_BlackText_00 = "10dac2091593fb8d823d46f2de8fb9fdf866cc05c8c9d5602cf8950291798874"
	/// カタログ
	case L_Player_01_T_WhiteText_00 = "1fb09684b97650fb299497527eb270c470a56b05be85e22852fce5e07bb5d90c"
	/// ギアパワー
	case L_Player_02_T_BlackText_00 = "0f4c2d97d193e9b56460badb947206f4b8807a9ea0c46811641f0454273549a2"
	/// ギアパワー
	case L_Player_02_T_WhiteText_00 = "e0d686cd4d672dbc4382e99c753d71183f82da0e037c16181c37e2afa2fc3abb"
	/// ナワバトラー
	case L_Player_03_T_BlackText_00 = "3e2eeb8784e0c6b54703655a872a5acd61c5cb980e0d6eb21d6e0e1eb94cbe5f"
	/// ナワバトラー
	case L_Player_03_T_WhiteText_00 = "510a3f4927187e3b35b6d2f9a20d99d26496c696c6f8de1512e0ae3af2753722"
	/// MAX
	case L_RankMng_00_T_Max_01 = "ffa049bb3c93be0393ce772e9ef9b5564b31d095ca8a7ecad511b5d7d609dcdd"
	/// ナワバトランク
	case L_RankMng_00_T_RankHeader_01 = "fb23a147f361ead139ead8a08556d82bae3b462b5de4b93b0a147261e336fc8e"
	/// MAX
	case L_Rank_00_T_Max_00 = "67a23744506232f8b11513b699a7fd7a3fd2646025492dbc0e7e95e7dd66e642"
	/// ランク
	case L_Rank_00_T_RankHeader_00 = "9e99ac1f280649881ca1cabf48bc0780c51979112ea7bf1f3aa8e24e20fa6e75"
	/// つぎ
	case L_Stage_01_T_Mode_01 = "4a762127f95f4188eb0b884b545000d69b4f74e697d6a5ac595e39695fd9c1e1"
	/// そのつぎ
	case L_Stage_02_T_Mode_01 = "5692d1d57f10a958899349ba1295854ee4403335825e8321371d2b5f39feb46f"
	/// いま
	case L_Stage_03_T_Mode_00 = "4848f76d9d33fb0f66e2f197d0b146f751d7841664a63fa653d29d882de9aec4"
	/// マップ
	case L_Tab_00_T_Text_00 = "e5b9c0df9f13289e4ffa6e210cadcbc23f1402a22f29bae723d6ee576617b879"
	/// ステージ情報
	case L_Tab_01_T_Text_00 = "b11102ff9b2049e80567c0142a905efb6995bb45d6c4f24984806e7d10542622"
	/// プレイヤー情報
	case L_Tab_02_T_Text_00 = "4698521e12b95f234654789b7df1b9077493d5af044210a63e08f43ee521a4da"
	/// オプション
	case L_Tab_03_T_Text_00 = "203a7767d22f88f169b52913f7a2faddaee0377ccd1a29db2888111a291af789"
	/// カタログは ザッカ屋でゲットできます
	case T_Catalog_00 = "18b0429ae0198a60a536d57dd1e1956e9bfd3124a10867b118871c01598691b3"
	/// 持っているかけらの数
	case T_Count_01 = "856153e31daacd337485d538d8d4fef7bb0343f70718c2ea0d9f928386a04812"
	/// テレビ画面に映したり Switch本体を置いてプレイするときのカメラオプションを設定できます
	case T_ExplainCamera_00 = "cf3a9223451138f5b69291183c753b0a6d5107deb077729d446c9b7bffec5109"
	/// Switch本体を持ってプレイするときのカメラオプションを設定できます
	case T_ExplainCamera_01 = "6946f411789959507a28399421c8fbb8c78130d3b931df737ef4551a73391d7b"
	/// インターネット対戦などで インクカラーが見分けやすくなるよう、色を固定します
	case T_ExplainCamera_02 = "32cbc5d0f8173137aee6cf5f6ab28220f99b8065d1af98d34dfc99e5f05d8368"
	/// ユーザーが投稿した内容を プレイ中に表示する機能の ON/OFFを切り替えます
	case T_ExplainCamera_03 = "c2b364365ad3917f393d7bd2d801301ada8f6090cb2c8b4b32fbc4db3392812f"
	/// フレンドのロビーへ 自分のプレイ状況の通知を 自動で送信します
	case T_ExplainCamera_04 = "a6efcb674b8292d97007fc1ded5be17747f487b42773759d35bfab9fdd411d48"
	/// ザッカ屋に行って 最後のアイテムをもらおう！
	case T_MaxNext_00 = "0ba97e74c33bc33a21daa4633d0d77c108238e37a42ee6176b4edbe80b562d99"
	/// COMPLETE!!
	case T_Max_00 = "6cb7624db890da289e07db603508c181c6ba920d683c105c3e857dac43b54840"
	/// ステージ情報がありませんこのモードを遊ぶには インターネットに接続して最新のステージ情報を受信する必要があります
	case T_OffStage_00 = "a4890c00916778d00fc6c47cb0e90fa86fabb710a361d7d647f7c0127cf23b85"
	/// ショップ
	case T_Shop_00 = "623f24840e888d54b58dafe07284fac66530da2ef16e99c4fb05dff08bfcc5da"
	/// ウデマエ
	case T_UdemaeTitle_00 = "0137ce9b6015acdafe7c083ac4591e9592114740e0553d9928ff90d2116a82db"
	/// Xパワー
	case T_XPower_00 = "59df499af5ac36499906998051e3bfd2f03f5b9f5f822714548b2c03a51e178d"
	/// キャンセル
	case L_Btn_00_L_GuideCancel_00_T_Info_00 = "60a6829b53faf7d4362ed02a0482cc77d24fd91e1b43b7b40ae691d1e560a36b"
	/// トリカラマッチ
	case L_Btn_00_T_Title_00 = "af7a16da5148631f10eed1db9eb5d53c77f451d30caf62ec3d4b10c11e795791"
	/// フレンドと
	case L_Btn_03_T_Friend_00 = "d69ef2b4211597bc6dcfefaae8864a9f34591a471e17358f696cc3503b45474d"
	/// MAX
	case L_FestItemAll_00_T_Max_00 = "92acd08fb0ee986a0f1a70b811163a10c9458ef7e703c46e12b00c17069065bb"
	/// とじる
	case L_GuideClose_00_T_Info_00 = "cc760532ab920b96b5faa954ec8b4a3dfcd0f73b968035b4c0720b357a3f5414"
	/// ルール確認
	case L_GuideManual_01_T_Info_00 = "26910492bec47055f063f91bd90825eb1c43e18f893127ea3a4849cb67a021e0"
	/// ほうしゅうとポイント
	case L_GuideReward_00_T_Info_00 = "9218c34589c59a67fc2aac6c9b572826d58b84c40ae98af59325ea6b04ed398c"
	/// ひとりで
	case L_GuideSwitch_00_T_BtnL_00 = "09cd4b729faf8d2d2216b98317832d9e41a0a75799a41b91efafc019b05aa31f"
	/// フレンドと
	case L_GuideSwitch_00_T_BtnR_00 = "2dcf10ea94501d389cb0b628628c1310ebdf33470cb6d672f175fd5a4ca86395"
	/// ハイスコア
	case L_HighScore_00_T_Score_00 = "9fe3f39d667dfef30d6b2fcf3a3dd0c844fce4ffc4c02c5a8bc95242561ec7fc"
	/// 計測中…
	case L_PlayerStatus_00_L_Choushi_00_T_FestPowCount_00 = "762c3f34982c1c6a13010d8ae9537126f9044b84d14328e04f7eb9e8a6b1f44c"
	/// こうけん度
	case L_PlayerStatus_00_L_Choushi_00_T_FestPow_00 = "9bd3b855948b2a09ed5609f6a385a28dc0b15cb24b59af329a1f8b781415e5fb"
	/// MAX
	case L_PlayerStatus_00_L_FestRankGauge_00_T_Max_00 = "69d2eda824d6540e73c770cf2dc3774899e7689004d0580d4f55099c89eedf0d"
	/// [color=0001]フェス投票[color=ffff]に向かえ！
	case L_PlayerStatus_00_L_FestRankGauge_00_T_Vote_00 = "d8912f52723cd57d95fb57feeb548fe2b0f297b0933537dc2e8c3d16729cf4e5"
	/// MAX
	case L_PlayerStatus_00_L_Rank_00_T_Max_00 = "8fc7ee17934badce6ae6770581aa64eaa689fb8a29dcd7badbeb5cb8bf1798e0"
	/// ランク
	case L_PlayerStatus_00_L_Rank_00_T_RankHeader_00 = "4cd04028683ec607799117431d4f4dfe17075cf465cd4c7670f39de1293b46c5"
	/// ウデマエ
	case L_PlayerStatus_00_L_Udemae_00_T_UdemaeTitle_00 = "0396800566937783dc0dcc8d2c6c65a7ea428c7b83bef846f3d5bd8498567bda"
	/// 評価リセット
	case L_PlayerStatus_01_L_Info_00_T_Info_00 = "0a08ea8fa115f6a62637fe951e4e7ba7edc7f1e0a2427343caf68c09d7e9f984"
	/// 昇格戦
	case L_Progress_00_T_Title_00 = "94a5d451f292e93a0fab51579a57020382859d61181e9c35e3b447ad0f138898"
	/// ウデマエリセット
	case L_Reset_00_T_Info_00 = "f209af1ea1b3d496b32c4ffac6647a16ba95d91b18e3f05013e4deb9c0e2dcf4"
	/// ルール
	case T_Rule_00 = "00d8f2eead8b70ac7344a4e6a62919632b9a2961d22970d0eb0951ad9199bc8c"
	/// ステージ
	case T_Stage_00 = "e38418706603db0cb0ffb5fb13cce8cf526a57207b544040a121bb3dae6d8b18"
	/// ステージ
	case T_Stage_02 = "8fe97acd3b68fbdfab6e8c6f57faed2dec13c218b183306657beebf4a4d438a6"
	/// VS
	case T_VS_00 = "c795eddd2526266fc6e0bb74c3897dfce83e12915679a299d1f663d28af6f810"
	/// 支給ブキ
	case T_Wpn_01 = "284afdade29e22fe5a1f6e8cd7e10a5cf7d93a0df4f7a506fbf2258e6fd859e7"
	/// もどる
	case L_Back_00_T_Info_00 = "1bbe6b41de4a67b55d31fc644fd943c9f4e71b34366c5db140023fdebcdf7a93"
	/// もどる
	case L_Back_02_T_Info_00 = "2d98fec048ebc6be3516927b577c632f3b45fae680ce029d178dfa2303cbc1a9"
	/// アタマ
	case L_BtnCategory_01_T_Category_00 = "33699c982aba76871d69aaa6c98347c5c390cc91249503db94cfbb4bce806f6e"
	/// フク
	case L_BtnCategory_02_T_Category_00 = "de161a26f13ec2867d61b4d92c36c542c2073ddcd0af6a4df7b879e68861ae95"
	/// クツ
	case L_BtnCategory_03_T_Category_00 = "e20b1ca6f971b216b49131435117a25bdc4742f3c5602a9478e49b0abd900415"
	/// 持っているかけら
	case L_Btn_00_T_Info_00 = "406c1bbd30e8290549efc215b353991a7625e072b28995e0c0a37f46759570a8"
	/// 表示切替
	case L_Btn_01_T_Info_00 = "cdb3d372185799084b4b305884a67130fc1309c293785a57f0b51f57d83a2668"
	/// 当てはまるものがありません
	case T_NoSort_00 = "6d2245e65f8b1d5e7d2e8fb26e7f1abdd19940675bce4917366bf1c4790ee375"
	/// 連射力
	case Blaze = "36f2a17105bc157dc9b1d252ec7c103e0bf83bb365cc73c677581b91c0a6ed9d"
	/// チャージ速度
	case Charge = "ff9f88ce353a222860a9f826971a2b2ee3da6b06c696d67537285890506d4bda"
	/// 耐久力
	case Defence = "53746849d11fed114204d98f3b8f4720a892293baf9ac6be805f2f1a0b04604b"
	/// 爆発力
	case Explosion = "ca6482a42babcb32da7b2f35d88bc5007ab31aa551dce17cbb947b23fd28c931"
	/// 機動性
	case Mobility = "e8f000eec8570e3b315f325c44c29b8f37c0ed177e955a5a0b7d56bc48bda750"
	/// 塗り進み速度
	case PaintSpeed = "0ca98f962089945f48d6dd88333c21e9ccc3dcdbd2f73ca3568a5543a7967d48"
	/// 攻撃力
	case Power = "848e96567d6b48d54c0b53017bd6123cefa97d6e0fab0f14c621ec3fd92178f4"
	/// 射程
	case Range = "5de74a81b192304c10bf7b8cf50e863a19e8ae4c38a4d5c5116359db0deed29f"
	/// 軽さ
	case Weight = "81d27ef6d5033c3e1d46b7b2b50868604fd432ddb77716b5ed9383c30c08432f"
	/// バイトに参加するみなさんへ
	case T_TitleCoop_00 = "d704f116fcd56d81c1d6bc2096bab4f1d32c7dd8b172e36612c7d7ac78b02f0c"
	/// イクラ集めとは？
	case T_TitleCoop_01 = "93a9b01edeea8591f19c0d421b6db1158256d0313c37d6e025fd340ea2d4f856"
	/// イクラ集めで簡単・高収入
	case T_TitleCoop_02 = "83268b8c1b4cc0fd672e9fad81db2cd16dd42c99ef953fd85356bda6521acd3c"
	/// バイトを始めるにあたって
	case T_TitleCoop_03 = "8ff33f2f8f935bf9bdd5d88e337f2920872b8a1772cb73d9023ad8cce9d89739"
	/// バイトの流れ・準備
	case T_TitleCoop_04 = "5d4ede360ac9ea4ad5604fcaf446ddfc229141e82db29990d902065130cd7294"
	/// バイトの流れ・現地
	case T_TitleCoop_05 = "d88970a9b0b8c4a9f82083b9303be30df808b1a9f21a1dbffed9d8d96ee2b1f0"
	/// 仲間との共同作業・絆
	case T_TitleCoop_06 = "5c9bbd5028ac192db283a8d7fed15d15e20a4e4d45a4084cbc6503ab13500fcb"
	/// バイトのノルマについて
	case T_TitleCoop_07 = "b024851dc280bc5426615e2a071e536b983de46a27fec8dfc0571ece574dbd9b"
	/// 報酬について
	case T_TitleCoop_08 = "b4e59de67d2d3cc644b636bdc7ebeb83c906c9ddb45b504c24fd6606a99be2e2"
	/// バイト評価制度
	case T_TitleCoop_09 = "9f99efa2ef510b36846bcc75451e3d232b4c026e5666dcff7b71495ae42f8f18"
	/// 評価ポイント
	case T_TitleCoop_10 = "d19b8536a110f4ce65cf7cecd6a6cac6e648a9385e43213401dd56acbe658dc9"
	/// バイト作業のまとめ
	case T_TitleCoop_11 = "7a9298b6e4ccd04db02838e483e9985ed8ab948b4dff37b31774021509f6d0f4"
	/// かけがえのない、あなたへ
	case T_TitleCoop_12 = "3f0a78a355f387575749628a4eb297aacbbdd784e7f39898176ead3e4507707a"
	/// オカシラシャケについて
	case T_TitleCoop_13 = "7ebb15ca9bd17704d2af2e4898208b4d4cc9c7a98bca1f5c01abd9f375d66be7"
	/// シャケ
	case T_TitleCoop_21 = "c3171696d627dad84fd52979d9e4fa4d0b7b1713a439d21161baf69ebc8f0461"
	/// タマヒロイ
	case T_TitleCoop_22 = "cdffad36971fdc105e086d9eb685f6e21c31a8c2510b68effc1600c434b1948c"
	/// バクダン
	case T_TitleCoop_24 = "ced519e12daea62882659833c4ae0fd541b39aa035a832c1e090e4ca78a8ef7c"
	/// ヘビ
	case T_TitleCoop_25 = "bee43df768ce2e511d8fdd51a327769637e8c3c80652ada03879133fda3f6c3a"
	/// テッパン
	case T_TitleCoop_26 = "a8e208a5c993d23b05ab20227184ca2d6f93c09e9f51c3db6bc7d42faef26f04"
	/// タワー
	case T_TitleCoop_27 = "50231f46654f0f51359775c014f024394406355257fb55c00b1e4384fb060fcc"
	/// モグラ
	case T_TitleCoop_28 = "648cd9fe3e5b9976193fd240da8a118b9ea24ac842b532b530ab42805a34dcd7"
	/// コウモリ
	case T_TitleCoop_29 = "1bd0028a888ad7857a83e246e27d0bb45cd75a424a090ab68130f7c648e21509"
	/// カタパッド
	case T_TitleCoop_30 = "1d3d38db8eeb94511b64f7618f495938c9c8d9ed383140a92f7fb246aa171701"
	/// 水位変化（干潮、満潮）
	case T_TitleCoop_32 = "50e9410d4d6a02707aefe3f8f9f0bda9d4bb8ddfaf2c06ba47e64ccb00d7a6ec"
	/// ラッシュ
	case T_TitleCoop_33 = "82e6cc3e8eb8f0ab22d84eae813f3da61ebef0fa0d79faf66a6378c530a2f7eb"
	/// 霧
	case T_TitleCoop_34 = "235d53ced4bf574d22c6d77ba8d27d4f43529aa143d3b15f2275a06e3e93dffe"
	/// グリル発進
	case T_TitleCoop_35 = "198c30be3ea18a6b237ccbf3865a509ab878017bf8695a49b2039774857377b4"
	/// ドスコイ大量発生
	case T_TitleCoop_36 = "718dccf9ce30d24822f963d24c10887da64557f950e701914a0564dd1d2b983f"
	/// キンシャケ探し
	case T_TitleCoop_37 = "d79aa6202439b2e988b73568674c21fdd282bfb71fdcc7c8f173bfcf64e50370"
	/// ハコビヤ襲来
	case T_TitleCoop_38 = "c7aed9d8d6d8f32d080ec80cc87eae891817f9b5f73272e65553ebae7d0e1bd5"
	/// ハシラ
	case T_TitleCoop_39 = "7d6d8a6edf3d2ab14319ada729f1252b56498330113dcfecce0eab38eede40c7"
	/// ダイバー
	case T_TitleCoop_40 = "82dd91a50b62af99dfc147db40d0bb501fbf2cad7ba492eacd242166eff82ead"
	/// ナベブタ
	case T_TitleCoop_41 = "2f3c5ab609ef6bc6df9a4db7072a243ae5da0d397b1564668f6774f341ee9d87"
	/// テッキュウ
	case T_TitleCoop_42 = "1f2865275c15655fa4b89d3f8e6c0778c4ca5af37e338c47664bbfd20f27f79d"
	/// ドロシャケ噴出
	case T_TitleCoop_43 = "03985f469211fa99567dfd344c1a32aef6f4d83cdead80351a0340dcc2d70cc1"
	/// 巨大タツマキ
	case T_TitleCoop_44 = "0a052af0b1322f1d81d2d106879856f0308e7bccf94896ba3c77d220dab6a449"
	/// -
	case T_TitleCoop_45 = "c3edad579f6ad3d2195a99c6ccbad74d74ddb6121d1476c6270436d90c8a475d"
	/// 実測値
	case Common_Actual_Value = "5efeae7f35e33bd46b46753d5f1424b497397641a1310d32f3568564e5df0c86"
	/// Salmonia3+
	case Common_App_Salmonia = "d058fb97eef63c24cdd308a8d04085d593d271783a4fa1c8bf53cec8dd7ee446"
	/// アプリを更新してください
	case Common_App_Update_Required = "951b2d17bf45633f4f883863887c4f8b3836866d30b0511388e50d79652eea0e"
	/// チャート
	case Common_Charts = "cd016953d34f1abaecebaa95cca9566e4db57fbb94d7095cc4a886aac9201467"
	/// クリア率
	case Common_Clear_Ratio = "f9c28a7901e031ca691963a7f0303b4591ba4d9aa447423775c749c2feb55222"
	/// この操作は取り消せません。続行して良いですか。
	case Common_Confirm_Danger = "5c0f95909b47caffa520f76fbf790ce7567213d73e3f6bdcd3bf51853e760106"
	/// カスタマイズ
	case Common_Customize = "e5749152fda778df2b9747aa93c0645cafd85d08774cd6962e98cddcec1c568a"
	/// ダークモード
	case Common_DarkMode = "33ea6681abc6040a6d4a59ac74a42fd50d9bdb85b2951c6ee18624b90a21fd77"
	/// データ管理
	case Common_Data_Managements = "1b5f4155611ed4e69a7ca200da1bcc1e5133406013e9157e116585975a89eaa3"
	/// 助けられた回数
	case Common_Death_Count = "e156b171b454ff0d5752a5bd571d81e0bde2915db9bf674e219f9645d43bca9c"
	/// オオモノシャケ討伐率
	case Common_Defeated_Ratio = "03999bafcbc531faf523e24902179a738a929260fe7eaa645e84fe768ceb1184"
	/// オオモノシャケを倒した数
	case Common_Defeated_Sakelien_Count = "7213cf21b295ee5940af4c1e031831c800b5b59130f5abff8c41dcc3f342c1d6"
	/// 推定値
	case Common_Estimated_Value = "bd75b0cd71909ee61794c727e9f0049f3effb1d14aae83ceb07d914c6070910a"
	/// イベントクリア率
	case Common_Event_Clear_Ratio = "3602059e79ece1939f3fbf4eeafd2b842395214884b3ebedd6d38cbe8febff39"
	/// イベント発生率
	case Common_Event_Probability = "e4c910ed916d3db108d31a01a887cc2300cc5c6488814d47b799dedfd746e31e"
	/// ゲーミングモード
	case Common_GamingMode = "0acbe4462b52be9220eb682f01cbfce45f0d22a103a1e558a8f23d3bbb47cebd"
	/// スケジュール取得
	case Common_Get_Schedules = "3c87d33ca26429f39a25bfb0cab95d4fdf9992ea20dff2a222ae34b8695b7b92"
	/// 過去のスケジュールデータを取得します
	case Common_Get_Schedules_Txt = "c469c31538a16e91734a3efa4d52bf816082953a16a4c174ca0f76bcd9a8f0a2"
	/// 金イクラ納品数
	case Common_Golden_Eggs_Collected = "0bac26472a4bb1235490144e76fde77481e09133787cf642fe1d39c822f84523"
	/// 称号
	case Common_Grade_Id = "c7b83eab7e9d76a1bb97e10d31b5986330628fe5e4c0efbe150d6147b8e59bd7"
	/// 評価ポイント
	case Common_Grade_Point = "38270fddd88ce9994b99794d90ce86b97f11c395d2820518adbd34c47b2a7f99"
	/// イクラ取得率
	case Common_Ikura_Ratio = "4e34d6d562b15725caeed8c437b142e493d153e4c255f60180c6780d3f3bad6f"
	/// 記録
	case Common_Job_Results = "c79d7c2b65ed25b413ed29ca2dfec39c381086df620221a8755f14731ca9be40"
	/// バイト
	case Common_Job_Works = "0be0da8b63e86765c803f1db0bae8b9a9dd3f78698b7acc403e459fae149ece6"
	/// マイページ
	case Common_MyPage = "97b70d696aaee80bbe2969e375814549460a13f8d6766c9fbff4a3a675c71e40"
	/// すすむ
	case Common_Next = "5d0351718f7428e2d5635d8d8f852ceda4444e429854fae77bc53f8fab3d7bec"
	/// なかま
	case Common_Player_Crew = "4351e7e04f57e95e9026557c018b02227a4eebd748fecbb1246b2015fb9f6847"
	/// あなた
	case Common_Player_You = "b53877adf04081c95ee9976872712a04591ba6ed17947cde3b3cb5e3a8a48eb1"
	/// イクラ獲得数
	case Common_Power_Eggs_Collected = "215149cd5aba0da3522ffca495e08ad6e1a037a16940363bff402b39bea9864d"
	/// プライバシーポリシー
	case Common_Privacy_Policy = "27795ae26748cf995297e3abc1d7b7b8d1453c229de87dc3de80ded9b512966d"
	/// 保存成功しました。
	case Common_Save_To_PhotoLibrary = "2bfdff3f93d4e7f79e5c50ffcce277f6b0a3500e6479c7785c8e4223df61a9b0"
	/// アプリ設定
	case Common_Settings = "bb1bbe44cab9d06d47ca18ecab78d40061b486b164095069f495f95ddd3cfc81"
	/// ログイン
	case Common_Sign_In = "380b8dfeae3108ecd4e3ea2d31170d779132bc0b7c22a2527960646f071d780d"
	/// ニンテンドーアカウントにログイン
	case Common_Sign_In_Title = "f4774a205d9fdc52841bdb71a5ab49e309557bec2c970e37fbe4c3df4af88f25"
	/// ニンテンドーアカウントはニンテンドースイッチに連携されている必要があります。
	case Common_Sign_In_Txt = "9db53d372c8ddb16eb4d074ecec2b103403c49819a946b151da108b7dbf71dc5"
	/// ブキ支給回数
	case Common_Supplied_Count = "144e6f8d03df98bfdc03901e97f46c5538a286f603017385eaaaa5e2f3f01681"
	/// ブキ支給率
	case Common_Supplied_Main_Prob = "e0ae11b02ccf0b981281b0f417dff4ccc8df38620d51648958f1a288c7652f53"
	/// ブキ支給率
	case Common_Supplied_Special_Prob = "2b619dc847bd1d597f6217e54257c04a2d8cbd33559b62b75fd8d76831ce4694"
	/// 利用データの収集について
	case Common_Tracking_Data = "f84db2287ea2eb1df6240da08c557632b06d334fc9fd554b0198d79297a0bb3e"
	/// 許可を選択した場合、アプリケーションはCookieを含むデータを収集し、コンテンツ、製品、サービスを最適化するためにGoogle Analyticsサービスのサーバーに送信します。
	case Common_Tracking_Data_Txt = "64d644ae40059e08670d20625815fb239f79c3200637e87b8bdf7314f101a5ce"
	/// アカウント連携解除
	case Common_Unlink_Accounts = "b2420f261f0fae3aa1737f086bf010db9d4b20e279bb325c57b20b29f0dc2d48"
	/// アプリとニンテンドースイッチオンラインのアカウント連携を解除します（アカウントは削除されません）
	case Common_Unlink_Accounts_Txt = "024b4904d1eef02bf8d798e2932cada8978a1f1987ee3f6a52e8188450217a88"
	/// ようこそSalmonia3+へ
	case Common_Welcome_App = "b429b2815a5bce840308e1287878959809ec25c39cddc213718645c879f79ca1"
	/// もっと便利なサーモンランライフを！
	case Common_Welcome_App_Txt = "80a64e7ead01f2d79e21e46bb1d964f0f147d560e0bcdd35ad8f90b02bf0feb2"
	/// リザルト消去
	case Common_Wipe_Results = "101c7cbbfa13c0d031680fa971c1779acfec4fe3dd0b0681230dbfa359244652"
	/// アプリで保存されている全てのリザルトを削除します
	case Common_Wipe_Results_Txt = "0a1eb81170c4360d46b8f30770161c4488cede2882663748f56ef7e093cc76d8"
	/// レビューを書く
	case Common_Write_Review = "7d67958c81a694b00a8529af243603c7bd25a6998c0b8190aa0d46ad5ee7d0dd"
	/// フォーム
	case Common_Form = "65126fe9c6e611c757f80c7bd2791532f50a0e25d71691f52d0a749b99ed0c58"
	/// 種類
	case Common_Form_Type = "aafc2b502bd9a702fe498c57867d9fd24bee252a3e8ff499608b8c4522d15dc0"
	/// バグ修正
	case Common_Form_Type_Bug = "20dc13b1da682fbeae2963121ac74af3d3afa5881af0d7abbe1f70ea8baea8ea"
	/// 機能追加
	case Common_Form_Type_Feature = "4c162fbc69dde39226c9d674bb3a73fad2950c643319cc10cd3607c05e3faa45"
	/// 改善案
	case Common_Form_Type_Enhancement = "2a6e7d1f011d552b5455e27f91930b76da7249b93096ed13b5d5f0fd39062a48"
	/// タイトル
	case Common_Form_Title = "79af1c8d40fd2cb694d6796507c189d48820800e1a564046720d1ceab08fceb1"
	/// 内容
	case Common_Form_Content = "f719242d0b97030aa72fec90c08b0f94565511b8ac2b6deb155642cdfa5e03b3"
	/// 送信
	case Common_Form_Submit = "0fade8f6454b7a5527a83f13bb51068ad0aea8b8e60218537718d78816384087"
	/// ビッグランから街を守れ！
	case Carousel_BigrunOpening = "65716f2b4646c082eb2317b09ff051ff5665ae3d975c1656c53c2929af51cbab"
	/// ビッグラン結果発表！
	case Carousel_BigrunResult = "39fd7bc4c0123462fce5a7b9a6fe6eacc89dbb71e6af54d6e3b9c59a5c7fde66"
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
	/// ビッグラン開催中！ポイント<em>1.2倍</em>！
	case Catalog_BigrunBonus = "7d6e795b071fa52b0adf1a89d695502dba6623b925e92885879331cdfc4bdb6b"
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
	/// オレンジの空がオイリーだよね～。
	case Challenge_Challenge210Description = "023060b23ec43872b5a15a5ad3208a0953c26605903f926383d2ad45228d9ca8"
	/// 二つ名
	case Challenge_Challenge210Reward = "05b5d193a7de62de796766a911aad9897168c90b0f3afd8694d3869e9af1351c"
	/// シェケナダム
	case Challenge_Challenge210Title = "81a48fe7f465913e2f89f9ec368c56a3aae92f2aa10040cff7cda1d9ae44e9fc"
	/// アートに触れるとハートの中心まで火が通るカンジするよね～！
	case Challenge_Challenge21Description = "4178c738336dc9c78210b718fca502b22d1a2fa29307ee25d5beccc1e0355080"
	/// めちゃ映えフォト
	case Challenge_Challenge21Reward = "9cc2d0427935dda391ab08dd3249b020f37cae99810fa48129e964c480accc1e"
	/// キンメダイ美術館
	case Challenge_Challenge21Title = "5f32839f65ac4aa35230eb7444a3e588ba748ee0f366e2c1802f4967884c5fc2"
	/// ここの食堂はフライがイケてるバクアゲスポットなんだ～。
	case Challenge_Challenge22Description = "b8bf327b51e5386ff7bf2046b8b6ca86b628643cf74814bc96b9ab4f92c31237"
	/// 拾ったステッカー
	case Challenge_Challenge22Reward = "b833298e49e680b658591db904196b4d2793e4f57954b64c20929dc1a64e4858"
	/// 海女美術大学
	case Challenge_Challenge22Title = "b4402d4085246e84fa61207d801a55888c9b8dd292d55143494a6e4701847960"
	/// 橋の上は風が強くてコロモがめっちゃ飛ばされるんだよね！
	case Challenge_Challenge23Description = "1ffd251fb44630fa2c56ed64577e04dafb28f0db670946a304e47d64d47ff6b3"
	/// めちゃ映えフォト
	case Challenge_Challenge23Reward = "e23e8830ea7afa0b825ec0082a10dbb8b24075b7ee1c38008dc24543f4e71ae7"
	/// マサバ海峡大橋
	case Challenge_Challenge23Title = "ee690b9f7c872befeddbfac12e3f117f8a047ab45f0e6c7cc6dcd2f8792f8596"
	/// 溶接の音とアゲる音って似てるから、テンションがバチバチアガっちゃうよ！
	case Challenge_Challenge24Description = "2191d11f81327aff543e1f7023fd56acf24cb8aa60d9fed613a4feed683a28ed"
	/// 拾ったステッカー
	case Challenge_Challenge24Reward = "cc216030b916bfdccc5622fd1ba1fd01ff4e406678dcd6f6401add31fdf88533"
	/// チョウザメ造船
	case Challenge_Challenge24Title = "c4727db07085e5e4e253972200cdc73a90c46db034073d0a218acecd7704b007"
	/// 夕飯時にフライの香りがすると、すぐ家に帰りたくなるよね～。
	case Challenge_Challenge25Description = "161f09bd7118653047877470eb6152314447b1fd406f788ab0c2da672b92fc0f"
	/// めちゃ映えフォト
	case Challenge_Challenge25Reward = "746b1bd969e24722aa155eadb17fc84a27ac71dc8f6bf4a0c28dbcc346a014cc"
	/// ヒラメが丘団地
	case Challenge_Challenge25Title = "a767e5f2ee29b6461e08729333636f3bd3fd7760ffe12f61225942963e6b0c4a"
	/// あ！新しいアゲ油売ってる！！
	case Challenge_Challenge26Description = "640f275e5104024a5a869b41f8a5c5ff1c6dc2b671c0e4a29fcd5bdaddb1d210"
	/// 拾ったステッカー
	case Challenge_Challenge26Reward = "80d79761fe2bb818ce21f81dff3bc6b08bc8bc10da553c90bfef50c0bd91928b"
	/// ザトウマーケット
	case Challenge_Challenge26Title = "27e691c0ddc6c9e214a3ea4477013621f53f6601e6bd738ee4617c86ecacfab3"
	/// こんなアガる要素しかない場所、アガり過ぎ注意報だよ～！ジュワワ～！！！
	case Challenge_Challenge27Description = "d703de600484ecc43502b326e72716b2d68d9655da554335363ead03452f46ec"
	/// めちゃ映えフォト
	case Challenge_Challenge27Reward = "83bef88bb0372026e35c3d973d7bc534b82ae6949490234cb722c79af394e9ff"
	/// マヒマヒリゾート＆スパ
	case Challenge_Challenge27Title = "76c5921917d14d3469024af06c16f3f01ef303b66c8dcb3ab470e4e7852bb367"
	/// ジェットコースターに乗った後って、ナゼか身軽に感じるんだよね～。
	case Challenge_Challenge28Description = "5c8cbf95cef72f853cb72c057bf8c33775c5e8a0674c9fa80499d77b201c4064"
	/// グラフィティ壁紙
	case Challenge_Challenge28Reward = "45270d0d68def01a32a5f504f24150322714c1478db491bc3324698caec32920"
	/// スメーシーワールド
	case Challenge_Challenge28Title = "8708f2c9badc6ddc9bcc7bd530cce613db5cbe0d376641cff5f6549acf8b7863"
	/// ハイカラ地方にもサクサク稼げるバイトがあるんだね～！って、ココどこ～？
	case Challenge_Challenge29Description = "d33114d5b4765567072dc6965283bee6ea0713cfa68e5d370ca97d2b15a4b6ab"
	/// めちゃたそがれフォト
	case Challenge_Challenge29Reward = "3f215868c8f9218f28edcfaefd8dbf7d0d4684d0a03d4ed11ece28a91febbd9f"
	/// 難破船ドン・ブラコ
	case Challenge_Challenge29Title = "0005c13badd6e553a0fefe2e35612bf404fbf358aa9bbdbe46071e34ee45f143"
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
	/// 「チャレンジャー・ロブ」としての次の目的地は『ハイカラ地方』に決めたよ～。<br />ってわけで、この旅を引き続き支援してくれるサポーターをパリッと募集するよ！<br />ハイカラ地方は、僕が旅を始める前に住んでた街もあるんだけど、いまもハイカラな香りたっぷりのツヤツヤアゲアゲな場所なんだよね～。<br />そういった思い出の場所を巡りながら、「過去の自分」も見つめ直して「いまの自分」を更にアゲ直したいんだよね！<br />この「二度アゲの旅」、ガチでホットっしょ？！ってことでヨロシク～！
	case Challenge_Journey2Description = "b1662b37fccdf6c7c4db8365db8aea9a57b70cd5d0dbc6d74e4a28d38218a70d"
	/// キミのおかげで、二度アゲの旅もカリッと終えられたよ！アリガト～！<br />お礼にコレ、アゲちゃうよ！<br />ロビー端末に送っておいたから受け取ってね～。
	case Challenge_Journey2Gratitude = "560d08121f0ea3608adf4f835fae8c257546453d0474914feaaea43f7bf774bb"
	/// 旅の途中<br />～どの道を塗るかより、塗った道をどう進むか～
	case Challenge_Journey2Title = "e51eb3bd85e9454f343c728471321e877bfa75e77ab7162795e983aa21bd74f4"
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
	/// { 0 }%
	case Common = "309955e00850b8afeb148450c7208585a85f8b652d5c625c777726f44837f69c"
	/// キャンセル
	case Common_Cancel = "dc982f1cb12e7f0a1cc73d9d414c3c62bf0d65e9003622e38e1788809762aa7d"
	/// ガチアサリ
	case Common_ClamBlitz = "ab3dd376051b175e0288535e904b147ee2a8fe4ff62ad02798d8c643b82b920a"
	/// 閉じる
	case Common_Close = "194798a449260d31cae468c90d48cefa382ec1bee6271b60bf572cc5bd367e6e"
	/// : 
	case Common_ColonRule = "7736c1bca0b9225541312685b13fc235c88eb59f011307c5d2b1491fcada1804"
	/// ビッグラン
	case Common_CoopBigRun = "ad2043c403722dd9a407ae67237c8473ba14a1dff11cd96a71e6635b8068c9bc"
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
	/// トリカラマッチ
	case Common_TricolorMatch = "cad84d342b626e377b667664602f045b98bd34911231ebe325cad4f59324c6d5"
	/// ナワバリバトル
	case Common_TurfWar = "d56bb2cec41f8e51fea6baf198a44fcd2c86a8aed103a77ec827bc13654b9c16"
	/// 出現数
	case CoopHistory_Available = "7e4a503564b4a9f23515a4cbd518a89da4ebb2647a45f8d4abaa03564453c2ac"
	/// 出現したオカシラシャケ
	case CoopHistory_AvailableBoss = "e4af6a135c415dbfcbf3a5c471f1db0665928ca0eb69750e0f1c3e69351d7ea2"
	/// 平均クリアWAVE数
	case CoopHistory_AverageClearWaves = "f26e723e3d12c84d1e76236dd5397f6aeee7f24fb9cb60b719d80289007f061e"
	/// ビッグラン
	case CoopHistory_Bigrun = "be44fce78caaa899a9cb21328bc7c6fa9d1a20ff38e217a1269bca8f1ef189db"
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
	/// WAVE 1
	case CoopHistory_Wave1 = "9fee890ae2d6bb7f916691c0f4cdd948fb2539fe77d57945700aacb53735aca1"
	/// WAVE 2
	case CoopHistory_Wave2 = "f979e54cad66243f388c4b899141cfeb168b7d602f7404e3b00593bcbdae7824"
	/// WAVE 3
	case CoopHistory_Wave3 = "c76dc4e8e2a4cb85a80e776484b7d48339b8b2620bffff9ff509b356994f5164"
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
	/// { 0 }%
	case FesRecord = "e11d11645a075d5c06663ac5703cbda2e0415d8ceb31c0f60d6a5d2cf51917b0"
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
	/// こうけん度 トリカラマッチ
	case FesRecord_ContributionTricolor = "5b53120d711083de3afe9af4af2eb001664aa809ff19ad6fd9070ecc4e6fb1a9"
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
	/// <em>ビッグラン</em>警報発令！シャケの接近に注意！
	case Footer_BigrunAnnouncement = "00fb40cd2560e50922a6bce110c1b02d794adea29f3b2e1f75003a32b8432d67"
	/// <em>ビッグラン</em>発生中！シャケから街を守れ！
	case Footer_BigrunNowOpening = "d78c59728ebdea5bd6371e81416144c6d775562d4f4a278667995c4e0c4c3c29"
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
	/// 推定順位
	case History_EstimatedRanking = "9f762b45d39f06720dfd745baddf7c49a3246898cc31ea52fb4f606394f8feb8"
	/// もっともよく使ったブキ
	case History_FrequentlyUsedWeapon = "33be67a6de9fcb6dfb7ceef6ec422d88f406305e72fa3dcb013bca8deac440e3"
	/// 最高ウデマエ
	case History_HighestUdemae = "8ae83a282c86ef1bf846d2e3009ada60853fea49efd29f98b2343d9fa079b2d3"
	/// 最高Xランキング・最高Xパワー
	case History_HighestXranking = "28be94cb1135fc93701cee21647303749de1aadf2f162bf916ddf7179aac7cde"
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
	/// { 0 }<small>位</small>
	case History_Ranking = "b7ddc8f53317c370e3a029cc4007aed139e394be3298f99b31661258aaae1f63"
	/// シーズン
	case History_Season = "88478c17f8793593edbaf37885e298a7f2705b71d1387ab85a37e642e15e4bca"
	/// すべてのバッジを見る
	case History_ShowAllBadges = "c6a7c130a2d27e3773d9e2cfe6149b0ecc77a5d36ba5180d3d39022554b1d382"
	/// 表示を減らす
	case History_ShowLess = "2b761bd2b058055e2fd44ffdd382795033e24c2d6eb22554b95b92c6703e541c"
	/// もっと見る
	case History_ShowMore = "496ee6a57c9e57bc0acea170f6e9eeb2a7789ff9a069b2ca146d79b274059ba2"
	/// Xランキングを見る
	case History_ShowXranking = "e57dc39c6c7219de45a7b6684c47c5854042145d818db0df95fecc31d90caffe"
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
	/// Xマッチ
	case History_Xmatch = "f3c158521bb0712bf5d704481aae41a7a09963ae51936893ea86dda428e1c69c"
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
	/// ビッグラン接近中！
	case StageSchedule_NoticeBigrun = "354c85e49263e617f5170203218d4efbdce290b0601481a84484289a8720ec2e"
	/// 期間限定バイト開催予告！
	case StageSchedule_NoticeLimited = "7796a5b645e835309eed8211584cde901cc792c671153ed551d05cea422a0898"
	/// フェスマッチ開催中！
	case StageSchedule_NowClosed = "53387853b53c8884f9a3e3994170ada076c9e4d33e713f75807b97bbf5b5f9a8"
	/// オープン！
	case StageSchedule_Open = "94c40ccbbd87eda3b9d0de5efc8028015b7eb9a44b2d6ecb136793754586d073"
	/// ビッグラン発生中！
	case StageSchedule_OpenBigrun = "5e129780c4791eed9fc99d6ca79bebbab47f82447fa676323632f0525b97b5e8"
	/// 期間限定バイト開催中！
	case StageSchedule_OpenLimited = "61e69e829b077095634c735f8f25431459b460ad855183b9e866892833977db4"
	/// プライベートマッチ
	case StageSchedule_Private = "770948cc44ea0d73c2a649d9441551932b3919393d5f347f410bb9f81d612883"
	/// ビッグランがやってくる！！バイト大募集 { 0 }
	case StageSchedule_Recruit = "e457bc446e327c9f5bbe2f4306f2228466f236b524f939669bc3b02a14d5bef8"
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
	/// { 0 }人の { 1 } パワー 推定 { 2 }
	case VSHistory_EstimatedRoomPower = "f7a58dfc5dce24125748d61062b2772e411f3aa7b4d70802612456b42ee23596"
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
	/// Xパワー計測中
	case VSHistory_Measurement = "246eb5adc5115124683d6eb50f2eb72c1cee73aa8abfa3b36a13247534dbe2f7"
	/// 次のバトル
	case VSHistory_NextBattle = "983efa5094f5f16b194c76aa462dd2dceb5f0b57247e086794c56616b98d5ce9"
	/// バトルのきろくがありません
	case VSHistory_NoData = "7947f7e1b1fc89fdbd2caf1e7acd4d4affd35b542821da9feca0dc876618ea48"
	/// バトルのきろくを表示できません
	case VSHistory_NotAvailable = "7975246140d003c121a0de9b681d638508cf29219527d7bcf1b362d2746a8daf"
	/// 閲覧できるバトルのきろくは、モードごとに最新の50戦までです。
	case VSHistory_NotAvailableDescription = "49102643b4364bdc31c8ecc73feb752a4dcbef03e382c67344b96beec9d1a9de"
	/// （おそろいボーナス x{ 0 }）
	case VSHistory_OutfitBonus = "887f3673ecf72ade3035b7933cb9aa943219a921a6e3022d4c01a02507655d6e"
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
	/// 挑戦中止
	case VSHistory_UdemaeReset = "6c0f553dbfcafd883551da4c8c64dd134a3a71b1d4893190d001e5988647eb8f"
	/// ウデマエアップ！
	case VSHistory_UdemaeUp = "c5a04c6c1bdb81c29c5365ee2611b758b7de5cd547dc18c27c1e34d2100be5ef"
	/// WIN!
	case VSHistory_Win = "a2f6a907beb844b206f0faaf126a46d89b57ab729a2c36c2eadc097b693afeb2"
	/// 勝敗数について
	case VSHistory_WinMeterGuide = "fee51d1d05dee211c7a8f9755956ddf21dc66cbbb673e8960ff6e277f82b8c93"
	/// { 0 }連勝
	case VSHistory_Wins = "82d0b66d23e71b707df04d359942a295c875b09954efd0b7d3036ecd9fa399cb"
	/// おうかん
	case VSHistory_Xcrown = "2ed41d87c90bfa1c6fc302022b563d5f8bf16b6f130bfe04a12666a9566586e2"
	/// Xマッチ
	case VSHistory_Xmatch = "db6e760ce021cbf01d2b2af0622fe36e7ce159813729ce0be9a4141cd663b91f"
	/// Xパワー { 0 }
	case VSHistory_Xpower = "6725bbd5521daed0aea6e78bbb0a94be60a353be27c75ce4b405937212eb482c"
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
	/// すべて表示
	case XRanking_All = "108a270a7ea1532cbee7cb22f5100bd0fed5c2d9047d6bb9638c2df02331de7d"
	/// Xランキング
	case XRanking_AppName = "f67402d45003f8a73a909d2b8c4eb6b697e1e579512d23b63860fc868ac8f8ab"
	/// グループ・アロメ
	case XRanking_Atlantic = "d554c59d8f5e639a2da276e9a9fb431b22369039608e450eb7078b81c1d24e4e"
	/// 推定{ 0 }位
	case XRanking_EstimatedRank = "d2019b64d564b7bd8598b0369cfdabd03536bf96bdbdafcb62af0fe6dc21d6f8"
	/// 計測中
	case XRanking_Measurement = "8f108d92036ede9dc96fe14abf4f6b971aacd4d1f3751e40d132e72045206e03"
	/// 開催中！！
	case XRanking_Open = "e872ea8c34a157481e7ad5fa5194d49021b88b8a1959e97a292e892dfe2e22ca"
	/// グループ・ヤコ
	case XRanking_Pacific = "40cffafbcd041c642c261c9d4259b6adba995cb8d22d2ad9cd761ad6362f8b09"
	/// 過去のランキング
	case XRanking_PastRankings = "d93b09867f866ea8b934b2c6851011aacd0deaadaa83f0f836450e14a9652fb5"
	/// { 0 } - { 1 }
	case XRanking_Period = "1b9fef59e0774d07828d956fa30e503158f9511b5be8a292f943773e5cb6373e"
	/// { 0 }<small>位</small>
	case XRanking_Rank = "6c9d28c93c2cdf7718198c8772e17066c1930cd1ac6ecb645ae1cf2728ec27dd"
	/// グループ
	case XRanking_Region = "e4f6e8191c589b7f352dfd0f704f2af46f36bfed8d3d7e6b31643116a2dea051"
	/// ランキングを見る
	case XRanking_SeeRanking = "8d35a1562990005e4e5c08f78c26a71a6b6e7e6bcf1966e6432050c17a563636"
	/// ブキトップを見る
	case XRanking_SeeWeaponTop = "cd782e5cfbdba510ba8eceaecec5ee6a743e17eea82e27ae4925bea139287a09"
	/// ブキを選ぶ
	case XRanking_SelectWeapon = "2dd5860d0f646daeb6c9b7b7b74406df9caecb2b23adb2fef91009d380787ef3"
	/// Xランキング
	case XRanking_Title = "4b2f052902d83c96e45922047e4a065fa509ebba026c2d8a5a1a78183fd7e107"
	/// トップ 500
	case XRanking_Top500 = "93ed7413501a7b60670168f20c728d4503e4917a95a0ebf862a2f4e20c2b803f"
	/// トッププレイヤー
	case XRanking_TopPlayers = "def0451fc831c43db70fd463504f5269113bd67808bb53dfbf609323a0e55f51"
	/// ブキトップ プレイヤー
	case XRanking_WeaponTop = "4aa907af052fceb0fb9e7bc06df23959b425fe3e135c61fe414ba67f7754651b"
	/// ブキトップ プレイヤー
	case XRanking_WeaponTopSingular = "e6d6b1b10ff3a61eab22a33a9c62347649fa520e9d6913d4b0fff3de8e34f540"
	/// おうかん
	case XRanking_Xcrown = "72f6e32e0341165cb9efc7239a72a4089bf2b4c165188f0485d856efbb6fcce2"
	/// <small>Xパワー</small> { 0 }
	case XRanking_Xpower = "f2c1f13dcc6e78013b42ef07eab51de9d321092dada3931caa25d8394e31215c"
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
	/// ラッシュ
	case CoopHistory_EventWave1 = "fd468293bf7ee52c7b0ac1a2cdc3c14f0024817c58e96e82bd4b6411f9119d66"
	/// キンシャケ探し
	case CoopHistory_EventWave2 = "a1c78221f5339e43241429febb44cabb6eac59c8e38ec568fb32e814b6fe3259"
	/// グリル発進
	case CoopHistory_EventWave3 = "447b1afa07c561e899df7e81aca5d25024c25642f43008d8e3869e9485b0f2e9"
	/// ハコビヤ襲来
	case CoopHistory_EventWave4 = "b5e5277056e51eef9abed19e58ba66156264b6bbed638e62f6e89050121f6ea4"
	/// 霧
	case CoopHistory_EventWave5 = "19b470fc944350da2f71dcd7dc939efa5441fb812bb435fb7c908ebe78ced1fb"
	/// ドスコイ大量発生
	case CoopHistory_EventWave6 = "02338462199c4ada0ba7ca86097da98b6ffc138e6a4a54f521ed351259d8adad"
	/// 巨大タツマキ
	case CoopHistory_EventWave7 = "3657f12385cd1cde2c9ce89144e2b5369cdea5bedc47ec602bda08e626ee9e7b"
	/// ドロシャケ噴出
	case CoopHistory_EventWave8 = "83112387a9106ecf254ca291f831fbbf5925f9712387449de2d8ca75796b6e7c"
	/// ヨコヅナ
	case CoopHistory_KingSakelien3 = "9bc1c1d0341a2049db2ae54546b7335074dda0d2ea88f32c1499771850b7a904"
}