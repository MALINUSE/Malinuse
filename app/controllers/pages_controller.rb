class PagesController < ApplicationController

  layout "admin"

  before_action :find_subject
  before_action :set_page, only: [:show, :edit, :update, :destroy]


  def index
    # @pages = Page.where(:subject_id => @subject.id).sorted
    @pages = @subject.pages.sorted
  end

  def show
  end

  def new
    @page = Page.new({:subject_id => @subject.id, :name => "Default"})
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:success] = "Page created successfully."
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end

  def update
    if @page.update_attributes(page_params)
      flash[:success] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id, :subject_id => @subject.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('edit')
    end
  end

  def destroy
    @page.destroy
    flash[:success] = "Page destroyed successfully."
    redirect_to(:action => 'index', :subject_id => @subject.id)
  end


  private

  def set_page
    @page = Page.find(params[:id])
  end

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end

  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end

end
