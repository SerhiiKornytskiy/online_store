class CommentsController < ApplicationController

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html 
      format.json { render json: @comment }
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end


  def create
    @comment = Comment.new(params[:comment])
    Comment.censore(@comment)
    respond_to do |format|
      if @comment.save
        redirect_to :back
      else
        format.html { redirect_to :back }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to store_url, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
