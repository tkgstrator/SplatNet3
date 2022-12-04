//
//  SHA256Hash.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

public enum SHA256Hash: String, CaseIterable {
	case BankaraBattleHistoriesQuery = "de4754588109b77dbcb90fbe44b612ee"
	case BankaraBattleHistoriesRefetchQuery = "964c03ed28eb640438d8113534de2fe4"
	case BattleHistoryCurrentPlayerQuery = "49dd00428fb8e9b4dde62f585c8de1e0"
	case CatalogQuery = "52504060c81ff2f2d618c4e5377e6e7c"
	case CatalogRefetchQuery = "4423dfd630867301fcdd834cd52922f4"
	case ChallengeQuery = "8a079214500148bf88a8fce1d7209b90"
	case ChallengeRefetchQuery = "34aedc79f96b8613501bba465295f779"
	case CheckinQuery = "5d0d1b45ebf4e324d0dae017d9df06d2"
	case CheckinWithQRCodeMutation = "8d54e1c6bdcc65181f65adc582914ad8"
	case ConfigureAnalyticsQuery = "f8ae00773cc412a50dd41a6d9a159ddd"
	case CoopHistoryDetailQuery = "3cc5f826a6646b85f3ae45db51bd0707"
	case CoopHistoryDetailRefetchQuery = "d3188df2fd4436870936b109675e2849"
	case CoopHistoryQuery = "6ed02537e4a65bbb5e7f4f23092f6154"
	case CoopPagerLatestCoopQuery = "5711cb6c2e3afce523766c906810f030"
	case CreateMyOutfitMutation = "31ff008ea218ffbe11d958a52c6f959f"
	case DetailFestRecordDetailQuery = "96c3a7fd484b8d3be08e0a3c99eb2a3d"
	case DetailFestRefethQuery = "18c7c465b18de5829347b7a7f1e571a1"
	case DetailFestVotingStatusRefethQuery = "92f51ed1ab462bbf1ab64cad49d36f79"
	case DetailRankingQuery = "4869de13d0d209032b203608cb598aef"
	case DetailTabViewWeaponTopsArRefetchQuery = "a6782a0c692e8076656f9b4ab613fd82"
	case DetailTabViewWeaponTopsClRefetchQuery = "8d3c5bb2e82d6eb32a37eefb0e1f8f69"
	case DetailTabViewWeaponTopsGlRefetchQuery = "b23468857c049c2f0684797e45fabac1"
	case DetailTabViewWeaponTopsLfRefetchQuery = "d46f88c2ea5c4daeb5fe9d5813d07a99"
	case DetailTabViewXRankingArRefetchQuery = "eb69df6f2a2f13ab207eedc568f0f8b6"
	case DetailTabViewXRankingClRefetchQuery = "68f99b7b02537bcb881db07e4e67f8dd"
	case DetailTabViewXRankingGlRefetchQuery = "5f8f333770ed3c43e21b0121f3a86716"
	case DetailTabViewXRankingLfRefetchQuery = "4e8b381ae6f9620443627f4eac3a2210"
	case DetailVotingStatusQuery = "53ee6b6e2acc3859bf42454266d671fc"
	case DownloadSearchReplayQuery = "cde4fe7d6467b32d5a06279492aa21dc"
	case FestRecordQuery = "44c76790b68ca0f3da87f2a3452de986"
	case FestRecordRefetchQuery = "73b9837d0e4dd29bfa2f1a7d7ee0814a"
	case FriendListQuery = "f0a8ebc384cf5fbac01e8085fbd7c898"
	case FriendListRefetchQuery = "aa2c979ad21a1100170ddf6afea3e2db"
	case GesotownQuery = "a43dd44899a09013bcfd29b4b13314ff"
	case GesotownRefetchQuery = "951cab295eafdbeccfc2e718d7a98646"
	case HeroHistoryQuery = "fbee1a882371d4e3becec345636d7d1c"
	case HeroHistoryRefetchQuery = "4f9ae2b8f1d209a5f20302111b28f975"
	case HistoryRecordQuery = "32b6771f94083d8f04848109b7300af5"
	case HistoryRecordRefetchQuery = "57b1ccae6949c407e2df9bcad2a8e573"
	case HomeQuery = "dba47124d5ec3090c97ba17db5d2f4b3"
	case JourneyChallengeDetailQuery = "38e58b84376a2ad49ddbe4061b948455"
	case JourneyChallengeDetailRefetchQuery = "8dc246933b1f4e26a6dfd251878cf786"
	case JourneyQuery = "bc71fc0264f3f72256724b069f7a4097"
	case JourneyRefetchQuery = "09eee118fa16415d6bc3846bc6e5d8e5"
	case LatestBattleHistoriesQuery = "4f5f26e64bca394b45345a65a2f383bd"
	case LatestBattleHistoriesRefetchQuery = "047c1ff4d6b9f03b082aa6ffdb200a6a"
	case MyOutfitCommonDataEquipmentsQuery = "d29cd0c2b5e6bac90dd5b817914832f8"
	case MyOutfitCommonDataFilteringConditionQuery = "d02ab22c9dccc440076055c8baa0fa7a"
	case MyOutfitDetailQuery = "d935d9e9ba7a5b6b5d6ece7f253304fc"
	case MyOutfitsQuery = "81d9a6849467d2aa6b1603ebcedbddbe"
	case MyOutfitsRefetchQuery = "10db4e349f3123c56df14e3adec2ee6f"
	case PagerLatestVsDetailQuery = "0329c535a32f914fd44251be1f489e24"
	case PagerUpdateBattleHistoriesByVsModeQuery = "7297ae42bbb1958cfe438736865d304e"
	case PhotoAlbumQuery = "7e950e4f69a5f50013bba8a8fb6a3807"
	case PhotoAlbumRefetchQuery = "53fb0ad32c13dd9a6e617b1158cc2d41"
	case PrivateBattleHistoriesQuery = "1d6ed57dc8b801863126ad4f351dfb9a"
	case PrivateBattleHistoriesRefetchQuery = "4835a28419ad3c7bfacbb30ca4008140"
	case RankingHoldersFestTeamRankingHoldersPaginationQuery = "be2eb9e9b8dd680519eb59cc46c1a32b"
	case RefetchableCoopHistory_coopResultQuery = "d82a506052aef380e584c695e105f78b"
	case RegularBattleHistoriesQuery = "d5b795d09e67ce153e622a184b7e7dfa"
	case RegularBattleHistoriesRefetchQuery = "04e5d83f4243541c369b2e7556b9b809"
	case ReplayModalReserveReplayDownloadMutation = "87bff2b854168b496c2da8c0e7f3e5bc"
	case ReplayQuery = "412b09ef4eb7b67c86333f70a40ff6ba"
	case ReplayUploadedReplayListRefetchQuery = "96b824c4563880f553c4041dca2fcf08"
	case SaleGearDetailOrderGesotownGearMutation = "b79b7a101a243912754f72437e2ad7e5"
	case SaleGearDetailQuery = "6eb1b255b2cf04c08041567148c883ad"
	case SettingQuery = "61228d553e7463c203e05e7810dd79a7"
	case StageRecordQuery = "f08a932d533845dde86e674e03bbb7d3"
	case StageRecordsRefetchQuery = "2fb1b3fa2d40c9b5953ea1ae263e54c1"
	case StageScheduleQuery = "730cd98e84f1030d3e9ac86b6f1aae13"
	case SupportButton_SupportChallengeMutation = "30aa261475d43bd765b4200fc67003c8"
	case UpdateMyOutfitMutation = "bb809066282e7d659d3b9e9d4e46b43b"
	case UseCurrentFestQuery = "c0429fd738d829445e994d3370999764"
	case VotesUpdateFestVoteMutation = "a2c742c840718f37488e0394cd6e1e08"
	case VsHistoryDetailPagerRefetchQuery = "994cf141e55213e6923426caf37a1934"
	case VsHistoryDetailQuery = "291295ad311b99a6288fc95a5c4cb2d2"
	case WeaponRecordQuery = "5f279779e7081f2d14ae1ddca0db2b6e"
	case WeaponRecordsRefetchQuery = "6961f618fcef440c81509b205465eeec"
	case XBattleHistoriesQuery = "45c74fefb45a49073207229ca65f0a62"
	case XBattleHistoriesRefetchQuery = "ba35dcea6d5666463e86273e1756d9ed"
	case XRankingDetailQuery = "ec7174376203f9901713e116075c5ecd"
	case XRankingDetailRefetchQuery = "2aac81b2ec56fb2d15ce3d6a2b625772"
	case XRankingQuery = "d771444f2584d938db8d10055599011d"
	case XRankingRefetchQuery = "5149402597bd2531b4eea04692d8bfd5"
}