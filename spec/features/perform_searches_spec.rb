require 'spec_helper'

describe "PerformSearches" do
  before do
    visit search_path
  end
  it "shows search examples on home page" do
      expect(page).to_not have_text("Show me more")
      expect(page).to_not have_text("Unfortunately")
      expect(page).to have_text("Example")
  end
  context "search form",js: true do
    it "shows search examples given empty search query" do
      fill_in "q", with: ""
      click_button "Search"
      expect(page).to have_text("Example")
    end
    it "shows error message given no results found", vcr:true do
      fill_in "q", with: "fajfiorjgdfgfgioarmnviovntngtuingat89tg5487345"
      click_button "Search"
      expect(page).to have_text("Unfortunately")
      expect(page).to_not have_text("Show me more")
    end
    it "shows search results given a valid query", vcr:true do
      fill_in "q", with: "#ROR"
      click_button "Search"
      expect(page).to have_text(/\#ROR/i)
      expect(page).to have_text("Show me more")
      expect(page).to_not have_text("Unfortunately")
      page.all(".post").size.should_not eq 0
    end
  end

  context "\"show me more\" link",js:true, vcr:true do
    before do
      fill_in "q", with: "#ruby"
      click_button "Search"
      sleep 1
      @post_ids = page.all('.post').map{|x| x.find(".post_id").text}
      click_link "Show me more"
      sleep 1
      @new_post_ids = page.all('.post').map{|x| x.find(".post_id").text}
    end

    it "should show more posts" do
      @post_ids.size.should_not eq @new_post_ids.size
      expect(page).not_to have_text("Unfortunately")
      expect(page).to have_text("Show me more")
    end

    it "should not have duplicate posts" do
      @new_post_ids.size.should eq @new_post_ids.uniq.size
    end

  end
end
