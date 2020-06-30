class NotesController < ApplicationController

  def index
    # @noteboard = Note.all
    @noteboard = params[:method] == 'sort' ? Note.all.order(:title) : Note.all
    
  
  end

  def create
    puts "------------------"
    puts params

    @note = Note.new(strongparams)    
    @note.save
    p @note
    redirect_to note_path(@note.id)
    
    # store the data coming from the form into rails session names notes
    # if session[:notes] == nil
    #     session[:notes] = []
    # end
    # session[:notes].push(params[:notes])
    # # redirect to the show html page
    # redirect_to note_path(session[:notes].length)

  end

  def new
    @note = Note.new

  end

  def show
    @note = Note.find(params[:id])
  end
  

  def edit 
    @note = Note.find(params[:id])
    
  end  

  def update
    @note = Note.find(params[:id])
    @note.update(strongparams)
    @note.save
    redirect_to note_path(@note.id)

  end

  def delete
    @note = Note.find(params[:id])
    @note.destroy
  end

  private 
  def strongparams
    params.require(:note).permit(:title, :content)

  end

end