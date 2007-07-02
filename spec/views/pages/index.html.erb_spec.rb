require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/index.html.erb" do
  include PagesHelper
  
  before do
    page_98 = mock_model(Page)
    page_98.should_receive(:title).and_return("MyString")
    page_98.should_receive(:body).and_return("MyText")
    page_98.should_receive(:author).and_return("MyString")
    page_98.should_receive(:published_date).and_return(Date.today)
    page_99 = mock_model(Page)
    page_99.should_receive(:title).and_return("MyString")
    page_99.should_receive(:body).and_return("MyText")
    page_99.should_receive(:author).and_return("MyString")
    page_99.should_receive(:published_date).and_return(Date.today)

    assigns[:pages] = [page_98, page_99]
  end

  it "should render list of pages" do
    render "/pages/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

