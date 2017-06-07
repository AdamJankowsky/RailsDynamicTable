class BricksController < ApplicationController

  def new
    type = params[:type_of_brick]
    new_brick = Brick.new(type_of_brick: type)
    if new_brick.save
      render json: 'Done'
    else
      render json: 'Something went wrong'
    end

  end

  def index
    bricks = Brick.order(:updated_at => :desc)
    render json: bricks
  end

  def lastitem
    brick = Brick.order(updated_at: :desc).first
    render json: brick
  end

  def lastitemtimestamp
    brick = Brick.order(:updated_at => :desc).first
    render json: brick.updated_at
  end


  def all
    render json: Brick.count
  end

end
