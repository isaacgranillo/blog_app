class AddUserAssocToArticles < ActiveRecord::Migration
  def change
  	add_reference :articles, :user
  end
end
