require 'active_support/inflector'

module Gargoyle
  class Manager
    attr_reader :scope

    def initialize(scope)
      @scope = scope.to_s
    end

    def session_key_name
      "gargoyle.#{scope}.id"
    end

    def find_in_scope(id)
      scope.camelize.constantize.find_by(id: id)
    end

    def serialize(user)
      user.id
    end
  end
end
