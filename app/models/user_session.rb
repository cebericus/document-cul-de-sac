class UserSession < Authlogic::Session::Base
    before_destroy :_reset_persistence_token
    before_create  :_reset_persistence_token
    
  logout_on_timeout true
  
  private
    def _reset_persistence_token
      record.reset_persistence_token!
    end 
end
