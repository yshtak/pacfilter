require 'pacfilter/word_analyzer'

module Pacfilter

  class Bayesian
    def initialize
      @tagger = WordAnalyzer.new
    end

    def filter_docment sentence
      words = @tagger.analyze_sentence sentence
      p words
    end
  end
end
