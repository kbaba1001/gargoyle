module Gargoyle
  module Constraits
    class SignedOut
      def initialize(scope = nil)
        @scope = scope
      end

      def matches?(request)
        !request.session[Gargoyle::Manager.new(@scope).session_key_name]
      end
    end
  end
end
