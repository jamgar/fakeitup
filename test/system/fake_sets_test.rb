require "application_system_test_case"

class FakeSetsTest < ApplicationSystemTestCase
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
    TypesList.create!(parent: "Name", type_generators: ["first_name"], published: true)
  end

  test "creating a new fake set without Fake Set Types" do
    visit fake_sets_url

    click_on "+ New Fake Set"
    fill_in "Name", with: "Fake set 1"
    click_on "Create Fake set"
    
    assert_text "Fake set successfully created."
  end

  test "creating a new fake set with Fake Set Types" do
    visit fake_sets_url

    click_on "+ New Fake Set"

    fill_in "Name", with: "Fake set 1"
    find("label#fake_set_fake_set_types_attributes_0").click
    find("#Name-first_name").click

    assert_text "Fake set successfully created."
  end

  test "updating a fake set name" do
    fakeset = FakeSet.create!(name: "Fake set One", user: @user)
    visit fake_sets_url

    click_on fakeset.name, match: :first
    fill_in "Name", with: "Fake set 1"
    click_on "Update Fake set"

    assert_text "Fake set successfully updated."
  end

  test "updating a fake set types" do
    fakeset = FakeSet.create!(name: "Fake set One", user: @user)
    visit fake_sets_url

    click_on fakeset.name, match: :first
    fill_in "Name", with: "Fake set 1"
    click_on "+ Add fake set type"
    find("label#fake_set_fake_set_types_attributes_0").click
    find("#Name-first_name").click

    assert_text "Fake set successfully updated."
  end

  test "deleting a fake set" do
    fakeset = FakeSet.create!(name: "Fake set One", user: @user)

    visit fake_sets_url
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept

    assert_text "Fake set successfully deleted."
  end
end

