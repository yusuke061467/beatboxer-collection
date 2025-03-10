class CreateYoutubeVideos < ActiveRecord::Migration[7.2]
  def change
    create_table :youtube_videos do |t|
      t.string :url

      t.timestamps
    end
  end
end
