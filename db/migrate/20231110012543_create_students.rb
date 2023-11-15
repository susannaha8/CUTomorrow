class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.string :uni
      t.integer :major1
      t.integer :major2
      t.integer :major3
      t.integer :minor1
      t.integer :minor2
      t.integer :minor3
      t.integer :minor4
      t.string :firstName
      t.string :lastName
      t.string :standing
      t.string :password_digest
    end
    add_index :students, [:email, :uni], unique: true
  end
end
