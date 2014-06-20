class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.integer :expected_salary
      t.integer :status

      t.timestamps
    end
  end
end
