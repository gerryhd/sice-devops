class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.string :name
      t.string :description
      t.integer :full_semesters
      t.integer :last_year_applicants_count
      t.integer :current_year_slots
      t.integer :study_plan
      t.boolean :available

      t.timestamps
    end
  end
end
