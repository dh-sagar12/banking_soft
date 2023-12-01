class Auth::BranchPolicy < ApplicationRecord
  belongs_to :user, class_name: "Auth::User"
  belongs_to :branch, class_name: "Auth::Branch"
end
