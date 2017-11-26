class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each { |line| puts line }
  end
end

first_lyrics = [
  "Happy birthday to you",
  "I don't want to get sued",
  "So I'll stop right there"
]

happy_bday = Song.new(first_lyrics)

second_lyrics = [
  "They rally around tha family",
  "With pockets full of shells"
]

bulls_on_parade = Song.new(second_lyrics)

happy_bday.sing_me_a_song()
bulls_on_parade.sing_me_a_song()
