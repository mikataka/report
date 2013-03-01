# -*- coding: utf-8 -*-
class CommentsController < ApplicationController

before_filter :edit_check

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @repbody = Repbody.find(params[:repbody_id])
    @comment = Comment.new
    @comment.repbody_id = @repbody.id
    @user = User.find(@repbody.user_id)
    @comment.user_id = current_user.id
#    @repbody.commentexis = "ok"
#    @repbody.save
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @repbody = Repbody.find(params[:repbody_id])
    @repbody.commentexis = "ok"
    @repbody.save
    @update = Update.new
    @current = Time.now
    @comment.date = @current.strftime('%Y-%m-%d %H:%M:%S')
    respond_to do |format|
      if @comment.save
        @update.date = @current.strftime('%Y-%m-%d %H:%M:%S')
        @update.comment = "コメント追加"
        @update.repbody_id = @repbody.id
        @update.save
        format.html { redirect_to user_repbody_path(@repbody.user_id, @repbody.id), :notice => '【メッセージ】コメントは正しく付与されました.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to mypage_path(current_user.id), :notice => '【メッセージ】コメントは正しく更新されました.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

#=begin
  def edit_check
    #    @repbody = Repbody.find(params[:repbody_id])
    @role = Role.find(:first, :conditions => ["position = ?", '受講生'])
    if current_user.role_id.to_i == @role.id.to_i
       #      repbody = Repbody.find(current_user.id)
      redirect_to mypage_path(current_user.id) , :notice => "【注意】#{@role.position} のコメント付与は許可されていません."
    end
  end
  #=end
end
