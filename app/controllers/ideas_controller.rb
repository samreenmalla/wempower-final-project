class IdeasController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
	before_action :is_owner?, only: [:edit, :update, :destroy]

	def index
		if user_signed_in?
			@ideas = Idea.all.order('created_at DESC')
			if params[:tag]
				@ideas = Idea.tagged_with(params[:tag])
			end
		else 
			render static_pages_home_path
		end
	end
  
	def new
    @idea = Idea.new
	end

	def create
		@idea = current_user.ideas.create(idea_params)
		if @idea.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
    @idea = Idea.find(params[:id])
	end

	def update
    @idea = Idea.find(params[:id])
		@idea.update(idea_params)
		if @idea.valid?
			redirect_to root_path
		else
			render :edit, status: :unprocessable_entity
		end
  end

	def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to root_path
	end

	def show
		@idea = Idea.find(params[:id])
	end
    

  def idea_params
    params.require(:idea).permit(:description, :tag_list)
	end
		
	def is_owner?
		if Idea.find(params[:id]).user != current_user
			redirect_to root_path
		end
	end
	
end
