Given (/^there is a post titled with "(.*?)" and content with "(.*?)"$/) do |arg1,arg2|
   @post=Post.create!({:title => arg1, :content => arg2, :post_time => Time.now})
end

When (/^I select the post$/) do
	click_link "#{@post.id}_show"
end

And (/^I click "Delete Post"$/) do
	click_on "Destroy"
end

Then (/^the post should be deleted$/) do
	page.should have_no_content(@post.title)
end