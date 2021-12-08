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

class PaymentsAPI
{
    let requestPerformer: RequestPerformer
    let responseProcessor: ResponseProcessor
    
    init(requestPerformer: RequestPerformer, responseProcessor: ResponseProcessor)
    {
        logger.debug(.initialization, domain: .paymentsKit) { String(describing: Self.self) }
        
        self.requestPerformer = requestPerformer
        self.responseProcessor = responseProcessor
    }
    
    deinit
    {
        let deinitingType = String(describing: type(of: self))
        logger.debug(.deinitialization, domain: .paymentsKit) { deinitingType }
    }
}

extension PaymentsAPI: PaymentsAPIProtocol
{
    func createPaymentUrl(paymentToken: String, isSandbox: Bool) -> URL?
    {
        let baseUrlString = isSandbox
            ? "https://sandbox-secure.xsolla.com/paystation3/"
            : "https://secure.xsolla.com/paystation3/"

        guard var urlComponents = URLComponents(string: baseUrlString) else
        {
            return nil
        }

        urlComponents.queryItems = [URLQueryItem(name: "access_token", value: paymentToken)]

        guard let url = urlComponents.url else
        {
            return nil
        }

        return url
    }
}

extension PaymentsAPI
{
    var configuration: PaymentsAPIConfiguration
    {
        PaymentsAPIConfiguration(requestPerformer: requestPerformer,
                                 responseProcessor: responseProcessor,
                                 apiBasePath: "http://0.0.0.0:3000/")
    }
}
