import Foundation

public enum EventId: Int, Codable, CaseIterable, Identifiable {
    case waterLevels    = 0
    case rush           = 1
    case goldieSeeking  = 2
    case griller        = 3
    case fog            = 4
    case theMothership  = 5
    case cohockCharge   = 6
}

public enum EventKey: String, Codable, CaseIterable, Identifiable {
    case waterLevels    = "water-levels"
    case rush           = "rush"
    case goldieSeeking  = "goldie-seeking"
    case griller        = "griller"
    case fog            = "fog"
    case theMothership  = "the-mothership"
    case cohockCharge   = "cohock-charge"
}

public extension EventKey {
    var id: String { rawValue }
}

public extension EventId {
    var id: Int { rawValue }
}
