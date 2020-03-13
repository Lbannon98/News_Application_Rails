class ProfanityFilter

  def self.check(input)

    downcase = input.downcase

    swear_words = {'fuck' => 'f**k', 'feck' => 'f**k', 'bitch' => 'b**ch',
                   'gimp' => 'g**p', 'bastard' => 'b*s**rd',
                   'dickhead' => 'd**kh**d', 'shithead' => 's**th**d',
                   'scumbag' => 's**mb*g'}

    swear_words.each do |word, clean|
      downcase.gsub!(word,clean)
    end

    puts downcase
    return downcase

  end

end