# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Val')
User.create(username: 'Spongebob')
User.create(username: 'Greg')

Artwork.create(title: 'Pretty Trees', image_url: 'images/pretty_tree.jpg', artist_id: 1)
Artwork.create(title: 'Gary Portrait', image_url: 'images/gary_portrait.jpg', artist_id: 2)
Artwork.create(title: 'Fruit Bowl', image_url: 'images/fruit_bowl.jpg', artist_id: 1)

ArtworkShare.create(viewer_id: 3, artwork_id: 1)
ArtworkShare.create(viewer_id: 3, artwork_id: 2)
ArtworkShare.create(viewer_id: 1, artwork_id: 3)
ArtworkShare.create(viewer_id: 1, artwork_id: 2)