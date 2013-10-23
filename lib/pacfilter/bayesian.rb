# coding: utf-8
require 'rubygems'
require 'pacfilter/word_analyzer'
require 'mongo'
require 'mysql2'
require 'yaml'

module Pacfilter

  #=単語フィルタ
  # ベイジアンフィルタクラス
  class PACFilter
    include Mongo
    # コンストラクタ
    def initialize dbtype=:mysql, cfg={}
      config_path = File.expand_path(File.dirname __FILE__) + "/../config"
      config = YAML.load_file("#{config_path}/default.yml")
      case dbtype
      when :mysql
        config = config[:mysql] # convert mysql config
        config.merge cfg # apply user configuration
        @con = Mysql2::Client.new(:host => config[:host],
                                  :username => config[:user],
                                  :port => config[:port])
      when :mongo
        config = config[:mongo] # convert mysql config
        config.merge cfg # apply user configuration
        @con = MongoClient.new(config[:host],config[:port])
        @db = @con.db(config[:dbname])
      end
      @tagger = WordAnalyzer.new
    end

    # 1単語でのフィルタリング
    # TODO: アルゴリズムの実装.
    def normal_filtering sentence
      words = @tagger.analyze_sentence sentence
    end

    # 2単語でのフィルタリング
    # TODO: アルゴリズムの実装.
    def co_filtering sentence
      words = @tagger.analyze_sentence sentence
    end
  end
  
end
