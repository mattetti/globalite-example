require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/edit.html.erb" do
  include PagesHelper
  
  before do
    @page = mock_model(Page)
    @page.stub!(:title).and_return("MyString")
    @page.stub!(:body).and_return("MyText")
    @page.stub!(:author).and_return("MyString")
    @page.stub!(:published_date).and_return(Date.today)
    assigns[:page] = @page
  end

  it "should render edit form" do
    render "/pages/edit.html.erb"
    
    response.should have_tag("form[action=#{page_path(@page)}][method=post]") do
      with_tag('input#page_title[name=?]', "page[title]")
      with_tag('textarea#page_body[name=?]', "page[body]")
      with_tag('input#page_author[name=?]', "page[author]")
    end
  end
end


