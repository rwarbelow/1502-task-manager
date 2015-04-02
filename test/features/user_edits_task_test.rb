require_relative '../test_helper'

class UserEditTaskTest < FeatureTest
  def test_edits_task
    TaskManager.create({ title: "Go to gym",
                         description: "get fit" })

    visit '/tasks/1'
    assert page.has_content?("Go to gym")
    click_link_or_button("Edit")
    fill_in("task[title]", with: "Eat pizza")
    fill_in("task[description]", with: "now")
    click_link_or_button("Update task")

    assert_equal '/tasks/1', current_path
    refute page.has_content?("Go to gym")
    assert page.has_content?("Eat pizza")
  end
end