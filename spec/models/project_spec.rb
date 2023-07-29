require 'rails_helper'

RSpec.describe Project do
  describe "completion" do
    let(:project) { Project.new }
    let(:task) { Task.new }

    it "considers a project with no tasks to be done" do
      expect(project).to be_done
    end

    it "considers a project with incomplete task as not done" do
      project.tasks << task
      expect(project).not_to be_done
    end

    it "marks project as done if its tasks are completed" do
      project.tasks << task
      task.mark_completed
      expect(project).to be_done
    end
  end

  describe "estimates" do
    let(:project) { Project.new }
    let(:done) { Task.new(size: 2, completed: true) }
    let(:small_not_done) { Task.new(size: 1) }
    let(:large_not_done) { Task.new(size: 4) }

    before(:example) do
      project.tasks = [done, small_not_done, large_not_done]
    end

    it "can calculate total tasks" do
      expect(project.total_size).to eql(7)
    end

    it "can calculate total incomplete tasks" do
      expect(project.remaining_size).to eql(5)
    end
  end


end