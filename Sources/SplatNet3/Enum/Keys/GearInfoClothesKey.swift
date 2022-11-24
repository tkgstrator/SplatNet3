//
//  GearInfoClothesKey.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum GearInfoClothesKey: String, CaseIterable, Identifiable, Codable {
	public var id: String { rawValue }
	case Clt_AMB000 = "45e0fe8467c62a00bab95d387af5730c51eb6a857ada7aee7cf676287b1c81da"
	case Clt_AMB001 = "96e31e8c3c16548bfa55e357c18d885e13b8dc737a0cb8d3870bca917b183139"
	case Clt_AMB002 = "53074eb0a77d3b6c45a928c28ca2c35934ccc1045283f5544f9299e2a2028c54"
	case Clt_AMB003 = "227c84f5561eaee85424a89feb459a6ffdc49b302be1fc8d02446093912deb3d"
	case Clt_AMB004 = "e2dadef47a7b566856402c49ad39726180bdf38a1d0aec7d5776680070470434"
	case Clt_AMB005 = "2d7a41126d3bea01f62e1c60f4e4765e0fc3587b66ef8b0b86e7e13c7453b4b3"
	case Clt_AMB006 = "8454df9b04640bdb36dad23bf6e5c989b26fd9353f533d616c07bf91add63124"
	case Clt_AMB007 = "b1b68b3dccc7ac625cc71d45bf69c6886953856943264c661850757b8c12abaa"
	case Clt_AMB008 = "ae6894e4a69e35e5912bec148a905280dc761b27c2bf94d172cc746cfc19ac2f"
	case Clt_AMB009 = "4f197066cca6daaef8b6b1f351fdb2b13870492f7b00cc106b19276ec4cd6a77"
	case Clt_AMB010 = "0ed8005d3e737d74cea1a913f6523fcce8980461a0facddbb89bdcbb925bb74b"
	case Clt_AMB011 = "5c83c00b70a8f8c7235b3fdb4923188d05b5a931707b805fdf99e11520f9ac08"
	case Clt_AMB012 = "556b5dc156118e2f53c8d2df3f918706728428a8cc9d95501691f1aa3542ab4a"
	case Clt_AMB013 = "c05dd01a3d24fc7f97980a177914477148a1780fd4a65f3b5a01062b8b1441dc"
	case Clt_AMB014 = "d5fccd7f4ed6eb8df40d2d57dc348a4935e5a234c30ba6f43e00ac2b4905da39"
	case Clt_AMB015 = "76c1740f606ad8041d565e7c87dcc0312cd576ad32f98768ed32a624bd23f6fa"
	case Clt_AMB017 = "86ad73541c6d90ba58e384184f02f71cc856e2b39098cd6b0dc7cba01853c4ce"
	case Clt_COP001 = "80c5fe2a622eef647d4cd2e717a9ef660b5c42654aff3378517535738bf0fbe1"
	case Clt_COP002 = "8f03e316abab27e5402aad8c182d86a9430292c55366e74372652b34b6f812a5"
	case Clt_COP003 = "2dfd25a793dd6ca2a219b9ab25d19c9aed7c06b325b75fa1167f82e46a2a769e"
	case Clt_COP004 = "df5f02ec40eceb9f40643331a60208d266c8d25fa4f24c5732318af15ff630b9"
	case Clt_COP005 = "4f0d6afb58885d7a4692b33dbae5d2ed8d699623d1e8c39c5dd1cb401684eddf"
	case Clt_COP006 = "1399aa9223483fe44dd6b81fd759fc295a1c44febcf80af227fa010448c5070d"
	case Clt_COP007 = "f842738e2a003cda0304b53d820b1a94af8fd136a50147b8fd3f5d1b028ceb99"
	case Clt_HAP001 = "07f22915f02685c3cbc043929d8b823bf7ab68588147635fc5e1407fc0c43f5f"
	case Clt_JKT000 = "9a5befa120274f86a7eb5539a90087d3a5e70382a13e099c0c699a33859fb925"
	case Clt_JKT001 = "2bd6b16e0f4b00c2fa3470e35342137a8cc420df03ffc9ee9ff4eea94faac06f"
	case Clt_JKT006 = "a7bc7d902c2d27cadbb9a3d898a7e714ece83e8087b38613344525cf58d8dd83"
	case Clt_JKT014 = "6fa1e212abbd8373d6a82db7bf53553d09be972a35f76bb6bf63f5aafdd30cb7"
	case Clt_JKT015 = "2fe15f0da4249acda4e69a7014bdb2da940e1474f7b08d57b06f5345ab2c49dd"
	case Clt_JKT019 = "6502f678672a3f6f68efd584c66cfca7dfbb1c3d8637801ea3f7a48bca6cc314"
	case Clt_JKT023 = "ed14f60eafe2f6e0228ebda95334596141d961aa0bf84be672c6615a3dbfeea3"
	case Clt_JKT045 = "730cf0fbcaf569bba2a79d30782fdcf01107a8ac452ea345dac1f2860133292f"
	case Clt_JKT046 = "da74100112e501d10d2c4fc3e2d78f0239958945d460f3ad2b78b191b78b6e56"
	case Clt_JKT047 = "ed22b4e199802fab7cb03bbb5b4798c97ef6d59adf85c1aeaea2fa6a5c874274"
	case Clt_JKT048 = "bf21d448849c4f65d817b4abd99c450436f1f2a0ea2200273ec5f9a7bec8dd7b"
	case Clt_JKT049 = "9bc94aba3143acb46b0865963b4f17331d4d3e1f8f3691145256b412d83e47a3"
	case Clt_JKT050 = "35060ee180c37b38c326e2052f91c741142d5f7dfd007cca998e79110f982340"
	case Clt_JKT051 = "cb1f8bd4b00fea8093c01f2d68700b18dd52dc536b4fc8bb2152016aced49b62"
	case Clt_JKT054 = "74b3b7e93ea6313597330644a9cb1db742d79b7142675cfc764c506bb9476d97"
	case Clt_MSN000 = "630401edac85eee48c367506467a5e20426449f0c107a95317d65b576e6513df"
	case Clt_MSN004 = "8fe4db1aed785b06e4077dc2393ce5b3e581fbaa290d2ffb0a377abcf8439faf"
	case Clt_MSN110 = "ce6e698bb12d041daf8f260e7b20784ca35915a8504b2e39bb7e9a1edbfeef23"
	case Clt_MSN200 = "4e687b314074255032c136d7a2f7a302341040a44e2017a54d165490b239cdb9"
	case Clt_MSN301 = "e7fbc65ddcb6237b8e99c621d1ad8ef2191df585971fc3a83d480afa7e136aef"
	case Clt_MSN302 = "aa574bf63b0efcfc4825f19a9ceeb85288675ff8d96534ec73f15c33256e496c"
	case Clt_MSN303 = "fe13245a6275b649bed4217ed5ab8b7311851981e86b380c044406afc693ee40"
	case Clt_MSN304 = "b541fcfc183aa3c3c060073d5cb8b019d86794861d48ee5ddb54cafd47a399f4"
	case Clt_MSN305 = "e0eed73a58ac472beb06bb20d37833e9ba0373e2a78f892c1f0d81a6c59346b6"
	case Clt_MSN306 = "dae43e544ec63b37f9ef2ff9906fcf2d6612f52fb697d9d09a222544252315a3"
	case Clt_MSN310 = "fda1b049a14da44fa480a7698097b26f8e6ec9c643c45b4bb21a883edbb7c3fc"
	case Clt_PLO004 = "3518171a2249d21477fc492e5fc1662677530d7640a2af3d190b2a6f6168555d"
	case Clt_PLO005 = "6a6b93519f21b5b779cd30af9cabf51442c2ad212b9e0c5fcce90f3885e7879b"
	case Clt_PLO009 = "6bc4e669c906902d7e0da0168d61018b7c3e4ff65baa659c07f20c5077dd2087"
	case Clt_PLO010 = "faa679a1cb88dc61aa739be96d65846bd51fda65717b0a0c92b6113c070a16d2"
	case Clt_PRK006 = "bf49beaeb35763d669e2795156c31bd94e9fa370bb077d684dc1d1715a15abd3"
	case Clt_PRK012 = "103a7507b3b0974a2f26f17a04d5e4937bb23f3415448b91c1f287c057ffad7f"
	case Clt_PRK014 = "8c7a2129e859dc03b8f05ea5438aa37d6a5de22f51425649abde424c8fb8279b"
	case Clt_SHT000 = "194ca8cacc7090ac1ec01cad49a61b8a200a779302e67e8ccf7452150266cd33"
	case Clt_SHT003 = "fac02231b31235d9287d08a499841270a5b866af3d157763de0e00419562bcfd"
	case Clt_SHT005 = "61f64c9f48e9734c48d0d01ba205f28d2088cade70ad93c9040819fec4f9c188"
	case Clt_SHT012 = "3545c1a42f704ffc74a53cda8cbe61ee7af85b569548adea028341648ac025e0"
	case Clt_SHT017 = "0c18ac7e6ebb86916e224aae0bf2ffe14a831a371779188f080dd34274f81608"
	case Clt_SHT018 = "a568a20bc9defc7f2351e462bc07ef8a1c89cf9f5b90eecd23c62e5ec3d527da"
	case Clt_SHT019 = "43efa5a3c67752f16e8486452e1d5d2b01e43dafe0933a14cb14d1bb0e5c95b9"
	case Clt_SHT020 = "b62dc62f72a0a24985789a5c7da9f0fa90d38d54e91e43e7d2f2c15bc5c7960b"
	case Clt_SHT024 = "745e305e66890b70175e828840cb940cb5bfc22462568b9bb471107ee45d5cb2"
	case Clt_SHT025 = "57188ba8bc19032326056111aeee9daab3082a20dcaabb5e31eb94fb0dee7c97"
	case Clt_SHT030 = "5f65c78eab41d2b44e4919e147bdf0e385e27f8557762c2e397e5ee6d0568c0a"
	case Clt_SHT031 = "ef1c2f3b976e43d4975c4fd116b7bbb6615b8715af6d9fbddfb77f50a964d2ea"
	case Clt_SHT033 = "4c8919c44c7e7f89f7a08b1924e82c6f929dec8b7875af23d1c0eeb54e55d5d9"
	case Clt_SHT034 = "b0a6a1b99d383f8dfc93dab52127aa98228e53fcd8761f81f252a764d6c8f297"
	case Clt_SHT036 = "57ffe463b66ae5604d991e955f66d98f35b82b8dbf8bddfb97c88ce0ff3e3c2c"
	case Clt_SHT040 = "7ccef556f7e83b3e8df0323d6377f154e22bcecf71fd1c94cd24a805d1e8ceec"
	case Clt_SWT001 = "04621782e7e530d0426ad24139006b91aca45f3e60221a35005c6b8e22744cf1"
	case Clt_SWT010 = "85d50ca137b6f3445c1059c69476c344dc5b11974127bce604a311b8573f0b5d"
	case Clt_SWT016 = "1e9ac0e2afd80c98bdf693df5fe485580c9d46af2fe726d265bc7a9a5e855cab"
	case Clt_SWT017 = "e88b6e19ed179885925c4fec57041b8e76dba575dbad857db3752ad6cb7123ed"
	case Clt_SWT018 = "d462793d7e90d5e60f605601546ec1e12573e3d3a30f5d2249d0c4734833feef"
	case Clt_TEL004 = "8919717e902d219e78e20cb08a56de015b63532720d9bc2e845466621d0eb265"
	case Clt_TES000 = "f74a97fb4335b6a7ed0c7eb12e4cd07b5a189eb0d42a41008183af096b4afc31"
	case Clt_TES001 = "d5916b4916b3c9d21d76f64c11c3a65bfc37c9871abb46da0b2aae9ade7b57cb"
	case Clt_TES004 = "d248eeac8cc9dd8e9a5f249c69905e3a7063795e5478095ed5859a4372c7f501"
	case Clt_TES005 = "d0c4680c8f6ec8cd0ce9577da6074cb7349e813e37e49136e97c1fc59908fa30"
	case Clt_TES006 = "a5483854ac79c485a9969bad68631c332cfa73d0e5a9f05c74e8afc3d4cdd7cf"
	case Clt_TES013 = "dcf7d5495ecd110d963eaaad94c85f48176e5032d08424c25eab6c0050bbd9dc"
	case Clt_TES014 = "d7444942028a869d302476a7c92cd2dffca41486a39ee40b3dce0a5850a150c4"
	case Clt_TES015 = "51ea4d01a7c479c7e78619227067cf18f08b4871c17c3b24671881964a56d73f"
	case Clt_TES016 = "6456162f608e445ba0914da7b91ffb505b8dad103375384e7f20449d719eaac1"
	case Clt_TES018 = "7dec56c0cf8d0d86419cc98a50d11ad796e9ea5b9d4ac40600915d53d161b1b5"
	case Clt_TES019 = "a9c8774bf777dda1ec8cdecbbd82ca5465a158fddff350e44edfd7eee6317f44"
	case Clt_TES020 = "0ebc7b54299e1f269f6581ed0783e76249e69b542dbb33ac1e23773e4472c5c8"
	case Clt_TES021 = "b5d92a7811644e6096cde8bef58509cdc192903d66e756cf7069e5cc07fa0bd5"
	case Clt_TES030 = "3828b051c6caa440485ab83b4df3ad236f24699f41e08071953a7d4c8da4d621"
	case Clt_TES035 = "f932b065ab915dd0d3c556f7e0c0b88be1e7b5133bcd2dd9c7890eee3cdc2a01"
	case Clt_TES063 = "95e3566019022d54ebb764b7d9221721465937c21217a3aa2e33667c3a9e532a"
	case Clt_TES064 = "1b2ac6fae1f884a5ebcc459b30f2faf9a95d4eacb5869b1d3aafe6a32bb5cb84"
	case Clt_TES066 = "b0d33c29c814f9d6c21a8d821e3063154acabcfdf5b2cb33000da9080d843660"
	case Clt_TES067 = "9595fffd2e1c4d80ee0ebdea74987ac561a2f9804419fbcd25f64408b0186a28"
	case Clt_TES069 = "9b7eaa7a9e3b8bf0d2ca9be1dc28fec0763bf45f16ec5377b91bf8e85ba52ce0"
	case Clt_TES070 = "297b2362ea85cf0ab7a3aabe2c2643139c66827ff74d000a346204c6eacfba62"
	case Clt_TES071 = "ef70c91fe43b4ccc9e129cd5fa31c6cd76f391e652570ed6a1d91c9452c71890"
	case Clt_TES072 = "b0744ee33f5ca70fdaddae3b506777104a69417f890feee64d683875c5c3700b"
	case Clt_TES073 = "76c0d1fa3f9b95befd8baa75d983d2f7b920ba673ada15325e345dc337335914"
	case Clt_TES074 = "07801ef4d545081e16d4cb03920d1e1792fdc8fd3ad5511a12bdb8bbdbbb5c1a"
	case Clt_TES075 = "83b4127e479dc98755a9a715839c65a0aeb682ba72fffa26e3166c49da234fd4"
	case Clt_TES076 = "bcfb78c37e8dcc642bd578bd1ca2a5bebf68ee2586f94598380792c206e1429d"
	case Clt_TES077 = "203f2d96ae136516a9976a832a761599c30038d0af777a42ad15c46cc3e35a16"
	case Clt_TES082 = "e25c645ab498be34a9ddbf64cf21746f3493dd178223d8ec59893df82c3a4f62"
	case Clt_TES083 = "f878d1f7b82a4568f397425f6a72674d7ab842206c7c85d61c92ec182dfe8395"
	case Clt_TES084 = "0559e5c118a161ec5474f72cd521fb43957c9c9c559f3f2d70c667c4fbaaed34"
	case Clt_TES085 = "981b0984e92b5de13a12f8fe8d2edef120151b97178a5efc6a988cf033387245"
	case Clt_TES088 = "86476d2ba710aded235e44dcc0ea9b264389c7b2b939e332c8e962b19aa5c71b"
	case Clt_TES090 = "48e54370dd9a97f01c039e2d94a25d6b91f6e0203996b3e13833be075b079350"
	case Clt_TES091 = "9f454053136363353273de44cae283a68e10f77504a4fe671a9a9e6e56f8a9a4"
	case Clt_TLY000 = "4bb2d9ef221ebfcc63f7b13751dd2cc4a31eaaf1b3b99f30eed814673a0e5d46"
	case Clt_TLY001 = "df3c215c16aaf23e7c30347a7c8d93e110fa9827e1b4fbc882bef83aa2e0c202"
	case Clt_TLY004 = "0dea2bf5d28210a5ec8d93b9553607f2a94f92b7bd686d1eebc72f9c73b87556"
	case Clt_TLY006 = "d459c16ed3e12dd3e3427bc651cc5ca05f0e7f60849b61c40c44b20dcce9646f"
	case Clt_TLY008 = "b4021bdebee21dde1e5bb23f2f0208ad1a4376674b96569bf9556f444f6ed1e0"
	case Clt_TLY009 = "b0e4641609d0ea08cd656035a8374bfc387e521b56daae80d61e30445f04eeb9"
	case Clt_TNK000 = "efa3340a6636ec8aec69c6c50e1a01ef4669e0544c8297ff14c2d95d59eb76d9"
	case Clt_TNK003 = "a232a2d6a9a33a927e0777ff5bda93a06a0ec193e768d69f8736e9f3dbec23dc"
	case Clt_TNK008 = "8dacde5f302bb51618fb4fce6b6841f97bc203dbcce94bd07a03b8b8da73852d"
	case Clt_VST010 = "ab73195e3c0ecf0dd3b65464afd627b1ee3ef1bf39624cc4c5a5157bcb9bfa88"
	case Clt_VST011 = "e6999f7c8420f34adef9ff692cccfaf84ba92435b167865b918580b418490c10"
	case Clt_VST012 = "26f54b493c09cdcf2b58c4f259a484d82457178395648ce282efbc7df1a1078c"
	case Clt_VST013 = "c218428aced65b2b211c2c6c04dc2fcd90f911b65b6d38a2259a0a3b2a5ba6fa"
}