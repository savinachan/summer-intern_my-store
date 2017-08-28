class UsersController < ApplicationController

	before_action :find_user, only: [:show, :edit, :update, :destroy]
	
	def index
		@users = User.all
		#render action: "edit" #去找edit.html
	end

	def new
		@user = User.new
	end
	def create
		@user = User.new(clean_user_params) 

      if @user.save
        redirect_to users_path, notice: "new user!"
      else
        render :new, notice: "WRONG!"
        #redirect_to new_candidate_path 
        #用redirect_to 不會保留剛剛打好的資料 會惹怒民眾！  (edit同理
      end
	end

	def edit
		#find_cand
	end

	def update
		#find_cand

		if @user.update(clean_user_params)
			redirect_to users_path, notice: "update user!"
    else
        render :edit, notice: "WRONG!"
    end
	end

	def destroy
		#find_cand
		@user.destroy
		redirect_to users_path, notice: "destroy user!"
	end
	def show
		#find_cand
	end

	private #######

	def clean_user_params #params[:candidate]
		clean_params = params.require(:user).permit(:name, :tel, :email)
	end

	def find_user
		@user = User.find_by(id: params[:id])
		redirect_to users_path unless @user
	end
end
