module Bitstamp::HTTP
  module Withdrawal
    def withdrawal_requests(nonce: nil, timedelta: 86400)
      params = { nonce: nonce, timedelta: timedelta }

      call(request_uri('v2', 'withdrawal-requests'), 'POST', params)
    end

    def withdrawal(nonce: nil, destination_tag: nil, currency_name:, amount:, address:)
      params = {
        nonce:   nonce,
        amount:  amount,
        address: address
      }

      params.merge!({destination_tag: destination_tag}) if currency_name == 'xrp'

      call(request_uri("#{currency_name}_withdrawal"), 'POST', params)
    end
  end
end
