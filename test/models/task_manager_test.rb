require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def create_tasks(num)
    num.times do |x|
      TaskManager.create({ title: "my task#{x}", 
                         description: "something#{x}"})
    end
  end

  def test_can_create_a_task_with_an_id
    # create one task
    create_tasks(1)
    # find the task with id 1
    task = TaskManager.find(1)
    # assert that it assigned correct title and description 
    assert_equal "my task0", task.title
    assert_equal "something0", task.description
    assert_equal 1, task.id
  end

  def test_it_destroys_a_task
    create_tasks(3)
    TaskManager.destroy(2)
    assert_equal 2, TaskManager.all.count
  end
end