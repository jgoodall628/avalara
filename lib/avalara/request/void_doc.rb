# encoding: UTF-8
require 'multi_json'

module Avalara
  module Request
    class VoidDoc < Avalara::Types::Stash
      # Set outgoing
      property :CancelCode, :from => :cancel_code
      property :DocId, :from => :doc_id

      def to_json
        MultiJson.encode(self.to_hash, :pretty => true)
      end
    end
  end
end
