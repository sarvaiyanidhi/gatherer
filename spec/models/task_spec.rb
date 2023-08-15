require 'rails_helper'

RSpec.describe Task do
  describe "initialize" do
    let(:task) { Task.new }

    it "does not have a new task as complete" do
      expect(task).to_not be_complete
    end

    it "should allow to complete task" do
      task.mark_completed
      expect(task).to be_complete
    end
  end

  describe "velocity" do
    let(:task) { Task.new(size: 3) }

    it "does not count imcomplete task towards velocity" do
      expect(task).not_to be_a_part_of_velocity
      expect(task.points_toward_velocity).to eql(0)
    end

    it "does count recently completed task towards velocity" do
      task.mark_completed(1.day.ago)
      expect(task).to be_a_part_of_velocity
      expect(task.points_toward_velocity).to eql(3)
    end

    it "does not count long completed task towards velocity" do
      task.mark_completed(6.months.ago)
      expect(task).not_to be_a_part_of_velocity
      expect(task.points_toward_velocity).to eql(0)
    end
  end
end