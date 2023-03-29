class AddBookTypeOrLanguageToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :book_language, :string
  end
end
