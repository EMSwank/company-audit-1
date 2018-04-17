require './test/test_helper'
require './lib/project'
require './modules/date_handler'

class ProjectTest < Minitest::Test

  def test_instantiation
    data = {:project_id => '123', :name => 'Widget Maker',
            :start_date => Date.new(2018, 1, 1), :end_date => Date.new(2018, 3, 4)}
    project = Project.new()

    assert_instance_of Project, project
  end
end
