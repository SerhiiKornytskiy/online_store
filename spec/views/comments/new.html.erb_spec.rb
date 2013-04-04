require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :product_id => 1,
      :content => "MyString",
      :nickname => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_product_id", :name => "comment[product_id]"
      assert_select "input#comment_content", :name => "comment[content]"
      assert_select "input#comment_nickname", :name => "comment[nickname]"
    end
  end
end
