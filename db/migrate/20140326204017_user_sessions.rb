class UserSessions < ActiveRecord::Migration
  def change
    add_column :user_sessions, :user_session_id, :string, :null => false
    add_column :user_sessions, :data, :text 
    add_index :user_sessions, :user_session_id
  end
end
