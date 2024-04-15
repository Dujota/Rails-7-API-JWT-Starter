# frozen_string_literal: true

module RackSessionFix # rubocop:disable Style/Documentation
  extend ActiveSupport::Concern
  class FakeRackSession < Hash # rubocop:disable Style/Documentation
    def enabled?
      false
    end
  end
  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
