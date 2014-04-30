require 'pry'
require_relative "../test_helper"

describe AssessmentsController do
  before do
    @u = User.create(name: "Pito Salas")
    @t_closed = Team.create(name: "Not assesing", mode: 1)
    @u_closed_team = @t_closed.members.create(name: "Dummy")
    @t_assessing_team = Team.create(name: "Assessing", mode: 5)
    @u1_assessing_team = @t_assessing_team.members.create(name: "Dummy1")
    @u2_assessing_team = @t_assessing_team.members.create(name: "Dummy2")

  end

   describe "form display" do
    it "redirects when user not logged in or logged into wrong account" do
      get(:form, {:user => 999}, {:user_id => 99} )
      assert_redirected_to pages_path("login_first")
    end

    it "redirects when user not logged in or logged into wrong account" do
      get(:form, {:user => 999} )
      assert_redirected_to pages_path("login_first")
    end

    it "redirects when logged in user does not belong to a team" do
      get(:form, {'user' => @u.id }, { 'user_id' => @u.id} )
      assert_redirected_to pages_path("not_ready_yet")
    end


    it "redirects to not_assessing_yet if team is not in assessing mode" do
      get(:form, {'user' => @u_closed_team.id }, { 'user_id' => @u_closed_team.id} )
      assert_redirected_to pages_path("not_assessing_yet")
    end
  end

  describe "form submission" do
    describe "before save" do
      it "redirects to login_first if not logged in" do
        post(:submit, { 'user' => @u.id})
        assert_redirected_to pages_path('login_first')
      end
      it "redirects to login_first if wrong user logged in" do
        post(:submit, { 'user' => @u_closed_team.id}, { 'user_id' => 999})
        assert_redirected_to pages_path('login_first')
      end
      it "redirects to cancel if cancel button pressed" do
        post(:submit, { 'user' => @u1_assessing_team, "commit" => "Cancel"}, { 'user_id' => @u1_assessing_team.id})
        assert_redirected_to pages_path('cancel')
      end
    end
  end
end