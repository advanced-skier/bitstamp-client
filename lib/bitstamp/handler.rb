require_relative './exception'

module Bitstamp
  module Handler
    def handle_body(raw_body)
      body = JSON.parse(raw_body)

      if body.kind_of?(Hash)
        if body.has_key?('error')
          raise ::Bitstamp::Exception::ServiceError.new(body.fetch('error'))
        elsif body.has_key?('status') && body.fetch('status') == 'error'
          raise ::Bitstamp::Exception::ServiceError.new(body.fetch('reason').values.flatten.join(', '))
        end
      end

      return body
    rescue JSON::ParserError
      raise ::Bitstamp::Exception::InvalidContent.new(raw_body)
    end
  end
end
