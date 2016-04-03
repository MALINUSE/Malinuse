User.delete_all
User.create!([
                 {id: -1000, username: "root", email: "imidsac@hotmail.fr", nom: "SACKO", prenom: "IDRISS", role: "Root", password: "walilahilhamdou"},
                 {id: -1, username: "admin", email: "admin@admin.fr", nom: "admin", prenom: "admin", role: "Admin", password: "admin"},
                 {id: 1, username: "manager", email: "manager@manager.fr", nom: "manager", prenom: "manager", role: "Manager", password: "manager"},
                 {id: 2, username: "comptable", email: "comptable@comptable.fr", nom: "comptable", prenom: "comptable", role: "Manager", password: "comptable"}
             ])
puts "===> Sample date have been set in DB  Users!"


Subject.delete_all
Subject.create!([
                    {id: 1, name: "Présentation", position: 1, visible: true},
                    {id: 2, name: "Aide et Soutien", position: 2, visible: true}

                ])

puts "===> Sample date have been set in DB  Subjects!"

Page.delete_all
Page.create!([
                    {id: 1, subject_id: 1, name: "Malinuse se présente", position: 1, visible: true},
                    {id: 2, subject_id: 1, name: "Vision et Mission de Malinuse", position: 2, visible: true},
                    {id: 3, subject_id: 1, name: "Mot du PDG", position: 3, visible: true},

                    {id: 4, subject_id: 2, name: "Annuaire", position: 4, visible: true}

                ])

puts "===> Sample date have been set in DB  Pages!"

Section.delete_all
Section.create!([
                    {page_id: 1, name: "Malinuse se présente Section 1", position: 1, visible: true, content_type: "text", content: "Malinuse se présente Section 1" },
                    {page_id: 1, name: "Malinuse se présente Section 2", position: 2, visible: true, content_type: "text", content: "Malinuse se présente Section 2"},
                    {page_id: 1, name: "Malinuse se présente Section 3", position: 3, visible: true, content_type: "text", content: "Malinuse se présente Section 3"},

                    {page_id: 2, name: "Vision et Mission de Malinuse section 1", position: 4, visible: true, content_type: "text", content: "Vision et Mission de Malinuse section 1"},
                    {page_id: 2, name: "Vision et Mission de Malinuse section 2", position: 5, visible: true, content_type: "text", content: "Vision et Mission de Malinuse section 2"}

                ])

puts "===> Sample date have been set in DB  Sections!"
