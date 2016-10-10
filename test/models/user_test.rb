require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Create a simple user" do
      User.create name: 'user 01'
      assert_equal 1, User.all.count
  end

  test "Don't create a user without name" do
      User.create bio: 'anything'
      assert_equal 0, User.all.count
  end

  test "Don't create duplicated user" do
      User.create name: 'user 01'
      User.create name: 'user 01'
      assert_equal 1, User.all.count
  end

  test "Don't create user unless born" do
    User.create name: 'user 01', age: -1
    assert_equal 0, User.all.count
  end
end
