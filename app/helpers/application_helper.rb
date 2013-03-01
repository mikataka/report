module ApplicationHelper
  def preautolink(text)
    @user = current_user.id
    text = text.gsub(/</, '&lt;')
    return text.gsub(/link_to\((http.*?)\)/, '</pre><a id="link" href="\\1">\\1</a><pre>').gsub(/img\((.*?)\)/, "</pre><img src=\"/picture/#{@user}/\\1\"><pre>")
#    return text.gsub(/link_to\((http.*?)\)/, '</pre><a id="link" href="\\1">\\1</a><pre>').gsub(/img\((.*?), (.*?), (.*?)\)/, "</pre><img width=\"\\2\" height=\"\\3\" src=\"/picture/#{@user}/\\1\"><pre>")
#    return text.gsub(/img\((.*?)\)/, '</pre><img src="/picture/#{@user}/\\1"><pre>')
  end
end
