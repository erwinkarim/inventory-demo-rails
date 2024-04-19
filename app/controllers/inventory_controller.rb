class InventoryController < ApplicationController
	def index
		@inventories = Inventory::all();
		@inventory = Inventory::new();

		render :layout => "application"
	end

	def create
		# will show the product
		logger.debug "in inventory#create controller";
		logger.debug "params: " + params.to_s;

		inventory = Inventory.new(inventory_params);

		@inventories = Inventory::all();
		if inventory.valid? then
			inventory.save();
			@inventory = Inventory::new();
		else
			@inventory = inventory;
		end

		render 'index', :layout => "application"

	end

	def show
		@inventory = Inventory::find(params[:id])

		render 'show', :layout => 'application'

	end

	def edit
		@inventory = Inventory::find(params[:id])

		render 'edit', :layout => 'application'
	end

	def update
		logger.debug 'should update the inventory'
		inventory = Inventory::find(params[:id])


		if inventory.update(inventory_params) then
			logger.debug 'inventory update valid'
			@inventories = Inventory::all();
			@inventory = Inventory::new();
			render 'index', :layout => "application"
		else
			logger.debug 'inventory update invalid'
			@inventory = inventory
			render 'edit', :layout => 'application'
		end
	end


	def destroy
		logger.debug 'should delete the inventory'
	end

	def generate
		logger.debug 'should generate random inventory'

		@inventory = Inventory::new({
			name: Faker::Name.name,
			desc: Faker::Lorem.paragraph(sentence_count: 15),
			price: Faker::Commerce.price,
			picture: Faker::Internet.url,
		});
		@inventory.save();

		@inventories = Inventory::all();
		render 'index', :layout => "application"

	end

	def inventory_params
		params.require(:inventory).permit(:name, :desc, :price, :picture)
	end
end
