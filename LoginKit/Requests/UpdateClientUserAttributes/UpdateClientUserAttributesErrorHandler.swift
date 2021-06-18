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
import XsollaSDKUtilities

final class UpdateClientUserAttributesErrorHandler: APIBaseErrorHandler
{
    override func setHandlers()
    {
        add(handler: APIServerCode400ErrorHandler())
        add(handler: APIServerCode401ErrorHandler())
        add(handler: APIServerCode403ErrorHandler())
        add(handler: APIServerCode404ErrorHandler())
        add(handler: APIServerCode422ErrorHandler())
        add(handler: APIServerCode429ErrorHandler())
    }
}
