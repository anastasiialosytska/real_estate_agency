# frozen_string_literal: true

class Agent < User
  validates :name, :company_name, presence: true, length: { in: 6..20 }
  validates :phone, presence: true
end
