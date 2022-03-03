class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create user' do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { email: 'test@etest.org', password: '123456'
      } }, as: :json
    end
    assert_response :created
  end

  test 'shoud not create user with taken email' do
    assert_no_difference('User.count') do
      post api_v1_users_url, params: { user: { email: @user.email, password: '123456' } }, as:
	:json
    end
    assert_response :unprocessable_entity
  end

  test 'should update user' do
    patch api_v1_user_url(@user), params: { user: { email: @user.email, password: '123456' } },
      as: :json
    assert_response :success
  end

  test "should not update user when invalid params are sent" do
    patch api_v1_user_url(@user), params: { user: { email: 'bad_email', password: '123456'
						    } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user), as: :json
    end
    assert_response :no_content
  end
end
