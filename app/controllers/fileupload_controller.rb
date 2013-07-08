# -*- coding: utf-8 -*-
require 'kconv'
class FileuploadController < ApplicationController
  before_filter :user_checked, :only => ['index']  
  def index
    @myfiles = Myfile.find_all_by_user_id(current_user.id.to_i)
    @user = User.find_by_id(current_user.id.to_i)
    @h1 = "#{@user.username.to_s} さんのアップロードしたもの "
  end

  def upload_process
    file = params[:upfile]
    name = file.original_filename
    perms = ['.jpg', '.gif', '.png', '.html', '.htm', '.css', '.sh']
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロードできるのは画像ファイル, HTMLファイル, css ファイル, shファイルのみです'
    elsif file.size > 1.megabyte
      result = 'ファイルサイズは 1MB までです'
    else
      if ['.jpg', '.gif', '.png'].include?(File.extname(name).downcase)
        name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
        picdir = "public/picture/#{current_user.id.to_s}"
        unless File.exists?("#{picdir}")
          Dir::mkdir_p("/home/suu/report/#{picdir}")
        end
        File.open("#{picdir}/#{name}", 'wb') {|f| f.write(file.read)}
      end
      if ['.html', '.htm', '.css'].include?(File.extname(name).downcase)
        name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
        htmldir = "public/html/#{current_user.id.to_s}"
        unless File.exists?("#{htmldir}")
          Dir::mkdir_p("/home/suu/report/#{htmldir}")
        end
        File.open("#{htmldir}/#{name}", 'wb') {|f| f.write(file.read)}
      end
      if ['.sh'].include?(File.extname(name).downcase)
        name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
        shdir = "public/sh/#{current_user.id.to_s}"
        unless File.exists?("#{shdir}")
          Dir::mkdir_p("/home/suu/report/#{shdir}")
        end
        File.open("#{shdir}/#{name}", 'wb') {|f| f.write(file.read)}
      end
      result = "#{name.toutf8} をアップロードしました"
      @myfile = Myfile.new
      @myfile.user_id = current_user.id
      @myfile.filename = name
      @myfile.caption = params[:caption].to_s
      @myfile.save
    end
    redirect_to fileupload_path, :notice => "#{result}"
  end
  
  private
  def user_checked 
    unless params[:user_id].to_i == current_user.id 
      repbody = Repbody.find(current_user.id) 
      redirect_to user_repbody_path(current_user, repbody.id) , :notice => "#{request.path}にはアクセスできません" 
    end 
  end 
end
