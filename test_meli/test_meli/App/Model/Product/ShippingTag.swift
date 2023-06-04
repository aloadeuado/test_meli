import Foundation

enum ShippingTag: String, Codable {
    case fsThresholdMcoChangeApr2021 = "fs_threshold_mco_change_apr2021"
    case fsThresholdMcoChangeJul2021 = "fs_threshold_mco_change_jul2021"
    case fulfillment = "fulfillment"
    case mandatoryFreeShipping = "mandatory_free_shipping"
    case mcoChgThresholdJan23 = "MCO-chg-threshold-Jan-23"
    case selfServiceIn = "self_service_in"
    case selfServiceOut = "self_service_out"
}
