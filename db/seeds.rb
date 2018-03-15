# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ad.create!(
  title: "文或者哑元",
  description: "Lorem Ipsum，也称乱数假文或者哑元文本， 是印刷及排版领域所常用的虚拟文字。由于曾经一台匿名的打印机刻意打乱了一盒印刷字体从而造出一本字体样品书，Lorem Ipsum从西元15世纪起就被作为此领域的标准文本使用。它不仅延续了五个世纪，还通过了电子排版的挑战，其雏形却依然保存至今。在1960年代，”Leatraset”公司发布了印刷着Lorem Ipsum段落的纸张，从而广泛普及了它的使用。最近，计算机桌面出版软件”Aldus PageMaker”也通过同样的方式使Lorem Ipsum落入大众的视野。",
  price: 25.00,
  image: "http://via.placeholder.com/150x150"
)

Ad.create!(
  title: "也称乱数",
  description: "ras egestas sapien sit amet lectus imperdiet malesuada. Sed orci orci, porttitor non scelerisque eu, finibus et enim. Praesent lacinia id nisi sed laoreet. Nulla sodales felis ut neque convallis elementum. Aenean venenatis augue id posuere lacinia. Quisque et suscipit elit, quis sagittis lorem. Pellentesque laoreet egestas sapien, vitae feugiat dolor ullamcorper sed.
In eu dolor non eros tincidunt efficitur ut eu velit. Vestibulum fermentum blandit nisl, eu finibus urna sodales ac. Aliquam efficitur lacus a lectus sagittis porttitor. Nullam rhoncus aliquet suscipit. Nulla fringilla nibh bibendum ultrices varius. Aenean quis quam tincidunt, ornare neque nec, tempus risus. Mauris pharetra augue sit amet placerat ultrices. Aenean mattis tempus luctus. Praesent vel magna lobortis, lacinia leo quis, cursus massa. Fusce sit amet vestibulum massa",
  price: 100.99,
  image: "http://via.placeholder.com/250x250"
)

Ad.create!(
  title: "演变出了各式各样的版本",
  description: "无可否认，当读者在浏览一个页面的排版时，难免会被可阅读的内容所分散注意力。Lorem Ipsum的目的就是为了保持字母多多少少标准及平均的分配，而不是“此处有文本，此处有文本”，从而让内容更像可读的英语。如今，很多桌面排版软件以及网页编辑用Lorem Ipsum作为默认的示范文本，搜一搜“Lorem Ipsum”就能找到这些网站的雏形。这些年来Lorem Ipsum演变出了各式各样的版本，有些出于偶然，有些则是故意的（刻意的幽默之类的）。",
  price: 13.99,
  image: "http://via.placeholder.com/500x150"
)

Ad.create!(
  title: "Vestibulum",
  description: "Cras egestas sapien sit amet lectus imperdiet malesuada. Sed orci orci, porttitor non scelerisque eu, finibus et enim. Praesent lacinia id nisi sed laoreet. Nulla sodales felis ut neque convallis elementum. Aenean venenatis augue id posuere lacinia. Quisque et suscipit elit, quis sagittis lorem. Pellentesque laoreet egestas sapien, vitae feugiat dolor ullamcorper sed.
In eu dolor non eros tincidunt efficitur ut eu velit. Vestibulum fermentum blandit nisl, eu finibus urna sodales ac. Aliquam efficitur lacus a lectus sagittis porttitor. Nullam rhoncus aliquet suscipit. Nulla fringilla nibh bibendum ultrices varius. Aenean quis quam tincidunt, ornare neque nec, tempus risus. Mauris pharetra augue sit amet placerat ultrices. Aenean mattis tempus luctus. Praesent vel magna lobortis, lacinia leo quis, cursus massa. Fusce sit amet vestibulum massa. Fusce condimentum, magna sed porta tempor, metus elit ornare leo, eget feugiat odio metus porta sapien.",
  price: 64.99,
  image: "http://via.placeholder.com/125x450"
)

Ad.create!(
  title: "Suspendisse commodo facilisis",
  description: "Vivamus ut convallis justo. Suspendisse commodo facilisis eros. Mauris tempor semper commodo. Phasellus tempor dignissim sem non efficitur. Duis sit amet mauris sagittis arcu blandit pulvinar et ac diam. Donec fringilla sem a lectus euismod gravida. Etiam ultricies viverra justo ut laoreet. Mauris rutrum non nisi vitae consectetur. Aenean sed sapien quam. Cras orci quam, ullamcorper et molestie et, dignissim pretium risus. Curabitur dapibus sagittis lacus. Proin ornare fringilla fermentum. Nulla et fringilla tortor, sit amet tincidunt mauris. Aliquam consectetur feugiat ex, in hendrerit nisi suscipit non.",
  price: 56.49,
  image: "http://via.placeholder.com/150x150"
)

Ad.create!(
  title: "Aliquam ultrices bibendum",
  description: "Nunc convallis enim quis nibh fermentum commodo. Etiam massa odio, posuere a rutrum id, egestas ultrices justo. Pellentesque tincidunt, ante quis laoreet consequat, ipsum augue pretium ipsum, at aliquam mauris leo a dui. Morbi porta nunc sed lobortis rhoncus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus nec purus nec sem ullamcorper congue quis non ex. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed fermentum leo non orci condimentum faucibus. Aliquam ultrices bibendum aliquam. Fusce vel justo sit amet ex luctus fringilla sit amet ac eros. Aliquam a erat sagittis, iaculis sem vel, maximus justo. Donec dignissim nec nisl eu tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
  price: 9.82,
  image: "http://via.placeholder.com/250x150"
)

puts "Generated Ad seed"

Category.create!(
  name: "appliances"
)

Category.create!(
  name: "books"
)

Category.create!(
  name: "phones"
)

Category.create!(
  name: "electronics"
)

Category.create!(
  name: "furniture"
)

Category.create!(
  name: "general"
)

Category.create!(
  name: "materials"
)

Category.create!(
  name: "pets"
)

Category.create!(
  name: "software"
)

Category.create!(
  name: "music"
)

Category.create!(
  name: "food"
)

Category.create!(
  name: "services"
)

puts "Generated Category seed"
