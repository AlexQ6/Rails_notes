class NotesController < ApplicationController

  def index
    @noteboard = Note.all
  
  end

  def create
    puts "------------------"
    puts params

    @note = Note.new(strongparams)
    # @note.title = params[:title]
    # @note.content = params[:content]
    
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