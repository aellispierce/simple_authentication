class AddSecurePasswordToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :password_digest, :string
    remove_column :teachers, :password
  end
end
