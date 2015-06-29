class Admin::PositionsController < ApplicationController

  before_action :set_position, :only => [:show, :edit, :update, :destroy]

  def index
  	@position=Position.all
  end

  def new
	 @position=Position.new  	
  end


  def edit
  end

  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html{
          flash[:success] = '岗位修改成功'
          redirect_to admin_position_url(@position)
        }
        format.js
      else
        format.html {render :edit}
        format.js
      end
    end
  end

   def destroy
    @position.destroy
    flash[:success] = '岗位删除成功'
    redirect_to admin_positions_url 
  end

  def create
  	@position= Position.new(position_params)
    respond_to do |format|
      if @position.save
        format.html{
          flash[:success] = '岗位新增成功'
          redirect_to admin_positions_url
        }
        format.js
      else
        format.html {render :new}
        format.js
      end
    end
  end

  private
  def position_params
    params.require(:position).permit(:name)
  end

  def set_position
  	@position=Position.find(params[:id])
  end

end
