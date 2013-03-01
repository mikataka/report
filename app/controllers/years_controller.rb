# -*- coding: utf-8 -*-
class YearsController < ApplicationController
before_filter :edit_check

  # GET /years
  # GET /years.json
  def index
    @years = Year.all
#    Year.update_all(:default => 'f')
    @thisyear = Year.find(:first, :conditions => {:default => 't'})
    if params[:updateyear] == '1'
      @year = Year.new
      Year.update_all(:default => 'f')
#      change_column_default :articles, :title, nil
#      connection.execute("SELECT COUNT(*) FROM persons;")
      @year.year = @thisyear.year.to_i + 1
      @year.default ='t'
      respond_to do |format|
        if @year.save
          format.html { redirect_to years_path, notice: '年度を更新しました.' }
#          format.json { render json: years_create_path, status: :created, location: @year }
        else
          format.html { render action: "new" }
          format.json { render json: @year.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @year }
      end
    end
  end
  
  

end
  private
  def edit_check
    @roles = Role.all
    @role = Hash.new
    @roles.each do |role|
      @role["#{role.id}"] = role.position 
    end
    if @role["#{current_user.role_id}"] == '受講生' 
      redirect_to mypage_path(current_user.id) , :notice => "この先は通さん！" 
    end 
  end 
