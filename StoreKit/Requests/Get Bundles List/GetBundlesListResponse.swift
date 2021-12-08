// Copyright 2021-present Xsolla (USA), Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at q
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing and permissions and

// swiftlint:disable nesting
// swiftlint:disable redundant_string_enum_value

import Foundation

struct GetBundlesListResponse: Decodable
{
    let items: [Item]
    
    enum CodingKeys: String, CodingKey
    {
        case items = "items"
    }
    
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([Item].self, forKey: .items)
    }
}

extension GetBundlesListResponse
{
    struct Item: Decodable
    {
        let sku: String
        let name: String
        let groups: [StoreAPICommonResponse.Group]
        let description: String?
        let attributes: [StoreAPICommonResponse.Attribute]
        let type: String
        let bundleType: String
        let imageUrl: String?
        let isFree: Bool
        let price: StoreAPICommonResponse.Price?
        let totalContentPrice: StoreAPICommonResponse.Price?
        let virtualPrices: [StoreAPICommonResponse.VirtualPrice]
        let content: [ContentItem]
        
        enum CodingKeys: String, CodingKey
        {
            case sku = "sku"
            case name = "name"
            case groups = "groups"
            case description = "description"
            case attributes = "attributes"
            case type = "type"
            case bundleType = "bundle_type"
            case imageUrl = "image_url"
            case isFree = "is_free"
            case price = "price"
            case totalContentPrice = "total_content_price"
            case virtualPrices = "virtual_prices"
            case content = "content"
        }
        
        init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            sku = try container.decode(String.self, forKey: .sku)
            name = try container.decode(String.self, forKey: .name)
            groups = try container.decode([StoreAPICommonResponse.Group].self, forKey: .groups)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            attributes = try container.decode([StoreAPICommonResponse.Attribute].self, forKey: .attributes)
            type = try container.decode(String.self, forKey: .type)
            bundleType = try container.decode(String.self, forKey: .bundleType)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            isFree = try container.decode(Bool.self, forKey: .isFree)
            price = try container.decodeIfPresent(StoreAPICommonResponse.Price.self, forKey: .price)
            totalContentPrice = try container.decodeIfPresent(StoreAPICommonResponse.Price.self,
                                                              forKey: .totalContentPrice)
            virtualPrices = try container.decode([StoreAPICommonResponse.VirtualPrice].self, forKey: .virtualPrices)
            content = try container.decode([ContentItem].self, forKey: .content)
        }
    }
}

extension GetBundlesListResponse.Item
{
    struct ContentItem: Decodable
    {
        let sku: String
        let name: String
        let type: String
        let description: String?
        let imageUrl: String?
        let attributes: [StoreAPICommonResponse.Attribute]
        let isFree: Bool
        let groups: [StoreAPICommonResponse.Group]
        let quantity: Int
        let price: StoreAPICommonResponse.Price?
        let virtualPrices: [StoreAPICommonResponse.VirtualPrice]
        let virtualItemType: String
        let inventoryOptions: StoreAPICommonResponse.InventoryOptions
        
        enum CodingKeys: String, CodingKey
        {
            case sku = "sku"
            case name = "name"
            case type = "type"
            case description = "description"
            case imageUrl = "image_url"
            case attributes = "attributes"
            case isFree = "is_free"
            case groups = "groups"
            case quantity = "quantity"
            case price = "price"
            case virtualPrices = "virtual_prices"
            case virtualItemType = "virtual_item_type"
            case inventoryOptions = "inventory_options"
        }
        
        init(from decoder: Decoder) throws
        {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            sku = try container.decode(String.self, forKey: .sku)
            name = try container.decode(String.self, forKey: .name)
            type = try container.decode(String.self, forKey: .type)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
            attributes = try container.decode([StoreAPICommonResponse.Attribute].self, forKey: .attributes)
            isFree = try container.decode(Bool.self, forKey: .isFree)
            groups = try container.decode([StoreAPICommonResponse.Group].self, forKey: .groups)
            quantity = try container.decode(Int.self, forKey: .quantity)
            price = try container.decodeIfPresent(StoreAPICommonResponse.Price.self, forKey: .price)
            virtualPrices = try container.decode([StoreAPICommonResponse.VirtualPrice].self, forKey: .virtualPrices)
            virtualItemType = try container.decode(String.self, forKey: .virtualItemType)
            inventoryOptions = try container.decode(StoreAPICommonResponse.InventoryOptions.self,
                                                    forKey: .inventoryOptions)
        }
    }
}
