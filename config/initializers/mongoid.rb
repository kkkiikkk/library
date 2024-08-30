module Mongoid
  module Clients
    def with_name(name)
      Rails.logger.debug "Entering with_name with: #{name.inspect}"
      if name.nil?
        Rails.logger.error "Client name is nil!"
        raise "Client name cannot be nil!" # Raise an error to catch the issue early
      else
        Rails.logger.debug "Client name: #{name}"
      end
      super
    end
  end
end
