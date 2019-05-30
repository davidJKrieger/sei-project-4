configure :production,  :development 

db = URI.pars(ENV['DATABASE_URL'] || 'postgress://localhost/whats_for_dinner' )

ActiveRecord::Base.establish_connection(
  :adapter => db.scheme == 'postgress' ? 'postgresql' : db.scheme,
  :host => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

end
