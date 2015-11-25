require 'test_helper'

class DeletingTablesTest < ActionDispatch::IntegrationTest
  setup do
    @t1 = Table.create(number: 1, seats: 4)
    @t2 = Table.create(number: 2, seats: 3)
  end

  test "deletes table" do
    delete "/tables/#{@t1.id}"

    assert_equal 204, response.status
  end
end
