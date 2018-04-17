class TimeSheet
  attr_reader :employee_id, :project_id, :date, :minutes

  def initialize(data)
    @employee_id = data[:employee_id].to_i
    @project_id = data[:project_id].to_i
    @date = data[:date]
    @minutes = data[:minutes].to_i
  end

end
