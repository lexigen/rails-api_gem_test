require 'test_helper'

class ListingTablesTest < ActionDispatch::IntegrationTest
  setup do
    Table.create!(number: 1, seats: 4)
    Table.create!(number: 2, seats: 3)
  end
  test "lists the tables" do
    get '/tables'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 2, json(response.body).size
  end
end
