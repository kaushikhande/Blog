class CreateBackgroundJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :background_jobs do |t|
      t.string :job_name
      t.string :job_id
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
      t.string :data
      t.string :user_id

      t.timestamps
    end
  end
end
