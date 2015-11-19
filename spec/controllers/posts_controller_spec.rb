require 'rails_helper'

RSpec.describe PostsController, type: :controller do 

  context "#index" do
    it "assign all posts as @posts" do
      get :index
      response.should be_success
      expect(assigns(:posts)).should_not be_nil
    end
  end

  context "#new" do
    it "assign a new post as @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  context "#create" do
    it "create a new Post" do
      post :new
      expect(assigns(:post)).to be_a(Post)
    end
  end

  context "#destroy" do
    it "redirect to the posts list" do
      post = Post.create!
      delete :destroy, {:id => post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end