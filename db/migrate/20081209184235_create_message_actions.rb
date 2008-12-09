class CreateMessageActions < ActiveRecord::Migration
  def self.up
    create_table :message_actions do |t|
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :message_actions
  end
end
