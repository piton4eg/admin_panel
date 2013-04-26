require 'spec_helper'

describe SprintStats do
  let (:sprint_stats) { FactoryGirl.create(:sprint_stats) }
  subject { sprint_stats }

  it { should respond_to(:velocity) }
  it { should respond_to(:points) }

  describe "update stats" do
    before { SprintStats.update_stats }
    it { should be_valid }
  end
end
