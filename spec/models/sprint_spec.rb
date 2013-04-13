# coding: utf-8
require 'spec_helper'

describe "sprint model" do
  let (:sprint) { FactoryGirl.create(:sprint) }
  subject { sprint }

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
  	before { sprint.name = '' }
  	it { should_not be_valid }
  end
  describe "name is too long" do
  	before { sprint.name = 'a' * 51 }
  	it { should_not be_valid }
  end
  describe "date end less then date begin" do
    before do
      sprint.date_begin = Date.today() + 1.day
      sprint.date_end = Date.today()
    end
    it { should_not be_valid }
  end
end
