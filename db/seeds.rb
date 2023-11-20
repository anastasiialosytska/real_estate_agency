# frozen_string_literal: true

['Long term rent', 'Short term rent'].each do |title|
  Category.find_or_create_by!(title: title)
end
