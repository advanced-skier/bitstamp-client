module Bitstamp::HTTP
  module CryptoTransactions
    def crypto_transactions(nonce: nil, offset: 0, limit: 100)
      params = {
        nonce:  nonce,
        offset: offset,
        limit:  limit
      }

      call(request_uri('v2', 'crypto-transactions'), 'POST', params)
    end
  end
end
