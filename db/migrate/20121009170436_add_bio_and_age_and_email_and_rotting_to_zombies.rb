class AddBioAndAgeAndEmailAndRottingToZombies < ActiveRecord::Migration
  def change
    add_column :zombies, :bio, :text, :null => true

    add_column :zombies, :age, :integer, :null => true

    add_column :zombies, :email, :string, :unique => true

    add_column :zombies, :rotting, :boolean, :default => false

  end
end
