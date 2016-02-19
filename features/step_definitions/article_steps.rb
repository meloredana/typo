# steps for the article_merge.feature

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    Article.create!(article)
  end
end

Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    User.create!(user)
  end
end

And /^I am logged into the admin panel as "(.*)"$/ do |user_name|
  visit '/accounts/login'
  fill_in 'user_login', :with => user_name
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Then /^I should (not )?see an element "(.*?)"$/ do |negate, selector|
  expect = negate ? :should_not : :should
  page.send(expect, have_css(selector))
end

Then /^show me the page$/ do
  #save_and_open_page
  puts page.body.inspect
end

When /^(?:|I )fill in "([^"]*)" with the id of the "([^"]*)" article$/ do |field, article_title|
  article = Article.where("title = ?", article_title).first
  fill_in(field, :with => article.id)
end
