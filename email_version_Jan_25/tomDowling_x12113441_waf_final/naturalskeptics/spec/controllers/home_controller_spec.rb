require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it 'should have a non-blank body' do
      get 'index'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'mygems'" do
    it "returns http success" do
      get 'mygems'
      response.should be_success
    end

    it 'should have a non-blank body' do
      get 'mygems'

      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
end


