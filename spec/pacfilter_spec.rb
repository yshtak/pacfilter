require 'spec_helper'

describe Pacfilter::Bayesian, "::new" do
  it "is the morphological result" do
    b = Pacfilter::Bayesian.new
    #result = b.filtering "研究でなにかとと忙しいけれど、やらなければ終わらない。"
    result = b.filtering "＠わーい！"
    p result
    expect(result).to eq(result)
  end
end
