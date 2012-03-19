# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    m = Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    position1 = page.body.enum_for(:scan, /#{e1}/).map { Regexp.last_match.begin(0) }
    position2 = page.body.enum_for(:scan, /#{e2}/).map { Regexp.last_match.begin(0) }

    assert_operator position1[0], :<, position2[0]
  
    #step "I should see \"#{e1}\""
    #step "I should see \"#{e2}\""

  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #assert false, "Unimplmemented"
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    rating_list.split(', ').each do |i|
        if uncheck
            step "I uncheck \"ratings_#{i}\""
        else
            step "I check \"ratings_#{i}\""
        end
    end
end

Then /I should see all of the movies/ do
    assert_equal Movie.count(), 10
end
