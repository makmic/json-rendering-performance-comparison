# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

100_000.times do
  FatModel.create(
      indexed_attribute_1: 'attribute_1' * 1,
      attribute_1: 'attribute_1' * 1,
      attribute_2: 'attribute_2' * 2,
      attribute_3: 'attribute_3' * 3,
      attribute_4: 'attribute_4' * 4,
      attribute_5: 'attribute_5' * 5,
      attribute_6: 'attribute_6' * 6,
      attribute_7: 'attribute_7' * 7,
      attribute_8: 'attribute_8' * 8,
      attribute_9: 'attribute_9' * 9,
      attribute_10: 'attribute_10' * 10,
      attribute_11: 'attribute_11' * 11,
      attribute_12: 'attribute_12' * 12,
      attribute_13: 'attribute_13' * 13,
      attribute_14: 'attribute_14' * 14,
      attribute_15: 'attribute_15' * 15,
      attribute_16: 'attribute_16' * 16,
      attribute_17: 'attribute_17' * 17,
      attribute_18: 'attribute_18' * 18,
      attribute_19: 'attribute_19' * 19,
      attribute_20: 'attribute_20' * 20,
      attribute_21: 'attribute_21' * 21,
      attribute_22: 'attribute_22' * 22,
      attribute_23: 'attribute_23' * 23,
      attribute_24: 'attribute_24' * 24,
      attribute_25: 'attribute_25' * 25,
      attribute_26: 'attribute_26' * 26,
      attribute_27: 'attribute_27' * 27,
      attribute_28: 'attribute_28' * 28,
      attribute_29: 'attribute_29' * 29,
      attribute_30: 'attribute_30' * 30,
  )
end
