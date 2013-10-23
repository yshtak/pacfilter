# coding: utf-8
require 'pacfilter/word_analyzer'
require 'mongo'
require 'mysql2'
require 'yaml'

module Pacfilter

  # 単語フィルタ
  class Bayesian
    def initialize dbtype=:mysql
      case dbtype
      when :mysql
      when :mongo
      end
      @tagger = WordAnalyzer.new
    end

    def filtering sentence
      words = @tagger.analyze_sentence sentence
      
    end
  end

  # 共起フィルタ
  class CoBayesian
    def initialize dbtype=:mysql
      case dbtype
      when :mysql
      when :mongo
      end
      @tagger = WordAnalyzer.new
    end

    def filtering sentence
      words = @tagger.analyze_sentence sentence
    end
  end

end
