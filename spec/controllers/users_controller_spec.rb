require 'rails_helper'

describe UsersController, :type => :controller do
  login_admin

  describe "GET #index" do
    context "as an admin" do

      it "populates a list of users" do
        get :index
        expect(assigns(:users)).to include(subject.current_user)
      end

      it "renders the index view" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).not_to be_nil
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: subject.current_user
      expect(assigns(:user)).to eq(subject.current_user)
    end

    it "renders the :show view" do
      get :show, id: subject.current_user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @user" do
      get :edit, id: subject.current_user
      expect(assigns(:user)).to eq(subject.current_user)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to the new user" do
        post :create, user: attributes_for(:user, :account => build(:account))
        expect(response).to redirect_to user_account_path(User.last)
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid user" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.to change(User, :count).by(0)
      end

      it "re-renders the new method" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do

    context "with valid attributes" do
      it "locates the requested user" do
        put :update, id: subject.current_user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(subject.current_user)
      end

      it "updates the @user attributes" do
        put :update, id: subject.current_user, user: attributes_for(:user, email: "test@test.com")
        subject.current_user.reload
        expect(subject.current_user.email).to eq("test@test.com")
      end

      it "re-directs to to the updated user" do
        put :update, id: subject.current_user, user: attributes_for(:user)
        expect(response).to redirect_to subject.current_user
      end
    end

    context "with invalid attributes" do
      it "locates the requested user" do
        put :update, id: subject.current_user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(subject.current_user)
      end

      it "does not update the @user attributes" do
        put :update, id: subject.current_user, user: attributes_for(:invalid_user)
        subject.current_user.reload
        expect(subject.current_user.email).not_to be_nil
      end

      it "re-renders the edit method" do
        put :update, id: subject.current_user, user: attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes the user" do
      expect{
        delete :destroy, id: subject.current_user
      }.to change(User, :count).by(-1)
    end

    it "rediercts to users#index" do
      delete :destroy, id: subject.current_user
      expect(response).to redirect_to user_path
    end
  end

end
