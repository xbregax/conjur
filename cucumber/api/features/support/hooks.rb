Before do
  timestamp = Time.now.utc.strftime('%Y-%m-%dT%H%M%S.%LZ')
  @namespace = [ 'cucumber', timestamp, 4.times.map{rand(255).to_s(16)}.join ].join('/')
  @user_index = 0
  
  Role["cucumber:user:admin"] || Role.create(role_id: "cucumber:user:admin")
end

Before("@logged-in") do
  step %Q(I am a user named "alice")
end

Before("@clean-policies") do
  admin_role = Role["cucumber:user:admin"]
  Role.exclude(role_id: admin_role.id).delete
end

Before("@logged-in-admin") do
  step %Q(I am the super-user)
end