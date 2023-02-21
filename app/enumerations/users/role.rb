module Users
  class Role < EnumerateIt::Base
    associate_values(
      :super_admin,
      :admin,
      :regular
    )
  end
end