require 'pacfilter/java_iterator'
require 'rjb'

module Pacfilter
  class WordAnalyzer
    include JavaIterator

    def initialize
      jar_path =  File.expand_path(File.dirname(__FILE__)) + "/../jar"
      Rjb::load("#{jar_path}/kuromoji-0.7.7.jar")
      tokenizer = Rjb::import('org/atilika/kuromoji/Tokenizer')
      @tagger = tokenizer.builder.build
    end

    def analyze_sentence sentence
      results = []
      list = @tagger.tokenize(sentence)
      list.extend JavaIterator
      list.each do |x|
        word = x.surface_form
        features = x.all_features.split(',')
        pos = features[0] # 一番目の助詞をメインとして扱う
        if !is_uncheck_pos(pos) && !is_exception_word(word)
          results << word
        end
      end
      return results
    end

    # チェックから外す品詞
    def is_uncheck_pos pos
      if pos.eql?("助詞") || pos.eql?("助動詞") || pos.eql?("格助詞")
        return true
      end
      return false
    end

    # チェックから外すワード
    def is_exception_word word
      if word =~ /[0-9]+/
        return true
      end
      return false
    end

  end 
end
