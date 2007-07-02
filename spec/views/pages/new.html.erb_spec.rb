require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/new.html.erb" do
  include PagesHelper
  
  before do
    @page = mock_model(Page)
    @page.stub!(:new_record?).and_return(true)
    @page.stub!(:title).and_return("MyString")
    @page.stub!(:body).and_return("MyText")
    @page.stub!(:author).and_return("MyString")
    @page.stub!(:published_date).and_return(Date.today)
    assigns[:page] = @page
  end

  it "should render new form" do
    render "/pages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", pages_path) do
      with_tag("input#page_title[name=?]", "page[title]")
      with_tag("textarea#page_body[name=?]", "page[body]")
      with_tag("input#page_author[name=?]", "page[author]")
    end
  end
end


