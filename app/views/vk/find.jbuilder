json.data @result do |song|
  if song.is_a?(Hash)
    json.id song.aid
    json.title song.title
    json.artist song.artist
    json.url song.url
  end
end
