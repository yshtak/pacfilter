require "pacfilter/version"
require "pacfilter/bayesian"

module Pacfilter
#  extend Bayesian
#  # Your code goes here...
#  #
  def instance
    return Filter.new
  end
#
  class Filter
    def initialize
      @bayes = Bayesian.new
    end

    def bayesian_filter sentence
      @bayes.filter_document sentence
    end
  end
end
