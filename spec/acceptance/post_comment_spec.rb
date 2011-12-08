# encoding: utf-8

require 'spec_helper'

feature "Participating with the campaign", %q{
 In order to participate in the campaign
 As an user that received the newsletter and entered the website
 I want to be able to post a comment
} do

  scenario "Post a comment" do
    visit root_path
    
    fill_in "comment_username", :with => "EmpresaDeTal"
    fill_in "comment_content", :with => "A EmpresaDeTal deseja à todos um Feliz Natal!"
    click_button "Publicar"
    
    page.should have_content("EmpresaDeTal")
    page.should have_content("A EmpresaDeTal deseja à todos um Feliz Natal!")
  end
  
  
end

