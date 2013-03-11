# -*- coding: utf-8 -*-
class RepbodiesController < ApplicationController
  before_filter :user_checked, :except => ['index', 'show', 'edit', 'opinion']
  before_filter :edit_checked, :only => ['edit']

  # GET /repbodies
  # GET /repbodies.json
  def index
    @thisyear = Year.find(:first, :conditions => {:default => 't'})
    @yearserch = params[:yearserch].to_i
    @years = Year.all
    @year_name = Array.new
    @years.each do |year|
      @year_name[year.id.to_i] = year.year.to_s
    end
    @tagserch = 0
    @tagserch = params[:tagserch].to_i
    @tags = Tag.all
    @tag_name = Array.new
    @tags.each do |tag|
      @tag_name[tag.id.to_i] = tag.tag.to_s
    end
    @tag_name.delete_at(0)

    if @tagserch != 0 && @yearserch != 0
#      @repbodies = Repbody.find_all_by_tag_id(@tagserch, :order => 'updated_at DESC')
      @repbodies = Repbody.find(:all, :conditions => {:year => @year_name[@yearserch], :tag_id => @tagserch}, :order => 'updated_at DESC')
      @h1 = "#{@year_name[@yearserch]} 年度のタグ「#{@tag_name[@tagserch -1]}」のレポート一覧"
    elsif @tagserch == 0 && @yearserch != 0
      @repbodies = Repbody.find(:all, :conditions => {:year => @year_name[@yearserch]}, :order => 'updated_at DESC')
      @h1 = "#{@year_name[@yearserch]} 年度のレポート一覧"      
    elsif @tagserch != 0 && @yearserch == 0
      @repbodies = Repbody.find(:all, :conditions => {:tag_id => @tagserch}, :order => 'updated_at DESC')
      @h1 = "全年度のタグ「#{@tag_name[@tagserch - 1]}」のレポート一覧"      
    else
      @repbodies = Repbody.find(:all, :order => 'updated_at DESC')
#      @repbodies = Repbody.find(:all, :order => 'updated_at DESC')
      @h1 = "全レポート一覧"

    end
    @users = User.all
    @usernameh = Hash::new
    @users.each do |user|
      @usernameh["#{user.id}"] = user.username 
    end

    @comment = Comment.all
#    @role = Role.find(:first, :conditions => ["position = ?", '受講生'])
    @roleh =Hash::new
    @roles = Role.all
    @roles.each do |role|
      @roleh["#{role.id}"] = role.position
    end
    respond_to do |format|
      format.html # index.html.erb   
      format.json { render json: @repbodies }
    end
  end
  # GET /repbodies/opinion
  # GET /repbodies/opinion.json
  def opinion
    @users = User.all
    @usernameh = Hash::new
    @users.each do |user|
      @usernameh["#{user.id}"] = user.username 
    end
    @tags = Tag.all
    @tag_name = Array.new
    @tags.each do |tag|
      @tag_name[tag.id.to_i] = tag.tag.to_s
    end
    @tag_name.delete_at(0)
    @repbodies = Repbody.find_all_by_tag_id(6, :order => 'updated_at DESC')
    @comment = Comment.all
    @role = Role.find(:first, :conditions => ["position = ?", '受講生'])
    respond_to do |format|
      format.html # opinion.html.erb   
      format.json { render json: @repbodies }
    end
  end

  # GET /repbodies/1
  # GET /repbodies/1.json
  def show
#    @repbody = Repbody.find_all_by_user_id(params[:user_id])
    @repbodyidshow = Repbody.find(params[:id])
    @users = User.all
    @usernameh = Hash::new
    @users.each do |user|
      @usernameh["#{user.id}"] = user.username 
    end
    @tag = Tag.find(@repbodyidshow.tag_id)
    @comments = Comment.find_all_by_repbody_id(@repbodyidshow.id)
    @updates = Update.find_all_by_repbody_id(@repbodyidshow.id)
    @hyperlinks = Hyperlink.find_all_by_repbody_id(@repbodyidshow.id)
    @urlhere = request.url
    @roleh =Hash::new
    @roles = Role.all
    @roles.each do |role|
      @roleh["#{role.id}"] = role.position
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @repbody }
    end
  end

  # GET /repbodies/new
  # GET /repbodies/new.json
  def new
    @repbody = Repbody.new
      @slink = Array.new
    for i in 1..5 do
      @hyperlink_#{i} = Hyperlink.new
      @slink << @hyperlink_#{i}
    end

    @tag = Tag.all

    if current_user.id
      @repbody.user_id = current_user.id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @repbody }
    end
  end

  # GET /repbodies/1/edit
  def edit
    @repbody = Repbody.find(params[:id])
    @tag = Tag.all
      @slink = Array.new
    for i in 1..5 do
      @hyperlink_#{i} = Hyperlink.new
      @slink << @hyperlink_#{i}
    end

    @hyperlinks = Hyperlink.find_all_by_repbody_id(@repbody.id)

#    @repbodyu = Repbody.find_all_by_user_id(params[:id])
#    @repbody = @repbody.find(params[:id])
  end

  # POST /repbodies
  # POST /repbodies.json
  def create
    @repbody = Repbody.new(params[:repbody])
#    @hyperlink = Hyperlink.new(params[:hyperlinks])
    @slink = params[:slink].to_a

#    @hyperlink1 = Hyperlink.new
#    @hyperlink2 = Hyperlink.new
#    @hyperlink3 = Hyperlink.new
#    @hyperlink1.attributes = {:link => "params[:hyperlinks[link[0]]]", :repbody_id => @repbody.id }
#    @hyperlink2.attributes = {:link => "params[:hyperlinks{link[1]]]", :repbody_id => @repbody.id }
#    @hyperlink3.attributes = {:link => "params[:hyperlinks[link[2]]]", :repbody_id => @repbody.id }
#    @hyperlinka = [@hyperlink1,@hyperlink2,@hyperlink3]
    


    @update = Update.new
    @current = Time.now
    @update.date = @current.strftime('%Y-%m-%d %H:%M:%S')
    @update.comment = "レポート新規作成"
    @repbody.date = @current.strftime('%Y-%m-%d %H:%M:%S')
    @thisyear = Year.find(:first, :conditions => {:default => 't'})
    @repbody.year = @thisyear.year.to_i
    respond_to do |format|
      if @repbody.save
        for i in 0...@slink.length do
          @hyperlink = Hyperlink.new
          @hyperlink.repbody_id = @repbody.id
          @hyperlink.link = @slink[i][1]['link'].to_s
          @hyperlink.title = @slink[i][1]['title'].to_s
          unless @hyperlink.link.empty?
            @hyperlink.save
          end
        end

        #        @hyperlink.repbody_id = @repbody.id
#        @hyperlink.save
#        @hyperlinka.each do |m|
#            m.save
#          end
        @update.repbody_id = @repbody.id
        @update.save
        if current_user.id
          format.html { redirect_to user_repbody_path(current_user,@repbody.id), notice: "#{@slink} 【メッセージ】レポートを投稿しました." }
          #          format.html { redirect_to mypage_path(current_user.id), notice: 'Repbody was successfully created.' }
          format.json { render json: @repbody, status: :created, location: @repbody }
        else
          format.html { redirect_to @repbody, notice: 'Repbody was successfully created.' }
          format.json { render json: @repbody, status: :created, location: @repbody }
          #        format.html { redirect_to @repbody, notice: 'Repbody was successfully created.' }
          #        format.json { render json: @repbody, status: :created, location: @repbody }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @repbody.errors, status: :unprocessable_entity }
      end
      end
    end
    
    # PUT /repbodies/1
  # PUT /repbodies/1.json
  def update
    @repbody = Repbody.find(params[:id])
    @update = Update.new
    @current = Time.now
    @repbody.date = @current.strftime('%Y-%m-%d %H:%M:%S')
    @slink = params[:slink].to_a

#    rescue ActiveRecord::StaleObjectError


    respond_to do |format|

      if @repbody.update_attributes!(params[:repbody])

        @update.date = @current.strftime('%Y-%m-%d %H:%M:%S')
        @update.comment = "レポート更新"
        @update.repbody_id = @repbody.id
        @update.save

        for i in 0...@slink.length do
          @hyperlink = Hyperlink.new
          @hyperlink.repbody_id = @repbody.id
          @hyperlink.link = @slink[i][1]['link'].to_s
          @hyperlink.title = @slink[i][1]['title'].to_s
          unless @hyperlink.link.empty?
            @hyperlink.save
          end
        end
        format.html { redirect_to [current_user, @repbody ], notice: "【メッセージ】レポートを更新しました." }
        format.json { head :no_content }

      else
        format.html { render action: "edit" }
        format.json { render json: @repbody.errors, status: :unprocessable_entity }
      end

    end


      
end
  # DELETE /repbodies/1
  # DELETE /repbodies/1.json
  def destroy
    @repbody = Repbody.find(params[:id])
    @repbody.destroy

    respond_to do |format|
      format.html { redirect_to repbodies_url }
      format.json { head :no_content }
    end
  end

  private 
  def user_checked 
    unless params[:user_id].to_i == current_user.id 
      repbody = Repbody.find(current_user.id) 
      redirect_to user_repbody_path(current_user, repbody.id) , :notice => "【警告】#{request.path}にはアクセスできません" 
    end 
  end 
  def edit_checked 
    @repbody = Repbody.find(params[:id])
    unless @repbody.user_id.to_i == current_user.id 
      repbody = Repbody.find(current_user.id) 
      redirect_to user_repbody_path(current_user, repbody.id) , :notice => "【警告】#{request.path}にはアクセスできません" 
    end 
  end 


end
