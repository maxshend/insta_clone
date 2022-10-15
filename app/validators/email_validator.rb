# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  MAXIMUM_LENGTH = 100

  def validate_each(record, _attribute, value)
    return unless value

    record.errors.add :email, :invalid unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.match?(value)

    return if value.size <= MAXIMUM_LENGTH

    record.errors.add :email, :too_long, count: MAXIMUM_LENGTH
  end
end
