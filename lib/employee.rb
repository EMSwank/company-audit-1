class Employee
  attr_reader :employee_id, :name, :role, :start_date, :end_date

  def initialize(data)
    @employee_id = data[:employee_id].to_i
    @name = data[:name]
    @role = data[:role]
    @start_date = data[:start_date]
    @end_date = data[:end_date]
  end
end
