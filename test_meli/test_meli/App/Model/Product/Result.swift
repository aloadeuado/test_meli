// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try Result(json)

import Foundation

// MARK: - Result
struct Result: Codable {
    var id, title: String?
    var condition: Condition?
    var thumbnailID: String?
    var catalogProductID: String?
    var listingTypeID: ListingTypeID?
    var permalink: String?
    var buyingMode: BuyingMode?
    var siteID: SiteID?
    var categoryID, domainID: String?
    var thumbnail: String?
    var currencyID: CurrencyID?
    var orderBackend, price: Int?
    var originalPrice: Int?
    var salePrice: JSONNull?
    var soldQuantity, availableQuantity: Int?
    var officialStoreID: Int?
    var useThumbnailID, acceptsMercadopago: Bool?
    var tags: [ResultTag]?
    var shipping: Shipping?
    var stopTime: String?
    var seller: Seller?
    var sellerAddress: SellerAddress?
    var address: Address?
    var attributes: [Attribute]?
    var installments: Installments?
    var winnerItemID, discounts: JSONNull?
    var promotions: [JSONAny]?
    var inventoryID: String?
    var catalogListing: Bool?
    var officialStoreName: String?
    var variationFilters: [String]?
    var variationsData: [String: VariationsDatum]?
    var differentialPricing: DifferentialPricing?

    enum CodingKeys: String, CodingKey {
        case id, title, condition
        case thumbnailID = "thumbnail_id"
        case catalogProductID = "catalog_product_id"
        case listingTypeID = "listing_type_id"
        case permalink
        case buyingMode = "buying_mode"
        case siteID = "site_id"
        case categoryID = "category_id"
        case domainID = "domain_id"
        case thumbnail
        case currencyID = "currency_id"
        case orderBackend = "order_backend"
        case price
        case originalPrice = "original_price"
        case salePrice = "sale_price"
        case soldQuantity = "sold_quantity"
        case availableQuantity = "available_quantity"
        case officialStoreID = "official_store_id"
        case useThumbnailID = "use_thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case tags, shipping
        case stopTime = "stop_time"
        case seller
        case sellerAddress = "seller_address"
        case address, attributes, installments
        case winnerItemID = "winner_item_id"
        case discounts, promotions
        case inventoryID = "inventory_id"
        case catalogListing = "catalog_listing"
        case officialStoreName = "official_store_name"
        case variationFilters = "variation_filters"
        case variationsData = "variations_data"
        case differentialPricing = "differential_pricing"
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        title: String?? = nil,
        condition: Condition?? = nil,
        thumbnailID: String?? = nil,
        catalogProductID: String?? = nil,
        listingTypeID: ListingTypeID?? = nil,
        permalink: String?? = nil,
        buyingMode: BuyingMode?? = nil,
        siteID: SiteID?? = nil,
        categoryID: String?? = nil,
        domainID: String?? = nil,
        thumbnail: String?? = nil,
        currencyID: CurrencyID?? = nil,
        orderBackend: Int?? = nil,
        price: Int?? = nil,
        originalPrice: Int?? = nil,
        salePrice: JSONNull?? = nil,
        soldQuantity: Int?? = nil,
        availableQuantity: Int?? = nil,
        officialStoreID: Int?? = nil,
        useThumbnailID: Bool?? = nil,
        acceptsMercadopago: Bool?? = nil,
        tags: [ResultTag]?? = nil,
        shipping: Shipping?? = nil,
        stopTime: String?? = nil,
        seller: Seller?? = nil,
        sellerAddress: SellerAddress?? = nil,
        address: Address?? = nil,
        attributes: [Attribute]?? = nil,
        installments: Installments?? = nil,
        winnerItemID: JSONNull?? = nil,
        discounts: JSONNull?? = nil,
        promotions: [JSONAny]?? = nil,
        inventoryID: String?? = nil,
        catalogListing: Bool?? = nil,
        officialStoreName: String?? = nil,
        variationFilters: [String]?? = nil,
        variationsData: [String: VariationsDatum]?? = nil,
        differentialPricing: DifferentialPricing?? = nil
    ) -> Result {
        return Result(
            id: id ?? self.id,
            title: title ?? self.title,
            condition: condition ?? self.condition,
            thumbnailID: thumbnailID ?? self.thumbnailID,
            catalogProductID: catalogProductID ?? self.catalogProductID,
            listingTypeID: listingTypeID ?? self.listingTypeID,
            permalink: permalink ?? self.permalink,
            buyingMode: buyingMode ?? self.buyingMode,
            siteID: siteID ?? self.siteID,
            categoryID: categoryID ?? self.categoryID,
            domainID: domainID ?? self.domainID,
            thumbnail: thumbnail ?? self.thumbnail,
            currencyID: currencyID ?? self.currencyID,
            orderBackend: orderBackend ?? self.orderBackend,
            price: price ?? self.price,
            originalPrice: originalPrice ?? self.originalPrice,
            salePrice: salePrice ?? self.salePrice,
            soldQuantity: soldQuantity ?? self.soldQuantity,
            availableQuantity: availableQuantity ?? self.availableQuantity,
            officialStoreID: officialStoreID ?? self.officialStoreID,
            useThumbnailID: useThumbnailID ?? self.useThumbnailID,
            acceptsMercadopago: acceptsMercadopago ?? self.acceptsMercadopago,
            tags: tags ?? self.tags,
            shipping: shipping ?? self.shipping,
            stopTime: stopTime ?? self.stopTime,
            seller: seller ?? self.seller,
            sellerAddress: sellerAddress ?? self.sellerAddress,
            address: address ?? self.address,
            attributes: attributes ?? self.attributes,
            installments: installments ?? self.installments,
            winnerItemID: winnerItemID ?? self.winnerItemID,
            discounts: discounts ?? self.discounts,
            promotions: promotions ?? self.promotions,
            inventoryID: inventoryID ?? self.inventoryID,
            catalogListing: catalogListing ?? self.catalogListing,
            officialStoreName: officialStoreName ?? self.officialStoreName,
            variationFilters: variationFilters ?? self.variationFilters,
            variationsData: variationsData ?? self.variationsData,
            differentialPricing: differentialPricing ?? self.differentialPricing
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
