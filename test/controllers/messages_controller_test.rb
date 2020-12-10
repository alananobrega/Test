require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { content: @message.content, title: @message.title } }
      return @message
    end

    assert_redirected_to message_path(@message)
  end

  test "should show message" do
    get message_url(@message)
    assert_equal 'read', @message.reload.state
    assert_response :success
  end

  test "should get edit" do
    get edit_message_url(@message)
    assert_response :success
  end

  test "should update message" do
    patch message_url(@message), params: { message: { content: @message.content, state: @message.state, title: @message.title } }
    assert_redirected_to message_url(@message)
  end

  test "should destroy message" do
    delete message_url(@message)
    assert_equal 'archived', @message.reload.state

    assert_redirected_to messages_url
  end

  test "should destroy all messages" do
    put archived_all_path
    assert_equal Message.where.not(state: 'archived').count, 0
    assert_redirected_to messages_url
  end
end
