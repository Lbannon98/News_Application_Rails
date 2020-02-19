class ProfanityFilter

  def self.check(input)

    input.downcase.strip

    swear_words = {'fuck' => 'f**k', 'bitch' => 'b**ch', 'cunt' => 'c**t', 'gee' => 'g**',
                   'wanker' => 'w*nk*r', 'gimp' => 'g**p', 'shit' => 's**t', 'bastard' => 'b*s**rd',
                   'bollox' => 'b*l**x', 'dickhead' => 'd**kh**d', 'wank' => 'w**k', 'shithead' => 's**th**d',
                   'pussy' => 'p**sy', 'retard' => 'r*t**d', 'scumbag' => 's**mb*g',
                   'fag' => 'f**', 'faggot' => 'f*g**t', 'dyke' => 'd**e', 'scum' => 's**m'}

    swear_words.each do |word, clean|
      input.gsub!(word,clean)
    end

    puts input

  end
end


#puts "Input your sentence here: "
#
#text = gets.downcase.strip
#
#swear_words = {'fuck' => 'f**k', 'bitch' => 'b**ch', 'cunt' => 'c**t', 'gee' => 'g**',
#               'wanker' => 'w*nk*r', 'gimp' => 'g**p', 'shit' => 's**t', 'bastard' => 'b*s**rd',
#               'bollox' => 'b*l**x', 'dickhead' => 'd**kh**d', 'wank' => 'w**k', 'shithead' => 's**th**d',
#               'pussy' => 'p**sy', 'retard' => 'r*t**d', 'scumbag' => 's**mb*g',
#               'fag' => 'f**', 'faggot' => 'f*g**t', 'dyke' => 'd**e', 'scum' => 's**m'}
#
#swear_words.each do |word, clean|  # No need to copy here
#  text.gsub!(word,clean)  # Changed from gsub
#end
#
#puts text  # Changed from clean_text