class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else   
      render :new
    end  
  end  

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)

  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototypes = Prototype.find(params[:id])
    if prototypes.destroy
      redirect_to root_path
    end
  end


  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end 
  


end
