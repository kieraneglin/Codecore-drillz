# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end
Merit::Badge.create!(
  id: 1,
  name: "Rails Master",
  description: "Complete all the Rails challenges",
  custom_fields: {
    difficulty: :gold,
    url: "https://achievement-images.teamtreehouse.com/badges_SimpleFacebook_Stage1.png"
  }
)
Merit::Badge.create!(
  id: 2,
  name: "User Authentication Master",
  description: "Complete all the uAuth challenges",
  custom_fields: {
    difficulty: :silver,
    url: "https://achievement-images.teamtreehouse.com/badges_DD_ObjectiveC_Stage2.png"
  }
)
Merit::Badge.create!(
  id: 3,
  name: "Ruby Master",
  description: "Complete all the Ruby challenges",
  custom_fields: {
    difficulty: :gold,
    url: "https://achievement-images.teamtreehouse.com/badges_ruby_rubygems_Stage2.png"
   }
)
# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
