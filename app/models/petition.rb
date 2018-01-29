class Petition < ApplicationRecord
  belongs_to :user

  def self.most_popular
    order(signature_count: :desc)
  end


end
