class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :delete]
  before_action :authorize, only: [:index, :show, :edit, :update, :delete]
  def index
    # @noteboard = Note.all
    @noteboard = params[:method] == 'sort' ? Note.all.order(:title) : Note.all
    
  
  end


  def create
    puts "------------------"
    puts params

    @note = Note.new(strongparams)
    @note.user = current_user
    @note.save
    
    p @note
    redirect_to note_path(@note.id)
    
  end

  def new
    # Understand use to facilitate partial, but error post route uses notes/new (which is wrong) confusing
    @note = Note.new

  end

  def show
    
  end
  

  def edit 
    
    
  end  

  def update
    
    @note.update(strongparams)
    # @note.save
    redirect_to note_path(@note.id)

  end

  def delete
    
    @note.destroy
    redirect_to notes_path
  end

  private 

  def set_note
    @note = Note.find(params[:id])
  end


  def strongparams
    # par = params.require(:note).permit(:title, :content)
    # par[:user] = User.param[:user]
    params.require(:note).permit(:title, :content, :picture)
    

  end

end