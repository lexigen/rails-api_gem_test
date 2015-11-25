require 'test_helper'

class CreatingTablesTest < ActionDispatch::IntegrationTest
  setup do
    @table = Table.create!(number: 1, seats: 4)
  end

  test "create table" do
    post "/tables/#{@table.id}/orders", {
      order: {
        name: 'From Alex',
        email: 'alex@mail.com',
        table: @table
      }
    }.to_json, {
       'Content-Type': 'application/json',
       'Accept': 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    order = json(response.body)
    assert_equal table_order_url(@table.id, order[:id]), response.location

    assert_equal 'From Alex', order[:name]
    assert_equal 'alex@mail.com', order[:email]
    assert_equal @table.id, order[:table_id]
  end
end
