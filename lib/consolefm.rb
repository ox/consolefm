require 'open-uri'
require 'hpricot'

class ConsoleFM
  GENRES = ["breaks", "chill-out", "deep-house", "drum-and-bass", "dubstep", "electro-house", "electronica", "funk-r-and-b",
      "glitch-hop", "hard-dance", "hardcore-hard-techno", "hip-hop", "house", "indie-dance-nu-disco", "minimal", "pop-rock",
      "progressive-house", "psy-trance", "reggae-dub", "tech-house", "techno", "top", "trance"]

  def self.genres
    return GENRES
  end

  def self.valid_genre? genre
    return GENRES.include? genre
  end

  # returns an array full of arrays that look like:
  # [title,artist, href]
  def self.tracks genre
    raise 'no such genre' if !(valid_genre? genre)
    tracks = []
    (open("http://console.fm/electro-house") { |html| Hpricot(html) }).search("a[@href*=media.console.fm/tracks]").each do |a|
      tracks << [a.inner_html.match(/(.*?) by (.*?)$/)[1..2], a.get_attribute('href')].flatten
    end
    return tracks
  end
end
