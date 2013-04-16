# coding: utf-8
class SprintsController < ApplicationController
  def new
    @sprint = SprintDecorator.decorate(Sprint.new)
  end

  def show
    @sprint = SprintDecorator.decorate(Sprint.where_id(params[:id]))
  end

  def create
    @sprint = SprintDecorator.decorate(Sprint.new(params[:sprint]))
    if @sprint.save
      flash[:success] = "Новый спринт успешно сохранен!"
      redirect_to @sprint
    else
      render 'new'      
    end
  end

  def index    
    @sprints = SprintDecorator.decorate_collection(Sprint.all)
    
    stats = SprintStats.get_first
    @velocity = stats.velocity
    @probable_points = stats.points
  end

  def edit
    @sprint = SprintDecorator.decorate(Sprint.where_id(params[:id]))
  end

  def update
    @sprint = SprintDecorator.decorate(Sprint.where_id(params[:id]))
    if @sprint.update_attributes(params[:sprint])
      flash[:success] = 'Изменения сохранены'
      redirect_to root_path
    else
      render 'edit'
    end   
  end

  def destroy
    SprintDecorator.decorate(Sprint.where_id(params[:id])).destroy
    flash[:success] = 'Спринт успешно удален'
    redirect_to root_path
  end
end