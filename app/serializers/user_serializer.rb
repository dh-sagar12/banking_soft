class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :full_name, :contact, :branch, :created_at, :updated_at
end
