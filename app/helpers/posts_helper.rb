module PostsHelper
    def find_youtube_url(youtube_url)
      if youtube_url.include?("https://youtu.be/")
        youtube_url.strip!.gsub("https://youtu.be/", "")
        # "https://youtu.be/WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
      else
        youtube_url.strip!.gsub("https://www.youtube.com/watch?v=", "")
        # "https://www.youtube.com/watch?v=WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
      end
    end
end
