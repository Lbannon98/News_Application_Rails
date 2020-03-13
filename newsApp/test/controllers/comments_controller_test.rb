require 'test_helper'
require 'ProfanityFilter'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get article_comments_url
    assert_response :success
  end

  test "should get show" do
    get article_comment_url(@comment)
    assert_response :success
  end

  test "should get new" do
    get new_article_comment_url
    assert_response :success
  end

  test "should get edit" do
    get edit_article_comment_url(@comment)
    assert_response :success
  end

end
