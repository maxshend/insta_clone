# frozen_string_literal: true

FactoryBot.automatically_define_enum_traits = false

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
