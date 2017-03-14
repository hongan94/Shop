class HomeController < ApplicationController

  def index
    agent = Mechanize.new
    page = agent.get "https://www.adayroi.com"
    @post_array = []

    #Mỗi 1 post được bao bởi thẻ div esc-body
    list_post = page.search "div.mega-menu-content"

    #Với mỗi post lấy được, tìm kiếm nội dung bên trong
    list_post.each_with_index do |post, num|
      #Lấy nội dụng title
      elementa = post.search("a")
      elementa.each_with_index do |v, n|
        title= v.attributes['title'].value
        description= v.attributes['title'].value
        link= v.attributes["href"].value
        image=v.at("img").attributes["src"].value
        @post_array[n] = {title: title, description: description, link: link, image: image }
      end
    end
  end
end
