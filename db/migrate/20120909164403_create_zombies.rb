# http://guides.rubyonrails.org/migrations.html

class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      # A primary key column called id will also be added, 
      # however since this is the default we do not need to ask for this.
      t.string :name
      t.string :graveyard

      t.timestamps
    end
  end
end
