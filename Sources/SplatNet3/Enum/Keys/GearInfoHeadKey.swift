//
//  GearInfoHeadKey.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum GearInfoHeadKey: String, CaseIterable, Identifiable, Codable {
	public var id: String { rawValue }
	case Hed_AMB000 = "6d6fdc948eb553ee1b8b76c3f2e7a3e4af5232c0bc8ab756efcde4f11ed350e4"
	case Hed_AMB001 = "09e36863c4b1ecd7f0c04be923c5eac657705a4566f1604d4f17df6813532f74"
	case Hed_AMB002 = "38b7b16aedd2c4bad86b8a2206e6c4e433d6bf083fb9671a4eef096e192a5ae3"
	case Hed_AMB003 = "12025f1bbba16d7bb2677b912d4ab47d1f37e5419f66d6648cf72df84d9470dc"
	case Hed_AMB004 = "24ea268c65f9c30a9cd19ecad8d5a35a40668778e9ed2b4d3a52f1d1c49a86e6"
	case Hed_AMB005 = "5fbee9d8abc5f459564a9c23514b6829011531e928303cd5dc580e3f03073660"
	case Hed_AMB006 = "6586d49d969962d7429842fd6385ad0745c2562bec9cdac406262bfdbffd51a4"
	case Hed_AMB007 = "c0acc85a470c012afb88737407ef40b3273380bf83c85375ee9cd1938d698794"
	case Hed_AMB008 = "238b0c04d971e49c420f69814be194a775a7f4d3eea8d466c6ac32cd9ee503da"
	case Hed_AMB009 = "c80da2a984dd60904ab9c6a5d45b33ea45accbac7c93d19c87618ff5f87f7c4b"
	case Hed_AMB010 = "5b1883579fd524722a73fc5f2edb2278ebee758be6a1b0aead74f8358848bf9e"
	case Hed_AMB011 = "55c38cc89bc4ea2b0646f5eb3005a4cb750975d089012e390f60e08539aab530"
	case Hed_AMB012 = "69ca40ebacafcfe068e885ff0baee6d3a508b85939a116f5dcf77ddaf634a576"
	case Hed_AMB013 = "8f9036e4a17272aa7e645c0c9a4d35276825a39668d208ac4cf025e0637fcc29"
	case Hed_AMB016 = "11c08d51a1a0e7346cee353ac01b3b1a21426258253cda10a3cd99679605928b"
	case Hed_AMB017 = "1aa3ed6f5953fd914495716eebe3c1a5a900c8400ca2ca9f1121a610d05c571e"
	case Hed_CAP000 = "f397b6fc8da9b9e8bdb42b1559101a003e3fca3b4ed4233def5080262e922de1"
	case Hed_CAP002 = "437be7eb016cfeceaacf16059a1e6767eef01c6cf34f05685950c3c2a75cd320"
	case Hed_CAP003 = "39e024fcce1311b3cf297bd1c5dadb623e555db6ca32c86c601dc21a20048374"
	case Hed_CAP005 = "4ac702b9e22a053397b730cbf6314db7513cc0a1936c8e85c13e25b334a5c316"
	case Hed_CAP012 = "4cb7d62e6c10e7f2eeb6d28130c60bac375263f0f8e5a665753181f3a731cd33"
	case Hed_CAP020 = "7f1478a47b379a27ee46855925e9f7e451702a8e0b5fe469458526a5617f5fae"
	case Hed_CAP021 = "0abeb8725b916960610762ce530fb09a210fcf10fa58d1e0674402f2b4c51841"
	case Hed_CAP028 = "9121a06967442e44a1a6704632654cc6f099d3f7f274f45062ac32836fc6e484"
	case Hed_CAP036 = "bd1412ae26456c34eff53202c8238ea63b01f0c52b29d0947e6561107cae2414"
	case Hed_COP001 = "b2643db9a48948811b848d3932cacb3029b230ca8204b1f7eafab1b98d0eb7aa"
	case Hed_COP002 = "02e6b28993d5464030809d1eabac51b3275e9c23cd8e8965715bb7d939da046a"
	case Hed_COP003 = "5d5c911b5ebf8c4c46cc064c5af969895cf15a40c6c775315982c43d65af129f"
	case Hed_COP004 = "a276129a426b249bb62c6446f1a86446eb0d2fd81e8e4386f699e1e64de817c4"
	case Hed_COP005 = "c04758b6f7289dfcc4d77cb6c2a3e52aa2f7d15fb4f66cc375eb32daf4e7b76e"
	case Hed_COP006 = "02e08c0aa864281186afa87c771bf37097dab587e1ad3ed018233f562762130a"
	case Hed_COP007 = "25990d7e93b7d80110efc06125d15916a7ecb099cdf55c2aa2b5c904e79d6568"
	case Hed_COP110 = "3cc194f19795825e3b8f415db7c91eee8f2d7f2baacec66c6e7b966f8599e3b3"
	case Hed_COP111 = "a1a46259ea6e22f607a80e995e688c32bdacd2fc77991b35fa0dcdf394c4852e"
	case Hed_COP113 = "205627105988cbb1f31e504cbf0874e5b5fb8c933f40da11fc4c66c4a0223a05"
	case Hed_COP115 = "719633867c61527a3cc4f338eedaa734b5e028b3ead25c4bd1c846b03d608f2c"
	case Hed_EYE001 = "1a45ed82fc6e378cd428e4a1eece2fad82c314f102078e52e8783f9f84501fe1"
	case Hed_EYE002 = "40be323caaaa4b23dbf5ab6587a75bbdd5f7c7f2ccc23fe851e972878c681b4a"
	case Hed_EYE003 = "a9abdc3cfe2e435f67d4649a280e8c1280ba70fc68f3ba5e2a9efa0fe92178c7"
	case Hed_EYE007 = "605157b896e265ccde45f5e8f02c943c4c9c2bad75eed2428e297debb3593384"
	case Hed_EYE008 = "806f1535cb7359b64b1ea96d98f33eee5105f4094e2bd217ce4145b0db285902"
	case Hed_EYE009 = "332abe2aa860cea24a209113b366bf8651956080dbc678ef6937eea302f563ac"
	case Hed_EYE011 = "5969760f0e323abf35abc8cdc528673d6e82acc3d71547382649fa58dfa0f82b"
	case Hed_EYE012 = "61de748900252df1ee4da387ac6d2a5fdd8985d552ca09a75d1ce7e4896893f3"
	case Hed_EYE016 = "326bec857e9424242262d2a1952f32bcb9415458f26aaefe344cd8432bbc2b84"
	case Hed_EYE021 = "29d46db4a2125aa063203c6f5753ea72fcbf3602863d30023b5712dbb5e7e248"
	case Hed_EYE022 = "b29bab1e9bc764847c66e716052e8812a3908f5d8e6115beb963e9962c6a3307"
	case Hed_EYE023 = "b455e3e093659fb5ca0c57f2831dcffbac34a137acfc4ceb47503036da94531b"
	case Hed_EYE024 = "1b34d8f000527fdcecbf0d60df60f2fadd7de580c2cc4928dc3a7929aef33a06"
	case Hed_EYE025 = "f399da43b1ef4a20c6b9c7124490613aaec8c58a6dd38b8ad028d506c34f1725"
	case Hed_EYE026 = "4e2dd27d5c8c374375d05f6146c74c33c7ce19769ad2b3de9457f1d579272b72"
	case Hed_EYE027 = "c4a1f4df6fe6fb8a224db3e2286df1d34917b87327b70aa90abd9b48c1bb2306"
	case Hed_EYE029 = "d20c30de17f019379ffa18dc2ba7e6150b6c4c472dbfbf541d89a94ec4f2c902"
	case Hed_FST000 = "9970e78730016ca786353edf5de46e3f9c72f01ec1ac65bde2331f5b78eeb8c1"
	case Hed_HAT004 = "9e8980542e2198bd4b6b2874ad884627fb7458a66bb879bbf2f3d02be76cd3ef"
	case Hed_HAT006 = "6d9e951ff61e484c898bab641fe798c5ec2de9c4f0ac0767d685d048e600bc51"
	case Hed_HAT008 = "ab1b62fa9bf59570163ce3a36f59880025cc6256bdbf4f8da08631fd197d3e0a"
	case Hed_HAT015 = "667e08432fba4356e8102d01acc70f3d1591ceb9e122abfb90ab43dece3bb648"
	case Hed_HAT016 = "f4dfea6d1570eaab39e2717c265bee7745ef4551446dd21a95d6f6aef8a80d75"
	case Hed_HAT017 = "df7cb45196f3b0019c6804c3cab1239a78d6094db6bdaa5752001f53b72bb9fb"
	case Hed_HAT019 = "aaba2a6a3bfd94fcf71e70cbd2f19f927187c823ee73c6f2ad4bd79160563597"
	case Hed_HBD003 = "b0907544d34f3eac8506493ab163592ba44d5ee2afb45dac7751722f775455b2"
	case Hed_HBD007 = "2760099d2504f3383ec92fd976cc3e78d0223fd7ffa6bece622cbbf440166d1b"
	case Hed_HBD009 = "cbf94a703559e438bb602a61dc79b94090f32e3dc7187392d6d6507365d175ce"
	case Hed_HDP000 = "92cb13a626208575f304d18fc3398135de749d48ae52aaaa9d15acc6d6efeb11"
	case Hed_HDP001 = "d637de9cfe9d4d4d0b1296afecfd8c3ee591a752735c53b31913ff1355c4dee7"
	case Hed_HDP004 = "03dc2cdb4219dfad5b10d239c9858b85f97fb63ac104fec4709536cbd8579d28"
	case Hed_HDP007 = "c6a4b2a88cff7480b314bcda6aca9a640943f19b93b13325072a3383cba0eec9"
	case Hed_HDP008 = "42f588f0a936a08f1f3e6754c8d615f517579c974070e415697a907c5c079368"
	case Hed_INV000 = "b3908ae3208a1de5af32fc9c84ea5d42b4a5d964c5e26dbdb020502b7cce3575"
	case Hed_MET007 = "209f461a4b0d0440523c7fd6a1eab7517b3daba44beaa71a6fe81c003c543edf"
	case Hed_MET012 = "6429f49e379bb3bb5b53e18826ec4a674573ff750d6d207544a40e4ef5dbdbc2"
	case Hed_MET013 = "314058e86b8544391f024a0da6c276c926015156ee893094aef43fa6034b4a4a"
	case Hed_MET014 = "a7f88319920704c32079b9246bbbd1be236e456f6d780a8e23bef96e49db956f"
	case Hed_MSK005 = "9a5ca4a89dd2bcaabee3d25bb6f05296acd481d6201bdcca93d46edd099a2b80"
	case Hed_MSK008 = "70a775e8f172571389dc7d5b0f8fe08e75ce90fe5f062451767b4fc6b5cd58d5"
	case Hed_MSK011 = "cba946dc8b59e15b5b8bf107a2d871df42405142797d0fa733adcf908079a8e7"
	case Hed_MSK014 = "ba346dc0d5d1f5b45ffb03768099b43b0e2d31456260e1dbef931dd2c6ec8621"
	case Hed_MSK015 = "3b113dbdd2094ccb052ca0bfd4ad3d706387bfd55b2709d9263921e94cc51f34"
	case Hed_MSK016 = "34d2b767400912f944b27736790e9b237b0106d49a814437b3b9493867194140"
	case Hed_MSN000 = "1b0cb29ad745a0f80cf28638e8ca239e90570cc373463378f0bbaad427768305"
	case Hed_MSN004 = "c296ffc1dd0e58a9729c86c5e3540d39032696758bfa30b371b840c04642e956"
	case Hed_MSN109 = "3e0a2c62e455852c7a057a73989b6f7c2a4ae20b4a3784200cdead4c065744be"
	case Hed_MSN110 = "8247b08ffa7278e4ce3cc4edadec842eb21cd12a0e92b081be18d01ea3e2c3f1"
	case Hed_MSN111 = "83d6536d67e464c607e0f031e7a0de53aac91aaa7ac4f8b6db94b95ebea2372c"
	case Hed_MSN301 = "715dbfb3f3817847dc3c16d0e1184d5301b4c91a75baa309f74eb981d0693476"
	case Hed_MSN302 = "f23bd1c87cc2bb426c3bdfd33544b7dc4e8703286c147ced25f720908c113940"
	case Hed_MSN303 = "b353083ef996691ea529662b0fdf533d74359d8ffc4d3c1875a0c9f1a227c8fa"
	case Hed_MSN304 = "74e9338c975f086296f8de71fd7c96f32f7f00cd08f56f617ac6a6069c405b0d"
	case Hed_MSN305 = "3c29879e7226542851d4f3dc5092dae50b9eeacc346c40f364d7bd9d89bc587e"
	case Hed_MSN306 = "7704d274fc197295815ac10fe20c88a0ebce800b59aecf60710f9ae9e9b9cd4d"
	case Hed_MSN310 = "a52eb7b431cade8b25d916dc06f172a43a0a2c63f8e513df16f6336a152470d4"
	case Hed_NCP008 = "3ad3d2fc2a7a8718a4b272e6a373dc16774156c77ac78cec4331c58f4f6447c4"
	case Hed_TRG000 = "b7f6b3f454ef8197babfb2168f3e2144b80d5eeb06108d760e2c6d33ca262ad2"
	case Hed_VIS001 = "42d039e4cd97fdd24092632fe08bc0a2ab20355f1844be489cd94e8918b16b1a"
	case Hed_VIS003 = "510fa5cc020119717a0c229be4a67873893dfcc65be2df86f031fe41c1ef43a5"
	case Hed_VIS004 = "c4853cb0cbd6acca147ca5bfb907a8fd342aca4d83d977e82ff07eedb5ff53e7"
}