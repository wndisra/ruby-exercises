require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {
  "class ### < ###\nend" => "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" => "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" => "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" => "Set *** to an instance of class ###.",
  "***.***(@@@)" => "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" => "From *** get the *** attribute and set it to '***'."
}

PHRASE_FIRST = ARGV[0] == 'english'

# Read URL & push the content to WORDS array
open(WORD_URL) {|f|
  f.each_line { |word| WORDS.push(word.chomp) }
}

def craft_names(rand_words, snippet, pattern, caps=false)
  # Scan pattern inside snippet str (return array) and map it to get random word
  # Use map to mapping array element into new array
  names = snippet.scan(pattern).map do
    word = rand_words.pop()
    caps ? word.capitalize : word
  end

  # Why we need to return this array two times?
  return names * 2
end

def craft_params(rand_words, snippet, pattern)
  names = (0...snippet.scan(pattern).length).map do
    param_count = rand(3) + 1
    params = (0...param_count).map { |x| rand_words.pop() }
    params.join(', ')
  end

  # Why we need to return this array two times?
  return names * 2
end

def convert(snippet, phrase)
  # Randomly sort words array (something similar to shuffle)
  rand_words = WORDS.sort_by {rand}

  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|
    # Substitute pattern with another word from class_names array
    result = sentence.gsub(/###/) { |x| class_names.pop }

    # Substitute pattern with another word from other_names array
    # It will return new_str or nil if no substitution were performed
    result.gsub!(/\*\*\*/) { |x| other_names.pop }

    # Substitute pattern with another word from param_names array
    result.gsub!(/@@@/) { |x| param_names.pop }

    results.push(result)
  end

  return results
end

# This will loop forever unless you kill it with Ctrl + c
loop do
  # Get all keys from PHRASES and sort it randomly
  snippets = PHRASES.keys().sort_by { rand }

  for snippet in snippets
    phrase = PHRASES[snippet]

    # Use the returned array in the same order
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      question, answer = answer, question
    end

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER: %s\n\n" % answer
  end
end
