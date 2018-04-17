require './test/test_helper'
require './lib/audit'
require './modules/date_handler'

class AuditTest < Minitest::Test
  def test_instantiation
    audit = Audit.new

    assert_instance_of Audit, audit
  end
end
