class SectionEdit < ActiveRecord::Base
  belongs_to :section
  belongs_to :editor, :class_name => "User", :foreign_key => "user_id"

end
