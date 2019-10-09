# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback

unless Role.all.present?
    roles = Role.create(
        [
            {name: "superuser"},
            {name: "Administrateur"},
            {name: "Utilisateur"},
            {name: "Administration"},
            {name: "Technicien"},
            {name: "Biologiste"},
            {name: "Caissier"},
            {name: "Comptable"},
            {name: "Sécretaire"}
          


        ])
else
    roles = Role.all

end

unless Service.all.present?
    services = Service.create(
        [
            {name: "Administration"},
            {name: "Laboratoire"},
            {name: "Radiographie"},
            {name: "Sécretariat"},
            {name: "Comptabilité"}
           
          


        ])
else
    services = Service.all

end

# Users
unless User.all.present?
    users = User.create([
        {login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: roles.first.id, service_id: Service.find_by(name: "Administration").id},
        {login: "administrateur",  email: "administrateur@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "Administrateur").id, service_id: Service.find_by(name: "Administration").id},
        {login: "secretaire",  email: "secretaire@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "Sécretaire").id, service_id: Service.find_by(name: "Sécretariat").id}

    
    ])
else   
    users = User.all
end






unless Profile.all.present?
    profile = Profile.create([
        {
            first_name: "Amos", 
            last_name: "DEMBELE",
            phone: "00000000",
            user_id: users.first.id
        },
        {
            first_name: "Alassane", 
            last_name: "BABY",
            phone: "11111111",
            user_id: users.last.id
        }
    
    ])

end

unless EthnicGroup.all.present?
    ethnic_group = EthnicGroup.create([
        {
            name: "BOBO", 
            user_id: users.first.id
        },
        {
            name: "BOZO", 
            user_id: users.first.id
        },
        {
            name: "BAMANA", 
            user_id: users.first.id
        }
    
    ])

end

unless Locality.all.present?
    locality = Locality.create([
        {
            region: "Bamako", 
            cercle: "Bamako",
            commune: "Commune III",
            village: "Kalaban Koro",
            user_id: users.first.id
        },
        {
            region: "Bamako", 
            cercle: "Bamako",
            commune: "Commune V",
            village: "Kalaban Coura",
            user_id: users.first.id
        }
    
    ])

end


=begin
unless Currency.all.present?
    currencies = Currency.create([
        {
            symbol: "F CFA", 
            iso_code: "XOF",
            user_id: users.first.id
        }
    
    ])

end

=end

unless Organization.all.present?
    organization = Organization.create([
        {
            name: "LABO TRAORE ET FRERE"
            
        }
    
    ])

end

