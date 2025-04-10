module PostsHelper
    def find_youtube_url(youtube_video)
      if youtube_video.include?("https://youtu.be/")
        youtube_video.gsub("https://youtu.be/", "")
        # "https://youtu.be/WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
      else youtube_video.include?("https://www.youtube.com/watch?v=")
        youtube_video.gsub("https://www.youtube.com/watch?v=", "")
        # "https://www.youtube.com/watch?v=WGiUk8VakxQ" 11桁のyoutubeのURLが出力されるようにする
      end
    end
end
