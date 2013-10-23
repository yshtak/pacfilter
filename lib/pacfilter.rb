# coding: utf-8
require "pacfilter/version"
require "pacfilter/bayesian"

module Pacfilter
#  extend Bayesian
#  # Your code goes here...
#  #
  def self.instance dbtype=:mysql, cfg={}
    return Filter.new dbtype, cfg
  end
#
  class Filter
    def initialize dbtype=:mysql, cfg={}
      @pacf = PACFilter.new dbtype, cfg
    end

    def filtering sentence, type=:default
      case type
      when :default
        @pacf.normal_filtering sentence
      when :cofilter
        @pacf.co_filtering sentence
      end
    end
  end
end
