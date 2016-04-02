User.delete_all
User.create!([
                 {id: -1000, username: "root", email: "imidsac@hotmail.fr", nom: "SACKO", prenom: "IDRISS", role: "Root", password: "walilahilhamdou"},
                 {id: -1, username: "admin", email: "admin@admin.fr", nom: "admin", prenom: "admin", role: "Admin", password: "admin"},
                 {id: 1, username: "manager", email: "manager@manager.fr", nom: "manager", prenom: "manager", role: "Manager", password: "manager"},
                 {id: 2, username: "comptable", email: "comptable@comptable.fr", nom: "comptable", prenom: "comptable", role: "Manager", password: "comptable"}
             ])
puts "===> Sample date have been set in DB  Users!"