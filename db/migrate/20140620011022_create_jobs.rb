class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.date :expires_at
      t.integer :salary
      t.string :email

      t.timestamps
    end
  end
end
