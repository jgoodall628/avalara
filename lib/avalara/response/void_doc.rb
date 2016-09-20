# encoding: UTF-8

require 'hashie/extensions/symbolize_keys'

module Avalara
  module Response
    class VoidDoc < Avalara::Types::Stash

      property :transaction_id, :from => :TransactionId
      property :result_code, :from => :ResultCode
      property :messages, :from => :Messages

      def initialize(response)
        super(Hashie::Extensions::SymbolizeKeys.symbolize_keys(response))
      end

      def success?
        result_code == 'Success'
      end

      def Messages=(new_messages)
        self.messages = []
        new_messages.each do |message|
          self.messages << Message.new(message)
        end
      end

    end
  end
end
