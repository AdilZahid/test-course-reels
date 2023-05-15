require "google/apis/youtube_v3"

class YoutubeService
  public

  def upload_video_to_youtube(videos, user)

    # Initialize YouTube API client
    client = Google::Apis::YoutubeV3::YouTubeService.new
    client.authorization = user.youtube_token
    # Create new video object

    video = Google::Apis::YoutubeV3::Video.new(
      snippet: {
        title: videos.title,
        description: videos.description,
        tags: ["tag1", "tag2"],
      },
      status: {
        privacy_status: videos.privacy_status,
      },
    )

    video_file_path = "vecteezy_video-countdown-counter-with-rounded-corners-for-10-to-1-on_5965601_897.mp4"
    # video_file_url = "localhost:3000/"+Rails.application.routes.url_helpers.rails_blob_url(videos.video_file, only_path: true)

    # Set video content
    begin
      # Upload the video using the `insert_video` method
      video_object = client.insert_video("snippet,status", video, upload_source: video_file_path, content_type: "video/*")
      # Once the video is uploaded, you can access the video's information
      puts "Video ID: #{video_object.id}"
      puts "Video Title: #{video_object.snippet.title}"
    rescue Google::Apis::ClientError => e
      puts "Error uploading video: #{e.message}"

      # Update video URL in database

    end
  end
end
