require "administrate/field/base"

class HasManyWithoutLink < Administrate::Field::HasMany
  def to_s
    data
  end
end
