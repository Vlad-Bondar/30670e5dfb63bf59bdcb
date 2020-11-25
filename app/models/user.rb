require 'autoinc'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc

  field :_id, type: Integer
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  increments :_id

  index({ _id: 1 }, { unique: true, name: "id_index" })
end
