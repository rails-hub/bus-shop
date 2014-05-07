# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permission do
    user_id 1
    permission "MyString"
    add_inventory false
    edit_inventroy false
    dealor_add false
    dealor_edit false
    lead_add false
    lead_edit false
    ad_add false
    ad_edit false
  end
end
