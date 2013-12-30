require 'spec_helper'

describe CommoditiesController do

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

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it 'should have a non-blank body' do
      get 'index'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end


  end



