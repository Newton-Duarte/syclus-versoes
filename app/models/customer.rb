class Customer < ActiveRecord::Base
  has_one :version

  accepts_nested_attributes_for :version

  def self.search(search)
    if search
      joins(:version).where("customers.name LIKE ? or versions.description LIKE ?", "%#{search}%", "%#{search}%")
    else
      find(:all)
    end
  end
end
