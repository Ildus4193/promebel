# coding: utf-8
class CategoriesController < ApplicationController
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def show
    @products = Category.find(params[:id]).products

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  def index
    @category = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Катагория была успешно создана.')}
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(categories_path, :notice => 'Катагория была успешно обновлена.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_path) }
    end
  end


end
