# == Schema Information
#
# Table name: role_permissions
#
#  id            :bigint           not null, primary key
#  role_id       :bigint
#  permission_id :bigint
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RolePermission < ApplicationRecord
  belongs_to :role
  belongs_to :permission
end
