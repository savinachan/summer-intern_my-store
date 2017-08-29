class ProductsController < ApplicationController

	before_action :find_product, only: [:show, :edit, :update, :destroy, :assignment, :assign, :unassign]
	
	def index
		@store = Store.find(params[:store_id])
		@products = @store.products

		#render action: "edit" #去找edit.html
	end

	def new
		@store = Store.find(params[:store_id])
		@product = Product.new
	end

	def create
		@store = Store.find(params[:store_id])
		@product = Product.new(clean_product_params) 


      if @product.save && WareHouse.create( :store_id => @store.id, :product_id => @product.id )
       	#debugger
        redirect_to store_products_path(@store), notice: "new product!"
      else
        #render :new, notice: "WRONG!"
        redirect_to new_store_product_path(@store), notice: "WRONG!"
        #用redirect_to 不會保留剛剛打好的資料 會惹怒民眾！  (edit同理
      end
	end

	def edit
		#find_
	end

	def update
		#find_

		if @product.update(clean_product_params)
			redirect_to users_path, notice: "update product!"
    else
      render :edit, notice: "WRONG!"
    end
	end

	def destroy
		#find_
		@product.destroy
		redirect_to users_path, notice: "destroy product!"
	end
	def show
		#find_
	end
	#---------------------------------
	def assignment
		@stores = @product.stores
		@not_in_stores = Store.where.not("id IN (?)", @stores.ids)
		# byebug
		# @warehouses = WareHouse.where( "product_id == ?", @product.id )
		# @not_in_warehouses = WareHouse.where( "product_id != ?", @product.id )

		# @in_store = []
		# @assign_stores = []

		# @warehouses.each do |w|
		# 	@in_store << w.store_id
		
		# end

		# @not_in_warehouses.each do |niw|
		# 	@assign_stores << niw.store_id unless ( @in_store.include? niw.store_id and @assign_stores.include? niw.store_id )
		
		# end

	end
	def assign
		
		@store = Store.find(params[:format])
		# debugger
		if WareHouse.create( :store_id => @store.id, :product_id => @product.id )
			redirect_to assignment_store_path(@product), notice: "assign success!"
		end

	end
	def unassign
		
		@store = Store.find(params[:format])
		#@w = WareHouse.where(["store_id = ? and product_id = ?", @store.id, @product.id]).limit(1)
		#debugger
		if WareHouse.where(["store_id = ? and product_id = ?", @store.id, @product.id]).limit(1).destroy_all
			redirect_to assignment_store_path(@product), notice: "unassign success!"
		end

	end

#---------------------------------
	private #######

	def clean_product_params #params[:candidate]
		clean_params = params.require(:product).permit(:title, :description, :price, :store_id, :image)
	end

	def find_product
		@product = Product.find_by(id: params[:id])
		#redirect_to stores_path unless @store
	end

end
