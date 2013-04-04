# coding: utf-8
require 'spec_helper'

describe Sprint do
  before { @sprint = Sprint.new( name: "Новый спринт", points: 100, unknown_level: 10, 
  	fact_points: 0, hours_count: 0, status: "Планируется", date_begin: '01.01.2013', date_end: '31.01.2013') }
  subject { @sprint }

  it { should respond_to(:name) }
  it { should respond_to(:points) }
  it { should respond_to(:unknown_level) }
  it { should respond_to(:fact_points) }
  it { should respond_to(:hours_count) }
  it { should respond_to(:status) }
  it { should respond_to(:date_end) }
  it { should respond_to(:date_begin) }

  it { should be_valid }
  describe "name is blank" do
  	before { @sprint.name = '' }
  	it { should_not be_valid }
  end
  describe "name is too long" do
  	before { @sprint.name = 'a' * 51 }
  	it { should_not be_valid }
  end
end
