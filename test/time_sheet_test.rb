require './test/test_helper'
require './lib/time_sheet'
require './modules/date_handler'

class TimesheetTest < Minitest::Test
  def test_instantiation
    data = {:employee_id => '5', :project_id => '7', :date => Date.new(2015, 1, 1), :minutes => '120'}
    time = Timesheet.new(data)

    assert_instance_of Timesheet, time
  end

  def test_attributes
    data = {:employee_id => '5', :project_id => '7', :date => Date.new(2015, 1, 1), :minutes => '120'}
    time = Timesheet.new(data)

    assert_instance_of Integer, time.employee_id
    assert_equal 5, time.employee_id
    assert_instance_of Integer, time.project_id
    assert_equal 7, time.project_id
    assert_instance_of Date, time.date
    assert_instance_of Integer, time.minutes
    assert_equal 120, time.minutes
  end
end
