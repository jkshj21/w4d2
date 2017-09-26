# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#



 class Cat < ApplicationRecord
   COLORS = %w(black white orange grey brown yellow)
   validates :birth_date, presence:true
   validates :color, presence:true, inclusion: {in: COLORS}
   validates :name, presence:true
   validates :sex, presence:true, inclusion: {in: %w(M F)}
   validates :description, presence:true

   def self.colors
     COLORS
   end

   def age
     Time.now.year - self.birth_date.year
   end

   has_many :cat_rental_requests,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy



 end
