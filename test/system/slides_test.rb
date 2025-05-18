require "application_system_test_case"

class SlidesTest < ApplicationSystemTestCase
  setup do
    @slide = slides(:one)
  end

  test "visiting the index" do
    visit slides_url
    assert_selector "h1", text: "Slides"
  end

  test "creating a Slide" do
    visit slides_url
    click_on "New Slide"

    fill_in "Body", with: @slide.body
    fill_in "Body font size desktop", with: @slide.body_font_size_desktop
    fill_in "Body font size mobile", with: @slide.body_font_size_mobile
    fill_in "Media size desktop", with: @slide.media_size_desktop
    fill_in "Media size mobile", with: @slide.media_size_mobile
    fill_in "Media url", with: @slide.media_url
    fill_in "Position", with: @slide.position
    fill_in "Presentation", with: @slide.presentation_id
    fill_in "Title font size desktop", with: @slide.title_font_size_desktop
    fill_in "Title font size mobile", with: @slide.title_font_size_mobile
    click_on "Create Slide"

    assert_text "Slide was successfully created"
    click_on "Back"
  end

  test "updating a Slide" do
    visit slides_url
    click_on "Edit", match: :first

    fill_in "Body", with: @slide.body
    fill_in "Body font size desktop", with: @slide.body_font_size_desktop
    fill_in "Body font size mobile", with: @slide.body_font_size_mobile
    fill_in "Media size desktop", with: @slide.media_size_desktop
    fill_in "Media size mobile", with: @slide.media_size_mobile
    fill_in "Media url", with: @slide.media_url
    fill_in "Position", with: @slide.position
    fill_in "Presentation", with: @slide.presentation_id
    fill_in "Title font size desktop", with: @slide.title_font_size_desktop
    fill_in "Title font size mobile", with: @slide.title_font_size_mobile
    click_on "Update Slide"

    assert_text "Slide was successfully updated"
    click_on "Back"
  end

  test "destroying a Slide" do
    visit slides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slide was successfully destroyed"
  end
end
