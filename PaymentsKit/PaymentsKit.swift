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

public final class PaymentsKit
{
    public static let shared = PaymentsKit()

    private var api: PaymentsAPIProtocol

    convenience init()
    {
        let requestPerformer = XSDKNetwork(sessionConfiguration: XSDKNetwork.defaultSessionConfiguration)
        let responseProcessor = PaymentsAPIResponseProcessor()
        let api = PaymentsAPI(requestPerformer: requestPerformer, responseProcessor: responseProcessor)

        self.init(api: api)
    }

    init(api: PaymentsAPIProtocol)
    {
        self.api = api
    }
}

extension PaymentsKit
{

    /**
    Creates a link for redirecting a user to a payment system.

     - Parameters:
       - paymentToken: Payment token.
       - isSandbox: Creates an order in the sandbox mode. The option is available for the company users only. Это я скопировал из другого места, но выглядит глупо в данном контексте.
     - Returns: URL for opening the payment UI.
     */
    public func createPaymentUrl(paymentToken: String, isSandbox: Bool) -> URL?
    {
        api.createPaymentUrl(paymentToken: paymentToken, isSandbox: isSandbox)
    }
}
