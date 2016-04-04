class SectionsController < ApplicationController

  layout "admin"

  before_action :find_page
  before_action :set_section, only: [:show, :edit, :update, :destroy]


  def index
    @sections = @page.sections.sorted
  end

  def show
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => "Default"})
    @pages = @page.subject.pages.sorted
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "Section created successfully."
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @pages = @page.subject.pages.sorted
      @section_count = Section.count + 1
      render('new')
    end
  end

  def edit
    @pages = @page.subject.pages.sorted
    @section_count = Section.count
  end

  def update
    if @section.update_attributes(section_params)
      flash[:success] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @pages = @page.subject.pages.sorted
      @section_count = Section.count
      render('edit')
    end
  end

  def destroy
    @section.destroy
    flash[:success] = "Section destroyed successfully."
    redirect_to(:action => 'index', :page_id => @page.id)
  end


  private

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

end
