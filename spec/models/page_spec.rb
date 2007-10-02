require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  before(:each) do
    @page = Page.new(:title => 'test title', :body => 'body', :author => 'Matt')
  end

  it "should be valid" do
    @page.should be_valid
  end
end
