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

import Foundation

public struct StoreVirtualItemShort
{
        /// Unique item ID. The SKU may only contain lowercase Latin alphanumeric characters,
        /// periods, dashes, and underscores.
        public let sku: String

        /// Item name.
        public let name: String

        /// Groups the item belongs to.
        public let groups: [StoreItemGroupShort]

        /// Item description.
        public let description: String?
}

extension StoreVirtualItemShort
{
    init(fromResponse response: GetAllVirtualItemsResponse.Item)
    {
        sku = response.sku
        name = response.name
        groups = response.groups.map { StoreItemGroupShort(externalId: $0.externalId, name: $0.name) }
        description = response.description
    }
}
