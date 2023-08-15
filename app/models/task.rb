class Task

  attr_accessor :size, :completed

  def initialize(options = {})
    @completed = options[:completed]
    @size = options[:size]
  end

  def mark_completed(date = Time.current)
    @completed_at = date
  end

  def complete?
    @completed
  end

  def part_of_velocity?
    return false unless complete?
    completed_at > 21.day.ago
  end

  def points_toward_velocity
    part_of_velocity? ? size : 0
  end
end