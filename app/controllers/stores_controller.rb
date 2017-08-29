class StoresController < ApplicationController

	before_action :find_store, only: [:show, :edit, :update, :destroy]
	
	def index
		@user = User.find(params[:user_id])
		@stores = @user.stores

		#render action: "edit" #去找edit.html
	end

	def new
		@user = User.find(params[:user_id])
		@store = Store.new
	end

	def create
		@user = User.find(params[:user_id])
		@store = Store.new(clean_store_params) 


      if @store.save
       	#debugger
        redirect_to user_stores_path(@user), notice: "new store!"
      else
        #render :new, notice: "WRONG!"
        redirect_to new_user_store_path(@user), notice: "WRONG!"
        #用redirect_to 不會保留剛剛打好的資料 會惹怒民眾！  (edit同理
      end
	end

	def edit
		#find_cand
	end

	def update
		#find_cand

		if @store.update(clean_store_params)
			redirect_to user_stores_path(@store.user), notice: "update store!"

    else
      render :edit, notice: "WRONG!"
    end
	end

	def destroy
		#find_cand
		@store.destroy
		redirect_to users_path, notice: "destroy store!"
	end
	def show
		#find_cand
	end

	private #######

	def clean_store_params #params[:candidate]
		clean_params = params.require(:store).permit(:name, :tel, :address, :user_id)
	end

	def find_store
		@store = Store.find_by(id: params[:id])
		 #redirect_to stores_path unless @store
	end
end
