require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "assigns all posts as @posts" do
      post = Post.create(title: "Test Post", body: "Test Body", liked: false)
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = Post.create(title: "Test Post", body: "Test Body", liked: false)
      get :show, params: { id: post.to_param }
      expect(assigns(:post)).to eq(post)
    end

    it "renders the show template" do
      post = Post.create(title: "Test Post", body: "Test Body", liked: false)
      get :show, params: { id: post.to_param }
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      post = Post.create(title: "Test Post", body: "Test Body", liked: false)
      get :edit, params: { id: post.to_param }
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: { title: "Test Post", body: "Test Body", liked: false } }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post :create, params: { post: { title: "Test Post", body: "Test Body", liked: false } }
        expect(response).to redirect_to(Post)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:post) { Post.create(title: "Test Post", body: "Test Body", liked: false) }

      it "updates the requested post" do
        patch :update, params: { id: post.to_param, post: { title: "New Title" } }
        post.reload
        expect(post.title).to eq("New Title")
      end

      it "redirects to the post" do
        patch :update, params: { id: post.to_param, post: { title: "New Title" } }
        expect(response).to redirect_to(post)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:post) { Post.create(title: "Test Post", body: "Test Body", liked: false) }

    it "destroys the requested post" do
      expect {
        delete :destroy, params: { id: post.to_param }
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, params: { id: post.to_param }
      expect(response).to redirect_to(posts_url)
    end
  end
end
