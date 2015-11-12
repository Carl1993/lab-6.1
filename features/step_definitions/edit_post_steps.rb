Given(/^there is a post with title "(.*?)" and content "(.*?)"$/) do |arg1, arg2|
  @post=Post.create!({ :title => arg1, :content => arg2, :post_time => Time.now})
end

When(/^I edit this post$/) do
  click_link ("#{@post.id}_edit")
end

When(/^I update title to "(.*?)" and content to "(.*?)"$/) do |title, content|
  @title = title
  @content = content
  fill_in "Title", :with => title
  fill_in "Content", :with => content
  click_button "Post"
end

Then(/^I can see it has been updated$/) do
  page.should have_content(@title)
  page.should have_content(@content)
end
