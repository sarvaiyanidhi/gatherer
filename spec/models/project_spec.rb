require 'rails_helper'

RSpec.describe Project do
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