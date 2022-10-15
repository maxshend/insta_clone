# frozen_string_literal: true

class PasswordValidator < ActiveModel::EachValidator
  MINIMUM_LENGTH = 8

  def validate_each(record, _attribute, value)
    return unless value && value.size < MINIMUM_LENGTH

    record.errors.add :password, :too_short, count: MINIMUM_LENGTH
  end
end
