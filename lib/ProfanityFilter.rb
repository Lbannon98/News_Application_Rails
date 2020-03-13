class ProfanityFilter

  def self.check(input)

    downcase = input.downcase

    swear_words = {'fuck' => 'f**k', 'feck' => 'f**k', 'bitch' => 'b**ch',
                   'dick' => 'd**k', 'shit' => 's**t'}

    swear_words.each do |word, clean|
      downcase.gsub!(word,clean)
    end

    puts downcase
    return downcase

  end

end