require './test/test_helper'
require './lib/project'
require './modules/date_handler'

class ProjectTest < Minitest::Test

  def test_instantiation
    data = {:project_id => '123', :name => 'Widget Maker',
            :start_date => Date.new(2018, 1, 1), :end_date => Date.new(2018, 3, 4)}
    project = Project.new(data)

    assert_instance_of Project, project
  end

  def test_attributes
    data = {:project_id => '123', :name => 'Widget Maker',
            :start_date => Date.new(2018, 1, 1), :end_date => Date.new(2018, 3, 4)}
    project = Project.new(data)

    assert_equal 123, project.project_id
    assert_instance_of Integer, project.project_id
    assert_equal 'Widget Maker', project.name
    assert_instance_of Date, project.start_date
    assert_instance_of Date, project.end_date
  end
end
