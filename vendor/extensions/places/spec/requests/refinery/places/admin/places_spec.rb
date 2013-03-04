# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Places" do
    describe "Admin" do
      describe "places" do
        login_refinery_user

        describe "places list" do
          before do
            FactoryGirl.create(:place, :title => "UniqueTitleOne")
            FactoryGirl.create(:place, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.places_admin_places_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.places_admin_places_path

            click_link "Add New Place"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Places::Place.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Places::Place.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:place, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.places_admin_places_path

              click_link "Add New Place"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Places::Place.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:place, :title => "A title") }

          it "should succeed" do
            visit refinery.places_admin_places_path

            within ".actions" do
              click_link "Edit this place"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:place, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.places_admin_places_path

            click_link "Remove this place forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Places::Place.count.should == 0
          end
        end

      end
    end
  end
end
