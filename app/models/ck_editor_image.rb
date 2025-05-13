class CkEditorImage < ApplicationRecord
  mount_uploader :file, CkEditorImageUploader
  belongs_to :user, optional: true
  validates_presence_of :file
	
end
