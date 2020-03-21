import 'dart:math';

import 'itemModel.dart';

class MockData{
  static List<Item> items = new List<Item>();
  static List<int> shoppingCart = new List<int>();

  static void seedMockData(){
    items.add(new Item(
      id: 0,
      itemName: 'I Still Believe',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The true story of Christian music star Jeremy Camp and his journey of love and loss.',
      genre: 'Romance',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/i_still_believe.jpg',
    ));

    items.add(new Item(
      id: 1,
      itemName: 'The Hunt',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Twelve strangers wake up in a clearing. They don\'t know where they are -- or how they got there. In the shadow of a dark internet conspiracy theory, ruthless elitists gather at a remote location to hunt humans for sport. But their master plan is about to be derailed when one of the hunted, Crystal, turns the tables on her pursuers.',
      genre: 'Horror',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_hunt.jpg',
    ));

    items.add(new Item(
      id: 2,
      itemName: 'Bloodshot',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'After he and his wife are murdered, marine Ray Garrison is resurrected by a team of scientists. Enhanced with nanotechnology, he becomes a superhuman, biotech killing machine - Bloodshot. As Ray first trains with fellow super-soldiers, he cannot recall anything from his former life. But when his memories flood back and he remembers the man that killed both him and his wife, he breaks out of the facility to get revenge, only to discover that there\'s more to the conspiracy than he thought.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/bloodshot.jpg',
    ));

    items.add(new Item(
      id: 3,
      itemName: 'Onward',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Two teenage elf brothers, Ian and Barley Lightfoot, go on an journey to discover if there is still a little magic left out there in order to spend one last day with their father, who died when they were too young to remember him.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/onward.jpg',
    ));

    items.add(new Item(
      id: 4,
      itemName: 'The Invisible Man',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'After staging his own suicide, a crazed scientist uses his power to become invisible to stalk and terrorize his ex-girlfriend. When the police refuse to believe her story, she decides to take matters into her own hands and fight back.',
      genre: 'Horror',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_invisible_man.jpeg',
    ));

    items.add(new Item(
      id: 5,
      itemName: 'The Call of the Wild',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Buck is a big-hearted dog whose blissful domestic life gets turned upside down when he is suddenly uprooted from his California home and transplanted to the exotic wilds of the Alaskan Yukon in the 1890s. As the newest rookie on a mail-delivery dog sled team, Buck experiences the adventure of a lifetime as he ultimately finds his true place in the world.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_call_of_the_wild.jpg',
    ));

    items.add(new Item(
      id: 6,
      itemName: 'Fantasy Island',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The enigmatic Mr Roarke makes the secret dreams of his lucky guests come true at a luxurious but remote tropical resort, but when the fantasies turn into nightmares, the guests have to solve the island\'s mystery in order to escape with their lives.',
      genre: 'Thriller',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/fantasy_island.jpg',
    ));

    items.add(new Item(
      id: 7,
      itemName: 'Sonic the Hedgehog',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Sonic tries to navigate the complexities of life on Earth with his newfound best friend -- a human named Tom Wachowski. They must soon join forces to prevent the evil Dr. Robotnik from capturing Sonic and using his powers for world domination.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/sonic_the_hedgehog.jpg',
    ));

    items.add(new Item(
      id: 8,
      itemName: 'Birds of Prey',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'It\'s open season on Harley Quinn when her explosive breakup with the Joker puts a big fat target on her back. Unprotected and on the run, Quinn faces the wrath of narcissistic crime boss Black Mask, his right-hand man, Victor Zsasz, and every other thug in the city. But things soon even out for Harley when she becomes unexpected allies with three deadly women -- Huntress, Black Canary and Renee Montoya.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/birds_of_prey.jpg',
    ));

    items.add(new Item(
      id: 9,
      itemName: 'The Gentlemen',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Mickey Pearson is an American expatriate who became rich by building a highly profitable marijuana empire in London. When word gets out that he\'s looking to cash out of the business, it soon triggers an array of plots and schemes -- including bribery and blackmail -- from shady characters who want to steal his domain.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_gentlemen.jpg',
    ));

    items.add(new Item(
      id: 10,
      itemName: 'Dolittle',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Dr. John Dolittle lives in solitude behind the high walls of his lush manor in 19th-century England. His only companionship comes from an array of exotic animals that he speaks to on a daily basis. But when young Queen Victoria becomes gravely ill, the eccentric doctor and his furry friends embark on an epic adventure to a mythical island to find the cure.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/dolittle.jpg',
    ));

    items.add(new Item(
      id: 11,
      itemName: '1917',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'During World War I, two British soldiers -- Lance Cpl. Schofield and Lance Cpl. Blake -- receive seemingly impossible orders. In a race against time, they must cross over into enemy territory to deliver a message that could potentially save 1,600 of their fellow comrades -- including Blake\'s own brother.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/1917.jpg',
    ));

    items.add(new Item(
      id: 12,
      itemName: 'Little Women',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'In the years after the Civil War, Jo March lives in New York and makes her living as a writer, while her sister Amy studies painting in Paris. Amy has a chance encounter with Theodore, a childhood crush who proposed to Jo but was ultimately rejected. Their oldest sibling, Meg, is married to a schoolteacher, while shy sister Beth develops a devastating illness that brings the family back together.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/little_women.jpg',
    ));

    items.add(new Item(
      id: 13,
      itemName: 'Spies in Disguise',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Super spy Lance Sterling and scientist Walter Beckett are almost exact opposites. Lance is smooth, suave and debonair. Walter is not. But what Walter lacks in social skills he makes up for in smarts and invention, creating the awesome gadgets Lance uses on his epic missions. But when events take an unexpected turn, Walter and Lance suddenly have to rely on each other in a whole new way. And if this odd couple can\'t learn to work as a team, the whole world is in peril.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/spies_in_disguise.jpg',
    ));

    items.add(new Item(
      id: 14,
      itemName: 'Cats',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'A tribe of cats must decide yearly which one will ascend to the Heaviside Layer and come back to a new life.',
      genre: 'Comedy',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/cats.jpg',
    ));

    items.add(new Item(
      id: 15,
      itemName: 'Star Wars: Rise of Skywalker',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'When it\'s discovered that the evil Emperor Palpatine did not die at the hands of Darth Vader, the rebels must race against the clock to find out his whereabouts. Finn and Poe lead the Resistance to put a stop to the First Order\'s plans to form a new Empire, while Rey anticipates her inevitable confrontation with Kylo Ren. Warning: Some flashing-lights scenes in this film may affect photosensitive viewers.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/star_wars_rise_of_skywalker.jpg',
    ));

    items.add(new Item(
      id: 16,
      itemName: 'Uncut Gems',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'A charismatic jeweller makes a high-stakes bet that could lead to the windfall of a lifetime. In a precarious high-wire act, he must balance business, family and adversaries on all sides in pursuit of the ultimate win.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/uncut_gems.jpg',
    ));

    items.add(new Item(
      id: 17,
      itemName: 'Bombshell',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The provocative real story of three whip-smart, ambitious, strong women who anchored one of America\'s most powerful news networks -- becoming headlines themselves when they risked everything to stand up to the man who made them famous.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/bombshell.jpg',
    ));

    items.add(new Item(
      id: 18,
      itemName: 'Jumanji: The Next Level',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'When Spencer goes back into the fantastical world of Jumanji, pals Martha, Fridge and Bethany re-enter the game to bring him home. But the game is now broken -- and fighting back. Everything the friends know about Jumanji is about to change, as they soon discover there\'s more obstacles and more danger to overcome.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/jumanji_the_next_level.jpg',
    ));

    items.add(new Item(
      id: 19,
      itemName: 'Knives Out',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The circumstances surrounding the death of crime novelist Harlan Thrombey are mysterious, but there\'s one thing that renowned Detective Benoit Blanc knows for sure -- everyone in the wildly dysfunctional Thrombey family is a suspect. Now, Blanc must sift through a web of lies and red herrings to uncover the truth.',
      genre: 'Thriller',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/knives_out.jpg',
    ));

    items.add(new Item(
      id: 20,
      itemName: 'Frozen II',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Elsa the Snow Queen has an extraordinary gift -- the power to create ice and snow. But no matter how happy she is to be surrounded by the people of Arendelle, Elsa finds herself strangely unsettled. After hearing a mysterious voice call out to her, Elsa travels to the enchanted forests and dark seas beyond her kingdom -- an adventure that soon turns into a journey of self-discovery.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/frozen_ii.jpg',
    ));

    items.add(new Item(
      id: 21,
      itemName: ' A Beautiful Day in the Neighborhood',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Lloyd Vogel is an investigative journalist who receives an assignment to profile Fred Rogers, aka Mr. Rogers. He approaches the interview with skepticism, as he finds it hard to believe that anyone can have such a good nature. But Roger\'s empathy, kindness and decency soon chips away at Vogel\'s jaded outlook on life, forcing the reporter to reconcile with his own painful past.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/a_beautiful_day_in_the_neighborhood.jpg',
    ));

    items.add(new Item(
      id: 22,
      itemName: 'Ford v. Ferrari',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'American automotive designer Carroll Shelby and fearless British race car driver Ken Miles battle corporate interference, the laws of physics and their own personal demons to build a revolutionary vehicle for the Ford Motor Co. Together, they plan to compete against the race cars of Enzo Ferrari at the 24 Hours of Le Mans in France in 1966.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/ford_v_ferrari.png',
    ));

    items.add(new Item(
      id: 23,
      itemName: 'Midway',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'On Dec. 7, 1941, Japanese forces launch a devastating attack on Pearl Harbor, the U.S. naval base in Hawaii. Six months later, the Battle of Midway commences on June 4, 1942, as the Japanese navy once again plans a strike against American ships in the Pacific. For the next three days, the U.S. Navy and a squad of brave fighter pilots engage the enemy in one of the most important and decisive battles of World War II.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/midway.jpg',
    ));

    items.add(new Item(
      id: 24,
      itemName: 'Zombieland: Double Tap',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Zombie slayers Tallahassee, Columbus, Wichita and Little Rock leave the confines of the White House to travel to Graceland in Memphis, Tenn. Along the way, they encounter other post-apocalyptic warriors and a group of survivors who find refuge in a commune. The scrappy fighters must now rely on their wits and weapons more than ever as they soon find themselves in a relentless battle against smarter, faster and seemingly indestructible zombies.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/zombieland_double_tap.jpg',
    ));

    items.add(new Item(
      id: 25,
      itemName: 'Joker',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he\'s part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/joker.jpg',
    ));

    items.add(new Item(
      id: 26,
      itemName: 'It: Chapter Two',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Defeated by members of the Losers\' Club, the evil clown Pennywise returns 27 years later to terrorize the town of Derry, Maine, once again. Now adults, the childhood friends have long since gone their separate ways. But when people start disappearing, Mike Hanlon calls the others home for one final stand. Damaged by scars from the past, the united Losers must conquer their deepest fears to destroy the shape-shifting Pennywise -- now more powerful than ever.',
      genre: 'Horror',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/it_two.jpg',
    ));

    items.add(new Item(
      id: 27,
      itemName: 'Once Upon a Time in Hollywood',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Actor Rick Dalton gained fame and fortune by starring in a 1950s television Western, but is now struggling to find meaningful work in a Hollywood that he doesn\'t recognize anymore. He spends most of his time drinking and palling around with Cliff Booth, his easygoing best friend and longtime stunt double. Rick also happens to live next door to Roman Polanski and Sharon Tate -- the filmmaker and budding actress whose futures will forever be altered by members of the Manson Family.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/once_upon_a_time_in_hollywood.png',
    ));

    items.add(new Item(
      id: 28,
      itemName: 'The Lion King',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Simba idolizes his father, King Mufasa, and takes to heart his own royal destiny on the plains of Africa. But not everyone in the kingdom celebrates the new cub\'s arrival. Scar, Mufasa\'s brother -- and former heir to the throne -- has plans of his own. The battle for Pride Rock is soon ravaged with betrayal, tragedy and drama, ultimately resulting in Simba\'s exile. Now, with help from a curious pair of newfound friends, Simba must figure out how to grow up and take back what is rightfully his.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_lion_king_new.jpg',
    ));

    items.add(new Item(
      id: 29,
      itemName: 'Toy Story 4',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Woody, Buzz Lightyear and the rest of the gang embark on a road trip with Bonnie and a new toy named Forky. The adventurous journey turns into an unexpected reunion as Woody\'s slight detour leads him to his long-lost friend Bo Peep. As Woody and Bo discuss the old days, they soon start to realize that they\'re worlds apart when it comes to what they want from life as a toy.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/toy_story_4.jpg',
    ));

    items.add(new Item(
      id: 30,
      itemName: 'Back to the Future',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Back to the Future is a 1985 American science fiction film directed by Robert Zemeckis and written by Zemeckis and Bob Gale. It stars Michael J. Fox as teenager Marty McFly, who accidentally travels back in time from 1985 to 1955, where he meets his future parents and becomes his mother\'s romantic interest.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/back_to_the_future.jpg',
    ));

    items.add(new Item(
      id: 31,
      itemName: 'Star Wars: A New Hope',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The Imperial Forces -- under orders from cruel Darth Vader (David Prowse) -- hold Princess Leia (Carrie Fisher) hostage, in their efforts to quell the rebellion against the Galactic Empire. Luke Skywalker (Mark Hamill) and Han Solo (Harrison Ford), captain of the Millennium Falcon, work together with the companionable droid duo R2-D2 (Kenny Baker) and C-3PO (Anthony Daniels) to rescue the beautiful princess, help the Rebel Alliance, and restore freedom and justice to the Galaxy.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/star_wars_a_new_hope.jpg',
    ));

    items.add(new Item(
      id: 32,
      itemName: 'Star Wars: The Empire Strikes Back',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The adventure continues in this "Star Wars" sequel. Luke Skywalker (Mark Hamill), Han Solo (Harrison Ford), Princess Leia (Carrie Fisher) and Chewbacca (Peter Mayhew) face attack by the Imperial forces and its AT-AT walkers on the ice planet Hoth. While Han and Leia escape in the Millennium Falcon, Luke travels to Dagobah in search of Yoda. Only with the Jedi master\'s help will Luke survive when the dark side of the Force beckons him into the ultimate duel with Darth Vader (David Prowse).',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/star_wars_empire_strikes_back.jpg',
    ));

    items.add(new Item(
      id: 33,
      itemName: 'Star Wars: Return of the Jedi',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Luke Skywalker (Mark Hamill) battles horrible Jabba the Hut and cruel Darth Vader to save his comrades in the Rebel Alliance and triumph over the Galactic Empire. Han Solo (Harrison Ford) and Princess Leia (Carrie Fisher) reaffirm their love and team with Chewbacca, Lando Calrissian (Billy Dee Williams), the Ewoks and the androids C-3PO and R2-D2 to aid in the disruption of the Dark Side and the defeat of the evil emperor.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/star_wars_return_of_the_jedi.jpg',
    ));

    items.add(new Item(
      id: 34,
      itemName: 'Spider Man',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: '"Spider-Man" centers on student Peter Parker (Tobey Maguire) who, after being bitten by a genetically-altered spider, gains superhuman strength and the spider-like ability to cling to any surface. He vows to use his abilities to fight crime, coming to understand the words of his beloved Uncle Ben: "With great power comes great responsibility."',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/spiderman.jpg',
    ));

    items.add(new Item(
      id: 35,
      itemName: 'Indiana Jones Raiders of the Lost Ark',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Epic tale in which an intrepid archaeologist tries to beat a band of Nazis to a unique religious relic which is central to their plans for world domination. Battling against a snake phobia and a vengeful ex-girlfriend, Indiana Jones is in constant peril, making hair\'s-breadth escapes at every turn in this celebration of the innocent adventure movies of an earlier era.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/indiana_jones_raiders_of_the_lost_ark.jpg',
    ));

    items.add(new Item(
      id: 36,
      itemName: 'Indiana Jones Temple of Doom',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Adventure sequel. Intrepid archaeologist Indiana Jones, on the trail of fortune and glory in Old Shanghai, is ricocheted into a dangerous adventure in India. With his faithful companion Short Round and nightclub singer Willie Scott, Indie goes in search of the magical Sankara stone, and uncovers an ancient evil which threatens all who come into contact with it.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/indiana_jones_temple_of_doom.jpg',
    ));

    items.add(new Item(
      id: 37,
      itemName: 'Indiana Jones The Last Crusade',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The intrepid explorer Indiana Jones sets out to rescue his father, a medievalist who has vanished while searching for the Holy Grail. Following clues in the old man\'s notebook, Indy arrives in Venice, where he enlists the help of a beautiful academic, but they are not the only ones who are on the trail, and some sinister old enemies soon come out of the woodwork.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/indiana_jones_the_last_crusade.png',
    ));

    items.add(new Item(
      id: 38,
      itemName: 'Dirty Dancing',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Baby (Jennifer Grey) is one listless summer away from the Peace Corps. Hoping to enjoy her youth while it lasts, she\'s disappointed when her summer plans deposit her at a sleepy resort in the Catskills with her parents. Her luck turns around, however, when the resort\'s dance instructor, Johnny (Patrick Swayze), enlists Baby as his new partner, and the two fall in love. Baby\'s father forbids her from seeing Johnny, but she\'s determined to help him perform the last big dance of the summer.',
      genre: 'Romance',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/dirty_dancing.jpg',
    ));

    items.add(new Item(
      id: 39,
      itemName: 'The Big Labowski',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Jeff `The Dude\' Leboswki is mistaken for Jeffrey Lebowski, who is The Big Lebowski. Which explains why he\'s roughed up and has his precious rug peed on. In search of recompense, The Dude tracks down his namesake, who offers him a job. His wife has been kidnapped and he needs a reliable bagman. Aided and hindered by his pals Walter Sobchak, a Vietnam vet, and Donny, master of stupidity.',
      genre: 'Comedy',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_big_labowski.jpg',
    ));

    items.add(new Item(
      id: 40,
      itemName: 'Titanic',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'James Cameron\'s "Titanic" is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the "ship of dreams" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912.',
      genre: 'Romance',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/titanic.png',
    ));

    items.add(new Item(
      id: 41,
      itemName: 'The Lion King',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'This Disney animated feature follows the adventures of the young lion Simba (Jonathan Taylor Thomas), the heir of his father, Mufasa (James Earl Jones). Simba\'s wicked uncle, Scar (Jeremy Irons), plots to usurp Mufasa\'s throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult (Matthew Broderick) to take back his homeland from Scar with the help of his friends Timon (Nathan Lane) and Pumbaa (Ernie Sabella).',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_lion_king_old.jpg',
    ));

    items.add(new Item(
      id: 42,
      itemName: 'Forrest Gump',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Slow-witted Forrest Gump (Tom Hanks) has never thought of himself as disadvantaged, and thanks to his supportive mother (Sally Field), he leads anything but a restricted life. Whether dominating on the gridiron as a college football star, fighting in Vietnam or captaining a shrimp boat, Forrest inspires people with his childlike optimism. But one person Forrest cares about most may be the most difficult to save -- his childhood love, the sweet but troubled Jenny (Robin Wright).',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/forrest_gump.jpg',
    ));

    items.add(new Item(
      id: 43,
      itemName: 'Star Trek II: Wrath of Khan',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'As Adm. James T. Kirk (William Shatner) and Capt. Spock (Leonard Nimoy) monitor trainees at Starfleet Academy, another vessel from the United Federation of Planets is about to try out the planet-creating Genesis Device in a seemingly deserted portion of space. In the process, two of Kirk\'s officers are captured by Khan (Ricardo Montalban), an enemy Kirk thought he\'d never see again. Once more, Kirk takes the Enterprise\'s helm, where he meets Khan\'s ship in an intergalactic showdown.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/star_trek_the_wrath_of_khan.jpg',
    ));

    items.add(new Item(
      id: 44,
      itemName: 'Grease',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'A musical about teens in love in the 50\'s! It\'s California 1959 and greaser Danny Zuko and Australian Sandy Olsson are in love. They spend time at the beach, and when they go back to school, what neither of them knows is that they both now attend Rydell High.',
      genre: 'Romance',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/grease.jpg',
    ));

    items.add(new Item(
      id: 45,
      itemName: 'Footloose',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Moving in from Chicago, newcomer Ren McCormack (Kevin Bacon) is in shock when he discovers the small Midwestern town he now calls home has made dancing and rock music illegal. As he struggles to fit in, Ren faces an uphill battle to change things. With the help of his new friend, Willard Hewitt (Christopher Penn), and defiant teen Ariel Moore (Lori Singer), he might loosen up this conservative town. But Ariel\'s influential father, Reverend Shaw Moore (John Lithgow), stands in the way.',
      genre: 'Romance',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/footloose.jpg',
    ));

    items.add(new Item(
      id: 46,
      itemName: 'Independence Day',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'In the epic adventure film `Independence Day,\' strange phenomena surface around the globe. The skies ignite. Terror races through the world\'s major cities. As these extraordinary events unfold, it becomes increasingly clear that a force of incredible magnitude has arrived. Its mission: total annihilation over the Fourth of July weekend. The last hope to stop the destruction is an unlikely group of people united by fate and unimaginable circumstances.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/independence_day.jpg',
    ));

    items.add(new Item(
      id: 47,
      itemName: 'Ferris Bueller\'s Day Off ',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Ferris Bueller (Matthew Broderick) has an uncanny skill at cutting classes and getting away with it. Intending to make one last duck-out before graduation, Ferris calls in sick, "borrows" a Ferrari, and embarks on a one-day journey through the streets of Chicago. On Ferris\' trail is high school principal Rooney (Jeffrey Jones), determined to catch him in the act.',
      genre: 'Comedy',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/ferris_buellers_day_off.jpg',
    ));

    items.add(new Item(
      id: 48,
      itemName: 'The Godfather',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Widely regarded as one of the greatest films of all time, this mob drama, based on Mario Puzo\'s novel of the same name, focuses on the powerful Italian-American crime family of Don Vito Corleone (Marlon Brando). When the don\'s youngest son, Michael (Al Pacino), reluctantly joins the Mafia, he becomes involved in the inevitable cycle of violence and betrayal. Although Michael tries to maintain a normal relationship with his wife, Kay (Diane Keaton), he is drawn deeper into the family business.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_godfather.jpg',
    ));

    items.add(new Item(
      id: 49,
      itemName: 'Scarface',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'After getting a green card in exchange for assassinating a Cuban government official, Tony Montana (Al Pacino) stakes a claim on the drug trade in Miami. Viciously murdering anyone who stands in his way, Tony eventually becomes the biggest drug lord in the state, controlling nearly all the cocaine that comes through Miami. But increased pressure from the police, wars with Colombian drug cartels and his own drug-fueled paranoia serve to fuel the flames of his eventual downfall.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/scarface.jpg',
    ));

    items.add(new Item(
      id: 50,
      itemName: 'The Breakfast Club',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Five high school students from different walks of life endure a Saturday detention under a power-hungry principal (Paul Gleason). The disparate group includes rebel John (Judd Nelson), princess Claire (Molly Ringwald), outcast Allison (Ally Sheedy), brainy Brian (Anthony Michael Hall) and Andrew (Emilio Estevez), the jock. Each has a chance to tell his or her story, making the others see them a little differently -- and when the day ends, they question whether school will ever be the same.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_breakfast_club.jpg',
    ));

    items.add(new Item(
      id: 51,
      itemName: 'E.T',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'After a gentle alien becomes stranded on Earth, the being is discovered and befriended by a young boy named Elliott (Henry Thomas). Bringing the extraterrestrial into his suburban California house, Elliott introduces E.T., as the alien is dubbed, to his brother and his little sister, Gertie (Drew Barrymore), and the children decide to keep its existence a secret. Soon, however, E.T. falls ill, resulting in government intervention and a dire situation for both Elliott and the alien.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/et.jpg',
    ));

    items.add(new Item(
      id: 52,
      itemName: 'The Terminator',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Disguised as a human, a cyborg assassin known as a Terminator (Arnold Schwarzenegger) travels from 2029 to 1984 to kill Sarah Connor (Linda Hamilton). Sent to protect Sarah is Kyle Reese (Michael Biehn), who divulges the coming of Skynet, an artificial intelligence system that will spark a nuclear holocaust. Sarah is targeted because Skynet knows that her unborn son will lead the fight against them. With the virtually unstoppable Terminator in hot pursuit, she and Kyle attempt to escape.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_terminator.jpg',
    ));

    items.add(new Item(
      id: 53,
      itemName: 'Die Hard',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'New York City policeman John McClane (Bruce Willis) is visiting his estranged wife (Bonnie Bedelia) and two daughters on Christmas Eve. He joins her at a holiday party in the headquarters of the Japanese-owned business she works for. But the festivities are interrupted by a group of terrorists who take over the exclusive high-rise, and everyone in it. Very soon McClane realizes that there\'s no one to save the hostages -- but him.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/die_hard.jpg',
    ));

    items.add(new Item(
      id: 54,
      itemName: 'Top Gun',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The Top Gun Naval Fighter Weapons School is where the best of the best train to refine their elite flying skills. When hotshot fighter pilot Maverick (Tom Cruise) is sent to the school, his reckless attitude and cocky demeanor put him at odds with the other pilots, especially the cool and collected Iceman (Val Kilmer). But Maverick isn\t only competing to be the top fighter pilot, he\'s also fighting for the attention of his beautiful flight instructor, Charlotte Blackwood (Kelly McGillis).',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/top_gun.jpg',
    ));

    items.add(new Item(
      id: 55,
      itemName: 'Ghostbusters',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'After the members of a team of scientists (Harold Ramis, Dan Aykroyd, Bill Murray) lose their cushy positions at a university in New York City, they decide to become "ghostbusters" to wage a high-tech battle with the supernatural for money. They stumble upon a gateway to another dimension, a doorway that will release evil upon the city. The Ghostbusters must now save New York from complete destruction.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/ghostbusters.jpg',
    ));

    items.add(new Item(
      id: 56,
      itemName: 'Goonies',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Old-fashioned yarn about a band of adventurous kids who take on the might of a property developing company which plans to destroy their home to build a country club. When the children discover an old pirate map in the attic, they follow it into an underground cavern in search of lost treasure but come up against plenty of dangerous obstacles along the way.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/goonies.jpg',
    ));

    items.add(new Item(
      id: 57,
      itemName: 'The Princess Bride',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'A fairy tale adventure about a beautiful young woman and her one true love. He must find her after a long separation and save her. They must battle the evils of the mythical kingdom of Florin to be reunited with each other. Based on the William Goldman novel "The Princess Bride" which earned its own loyal audience.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_princess_bride.jpg',
    ));

    items.add(new Item(
      id: 58,
      itemName: 'The Karate Kid',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Daniel (Ralph Macchio) moves to Southern California with his mother, Lucille (Randee Heller), but quickly finds himself the target of a group of bullies who study karate at the Cobra Kai dojo. Fortunately, Daniel befriends Mr. Miyagi (Noriyuki "Pat" Morita), an unassuming repairman who just happens to be a martial arts master himself. Miyagi takes Daniel under his wing, training him in a more compassionate form of karate and preparing him to compete against the brutal Cobra Kai.',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/the_karate_kid.jpg',
    ));

    items.add(new Item(
      id: 59,
      itemName: 'Caddyshack',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Danny Noonan (Michael O\'Keefe), a teen down on his luck, works as a caddy at the snob-infested Bushwood Country Club to raise money for his college education. In an attempt to gain votes for a college scholarship reserved for caddies, Noonan volunteers to caddy for a prominent and influential club member (Ted Knight). Meanwhile, Danny struggles to prepare for the high pressure Caddy Day golf tournament while absorbing New Age advice from wealthy golf guru Ty Webb (Chevy Chase).',
      genre: 'Comedy',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/caddyshack.jpg',
    ));

    items.add(new Item(
      id: 60,
      itemName: 'Pulp Fiction',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Vincent Vega (John Travolta) and Jules Winnfield (Samuel L. Jackson) are hitmen with a penchant for philosophical discussions. In this ultra-hip, multi-strand crime movie, their storyline is interwoven with those of their boss, gangster Marsellus Wallace (Ving Rhames) ; his actress wife, Mia (Uma Thurman) ; struggling boxer Butch Coolidge (Bruce Willis) ; master fixer Winston Wolfe (Harvey Keitel) and a nervous pair of armed robbers, "Pumpkin" (Tim Roth) and "Honey Bunny" (Amanda Plummer).',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/pulp_fiction.jpg',
    ));

    items.add(new Item(
      id: 61,
      itemName: 'Jurrassic Park',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'In Steven Spielberg\'s massive blockbuster, paleontologists Alan Grant (Sam Neill) and Ellie Sattler (Laura Dern) and mathematician Ian Malcolm (Jeff Goldblum) are among a select group chosen to tour an island theme park populated by dinosaurs created from prehistoric DNA. While the park\'s mastermind, billionaire John Hammond (Richard Attenborough), assures everyone that the facility is safe, they find out otherwise when various ferocious predators break free and go on the hunt.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/jurrassic_park.jpg',
    ));

    items.add(new Item(
      id: 62,
      itemName: 'Good Will Hunting',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Will Hunting (Matt Damon) has a genius-level IQ but chooses to work as a janitor at MIT. When he solves a difficult graduate-level math problem, his talents are discovered by Professor Gerald Lambeau (Stellan Skarsgard), who decides to help the misguided youth reach his potential. When Will is arrested for attacking a police officer, Professor Lambeau makes a deal to get leniency for him if he will get treatment from therapist Sean Maguire (Robin Williams).',
      genre: 'Drama',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/good_will_hunting.png',
    ));

    items.add(new Item(
      id: 63,
      itemName: 'Lord of the Rings Fellowship of the Ring',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins (Elijah Wood), who inherits the Ring and steps into legend. A daunting task lies ahead for Frodo when he becomes the Ringbearer - to destroy the One Ring in the fires of Mount Doom where it was forged.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/lord_of_the_rings_fellowship_of_the_ring.jpg',
    ));

    items.add(new Item(
      id: 64,
      itemName: 'Lord of the Rings Two Towers',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The sequel to the Golden Globe-nominated and AFI Award-winning "The Lord of the Rings: The Fellowship of the Ring," "The Two Towers" follows the continuing quest of Frodo (Elijah Wood) and the Fellowship to destroy the One Ring. Frodo and Sam (Sean Astin) discover they are being followed by the mysterious Gollum. Aragorn (Viggo Mortensen), the Elf archer Legolas and Gimli the Dwarf encounter the besieged Rohan kingdom, whose once great King Theoden has fallen under Saruman\'s deadly spell.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/lord_of_the_rings_two_towers.jpg',
    ));

    items.add(new Item(
      id: 65,
      itemName: 'Lord of the Rings Return of the King',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'The culmination of nearly 10 years\' work and conclusion to Peter Jackson\'s epic trilogy based on the timeless J.R.R. Tolkien classic, "The Lord of the Rings: The Return of the King" presents the final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Hobbits Frodo and Sam reach Mordor in their quest to destroy the `one ring\', while Aragorn leads the forces of good against Sauron\'s evil army at the stone city of Minas Tirith.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/lord_of_the_rings_return_of_the_king.jpg',
    ));

    items.add(new Item(
      id: 66,
      itemName: 'Gladiator',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Set in Roman times, the story of a once-powerful general forced to become a common gladiator. The emperor\'s son is enraged when he is passed over as heir in favour of his father\'s favourite general. He kills his father and arranges the murder of the general\'s family, and the general is sold into slavery to be trained as a gladiator - but his subsequent popularity in the arena threatens the throne.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/gladiator.png',
    ));

    items.add(new Item(
      id: 67,
      itemName: 'Avatar',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'On the lush alien world of Pandora live the Na\'vi, beings who appear primitive but are highly evolved. Because the planet\'s environment is poisonous, human/Na\'vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully (Sam Worthington), a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na\'vi woman (Zoe Saldana). As a bond with her grows, he is drawn into a battle for the survival of her world.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/avatar.jpg',
    ));

    items.add(new Item(
      id: 68,
      itemName: 'Iron Man',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Iron Man is a 2008 American superhero film based on the Marvel Comics character of the same name. ... In Iron Man, Tony Stark is an industrialist and master engineer who builds a mechanized suit of armor and becomes the superhero Iron Man.',
      genre: 'Action',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/iron_man.jpg',
    ));

    items.add(new Item(
      id: 69,
      itemName: 'Pirates of the Caribbean',
      unitPrice: 10.99,
      quantity: Random().nextInt(20),
      description: 'Capt. Jack Sparrow (Johnny Depp) arrives at Port Royal in the Caribbean without a ship or crew. His timing is inopportune, however, because later that evening the town is besieged by a pirate ship. The pirates kidnap the governor\'s daughter, Elizabeth (Keira Knightley), who\'s in possession of a valuable coin that is linked to a curse that has transformed the pirates into the undead. A gallant blacksmith (Orlando Bloom) in love with Elizabeth allies with Sparrow in pursuit of the pirates.',
      genre: 'Adventure',
      isUsed: false,
      isVerified: true,
      imagePath: 'assets/posters/pirates_of_the_caribbean.png',
    ));
  }
}