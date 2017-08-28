class Store < ApplicationRecord
  belongs_to :user
  #has_many :products

  has_many :ware_houses
  has_many :products, through: :ware_houses

 #  def index
	# 	@stores = Store.all
	# 	#render action: "edit" #去找edit.html
	# end
end
