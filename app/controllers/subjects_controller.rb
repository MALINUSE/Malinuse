class SubjectsController < ApplicationController

  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:success] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject_count = Subject.count
  end

  def update
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to the index action
      flash[:success] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If update fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render('edit')
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:subject).permit(:name, :position, :visible, :date_subject)
  end

end
