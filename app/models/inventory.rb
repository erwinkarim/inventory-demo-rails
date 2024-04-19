class Inventory < ApplicationRecord
	validates :name, :price, :presence => true
	
	def init
		self.name ||= 'product name'
		self.desc ||= 'product desc'
		self.price ||= 10.00
		self.picture ||= 'https://example.com'
	end
end
