require './test/test_helper'
require './lib/employee'
require './modules/date_handler'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee = Employee.new(:employee_id => '5',
                            :name => "Sally Jackson",
                            :role => "Engineer",
                      :start_date => Date.new(2018, 1, 1),
                      :end_date => Date.new(2018, 3, 4))

    assert_instance_of Employee, employee
  end

  def test_attributes
    employee = Employee.new(:employee_id => '5',
                            :name => "Sally Jackson",
                            :role => "Engineer",
                      :start_date => Date.new(2018, 1, 1),
                      :end_date => Date.new(2018, 3, 4))

    assert_equal 5, employee.employee_id
    assert_equal Integer, employee.employee_id.class
    assert_equal "Sally Jackson", employee.name
    assert_equal "Engineer", employee.role
    assert_instance_of Date, employee.start_date
    assert_instance_of Date, employee.end_date
  end
end
