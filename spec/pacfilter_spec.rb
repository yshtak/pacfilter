# coding: utf-8
require 'spec_helper'

describe Pacfilter do
  it "is the morphological result" do
    b = Pacfilter::instance :mysql
    #result = b.filtering "研究でなにかとと忙しいけれど、やらなければ終わらない。"
    result = b.filtering "＠わーい！"
    p result
    expect(result).to eq(result)
  end

  it "is connection for MongoDB" do
    b = Pacfilter::instance :mongo
    result = b.filtering "いやあっほおおおい！", :cofilter 
  end
end
