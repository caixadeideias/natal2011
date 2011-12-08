require 'spec_helper'
require 'ostruct'

describe "comments/index.html.erb" do
  it "displays the comments" do
    comments = stub_model(
                            Comment,
                            :username => "EmpresaDeTal",
                            :content => "A EmpresaDeTal deseja tudo de bom."
                          )
    
    assign(:comment, stub_model(Comment))          
    assign(:comments, [comments])
    render
    rendered.should =~ /EmpresaDeTal/
    rendered.should =~ /A EmpresaDeTal deseja tudo de bom./
  end 
end
