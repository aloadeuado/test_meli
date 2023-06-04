import Foundation

enum ResultTag: String, Codable {
    case bestSellerCandidate = "best_seller_candidate"
    case cartEligible = "cart_eligible"
    case draggedBidsAndVisits = "dragged_bids_and_visits"
    case goodQualityPicture = "good_quality_picture"
    case goodQualityThumbnail = "good_quality_thumbnail"
    case immediatePayment = "immediate_payment"
    case loyaltyDiscountEligible = "loyalty_discount_eligible"
    case shippingGuaranteed = "shipping_guaranteed"
    case standardPriceByChannel = "standard_price_by_channel"
}
