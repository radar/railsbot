class UserNuker
  attr_reader :name

  def initialize(name, wordlist = nil)
    @name         = clean(name)
    @reverse_name = @name.reverse
    @wordlist     = wordlist
  end

  # Checks to see if the username is in any way related to a naughty
  # word, including its reverse.
  #
  # @return [Integer] Count of hits
  def is_bad?
    return 0 if excluded?
    combinations.select do |c|
      @name.include?(c) || @reverse_name.include?(c)
    end.count
  end

  def excluded?
    ["pen", "noobfag", "karapetyan", "dudepare", "ignazioc", "mlkkk"].detect do |n|
      name == n || /#{n}_?/.match(name)
    end
  end

  # Our naughty wordlist
  #
  # @return [Array[String]]
  def wordlist
    @wordlist ||= %w(
      fuck
      migger
      nigger
      nijjer
      bitch
      cunt
      fag
      faggot
      damn
      damnit
      shit
      shitt
      penis
      hitler
      nazi
      rape
      kkk
    )
  end

  # Potential word endings to look for as well to get
  # a stronger match
  #
  # @return [Array[String]]
  def endings
    @endings ||= %w(
      ing
      er
      it
    )
  end

  # Combinations of words with endings
  #
  # @return [Array[String]]
  def combinations
    @combinations ||=
      wordlist + wordlist.product(endings).flat_map(&:join)
  end

  # Take care of simple character substitution
  #
  # @return [Hash[String, String]]
  def leet_sub
    @leet_sub ||= {
      ?1 => ?i,
      ?2 => ?z,
      ?3 => ?e,
      ?4 => ?a,
      ?5 => ?s,
      ?6 => ?g,
      ?7 => ?t,
      ?8 => ?b,
      ?0 => ?o,
      ?@ => ?a,
      ?$ => ?s
    }
  end

  # Cleans a name of spaces and other unnecessary characters,
  # and translates to alphabetical characters
  #
  # @param name [String] Original name
  #
  # @return [String] cleaned variant of the name
  def clean(name)
    name.downcase.delete('_ ').chars.map { |c|
      leet_sub[c] || c
    }.join
  end
end
