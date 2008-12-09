class MessageAction < ActiveRecord::Base
  attr_accessor :flash

  def apply
    flash[:notice] = message if flash
  end
end
