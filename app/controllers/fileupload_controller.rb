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
    if file.nil?
      result = 'アップロードするファイルが選択されていません'
      redirect_to fileupload_path, :notice => "#{result}"
    elsif
      name = file.original_filename
      perms = ['.jpg', '.gif', '.png', '.html', '.htm', '.css', '.sh', '.zip', '.gz']
      if !perms.include?(File.extname(name).downcase)
        result = 'アップロードできるのは画像ファイル, HTMLファイル, css ファイル, shファイル, zip ファイル, tar.gz ファイルのみです'
        redirect_to fileupload_path, :notice => "#{result}"
      elsif file.size > 10.megabyte
        result = 'ファイルサイズは 10MB までです'
        redirect_to fileupload_path, :notice => "#{result}"
      else
        if ['.jpg', '.gif', '.png'].include?(File.extname(name).downcase)
          name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
          picdir = "public/picture/#{current_user.id.to_s}"
          unless File.exists?("#{picdir}")
            Dir::mkdir("/home/suu/report/#{picdir}")
          end
          File.open("#{picdir}/#{name}", 'wb') {|f| f.write(file.read)}
        end
        if ['.html', '.htm', '.css'].include?(File.extname(name).downcase)
          name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
          htmldir = "public/html/#{current_user.id.to_s}"
          unless File.exists?("#{htmldir}")
            Dir::mkdir("/home/suu/report/#{htmldir}")
          end
          File.open("#{htmldir}/#{name}", 'wb') {|f| f.write(file.read)}
        end
        if ['.sh'].include?(File.extname(name).downcase)
          name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
          shdir = "public/sh/#{current_user.id.to_s}"
          unless File.exists?("#{shdir}")
            Dir::mkdir("/home/suu/report/#{shdir}")
          end
          File.open("#{shdir}/#{name}", 'wb') {|f| f.write(file.read)}
        end
        if ['.zip'].include?(File.extname(name).downcase)
          name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
          zipdir = "public/zip/#{current_user.id.to_s}"
          unless File.exists?("#{zipdir}")
            Dir::mkdir("/home/suu/report/#{zipdir}")
          end
          File.open("#{zipdir}/#{name}", 'wb') {|f| f.write(file.read)}
        end
        if ['.gz'].include?(File.extname(name).downcase)
          name = name.kconv( Kconv::SJIS, Kconv::UTF8 )
          targzdir = "public/targz/#{current_user.id.to_s}"
          unless File.exists?("#{targzdir}")
            Dir::mkdir("/home/suu/report/#{targzdir}")
          end
          File.open("#{targzdir}/#{name}", 'wb') {|f| f.write(file.read)}
        end
        result = "#{name.toutf8} をアップロードしました"
        @myfile = Myfile.new
        @myfile.user_id = current_user.id
        @myfile.filename = name
        @myfile.caption = params[:caption].to_s
        @myfile.save
        redirect_to user_fileupload_index_path(current_user.id), :notice => "#{result}"
      end
    end
  end

  def destroy
    @myfile = Myfile.find(params[:id])
    @myfile.destroy

    respond_to do |format|
      format.html { redirect_to user_fileupload_index_path(current_user.id) }
      format.json { head :no_content }
    end
  end


  
  private
  def user_checked 
    unless params[:user_id].to_i == current_user.id 
      repbody = Repbody.find(current_user.id) 
      redirect_to user_repbody_path(current_user, repbody.id) , :notice => "#{request.path}にはアクセスできません" 
    end 
  end 
end
