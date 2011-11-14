# coding: utf-8
#class PagesController < ApplicationController
class PagesController < HighVoltage::PagesController
  #layout :layout_for_page
  before_filter :authenticate_admin!, :except => [:home, :contacts, :dostavka, :shops, :index, :show, :sumki_tekstil, :cosmetika_podarok, :cosmetika_den]

  def show
    @page = Page.find_by_title(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def edit
    @page = Page.find_by_title(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @page }
    end
  end

  def update
    @page = Page.find_by_title(params[:id])

     respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = "Данные успешно обновлены!"
        format.xml  { head :ok }
        format.html { render :action => :edit }
      else
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
  end

  def home
    @page = Page.find_by_title(params[:id])
  end

  def sumki_tekstil
		@products = Category.find_by_name("sumki_tekstil").products
  end
  def cosmetika_podarok
		category = Category.find_by_name("cosmetika_podarok")
   	@products = category.products
  end
  def cosmetika_den
		category = Category.find_by_name("cosmetika_den")
   	@products = category.products
  end


  protected
  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end
end
