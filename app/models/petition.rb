class Petition < ApplicationRecord

  def self.most_popular
    order(signature_count: :desc)
  end

end
