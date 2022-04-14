class Report < ApplicationRecord
  belongs_to :reportor, class_name: "User", foreign_key: "reportor_id"
  belongs_to :reported_user, class_name: "User", foreign_key: "reported_user_id"
end
