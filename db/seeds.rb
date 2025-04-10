30.times do |n|
    Post.create!(
      title: Faker::Movie.title,
      youtube_video: "https://youtu.be/8wwD-Jnveso?si=b9qM9AagIkTjFPC_",
      body: "hogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyohogehogepiyopiyo"
    )
end
