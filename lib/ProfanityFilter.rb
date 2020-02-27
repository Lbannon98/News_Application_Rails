class ProfanityFilter

  def self.check(input)

    downcase = input.downcase

    swear_words = {'fuck' => 'f**k', 'feck' => 'f**k', 'bitch' => 'b**ch', 'cunt' => 'c**t', 'gee' => 'g**',
                   'wanker' => 'w*nk*r', 'gimp' => 'g**p', 'shit' => 's**t', 'bastard' => 'b*s**rd',
                   'bollox' => 'b*l**x', 'dickhead' => 'd**kh**d', 'wank' => 'w**k', 'shithead' => 's**th**d',
                   'pussy' => 'p**sy', 'retard' => 'r*t**d', 'scumbag' => 's**mb*g',
                   'fag' => 'f**', 'faggot' => 'f*g**t', 'dyke' => 'd**e', 'scum' => 's**m', 'dick' => 'd**k'}

    swear_words.each do |word, clean|
      downcase.gsub!(word,clean)
    end

    puts downcase
    return downcase

  end

end