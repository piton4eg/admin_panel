# coding: utf-8
class SprintsController < ApplicationController
  def new
  	@sprint = Sprint.new
  end

  def show
  	@sprint = Sprint.find(params[:id])  	
  end

  def create
  	@sprint = Sprint.new(params[:sprint])
  	if @sprint.save
  		flash[:success] = "Новый спринт успешно сохранен!"
  		redirect_to @sprint
  	else
  		render 'new'  		
  	end
  end

  def index
  	@sprints = Sprint.all
  	sprints_with_hours = Sprint.find(:all, :conditions => ["hours_count > '0' AND status <> 'Планируемый'"])
  	fact_points = hours = 0
  	sprints_with_hours.each do |swh|
  		fact_points += swh.fact_points
  		hours += swh.hours_count  		
  	end
  	if hours > 0
      @velocity = (fact_points / hours).round(2)
    end
    if sprints_with_hours.count > 0
  	  @probable_points = (@velocity * hours / sprints_with_hours.count).round(2)
    end
  end

  def edit
  	@sprint = Sprint.find(params[:id])
  end

  def update
  	@sprint = Sprint.find(params[:id])
  	if @sprint.update_attributes(params[:sprint])
  		flash[:success] = 'Изменения сохранены'
  		redirect_to root_path
  	else
  		render 'edit'
  	end  	
  end
end
