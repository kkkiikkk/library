books = [
  {
    name: "Nausea",
    author: "Jean Paul Sartre",
    status: "in",
    description: "Nausea, first novel by Jean-Paul Sartre, published in French in 1938 as La Nausée. It is considered Sartre’s fiction masterwork and is an important expression of existentialist philosophy. Nausea is written in the form of a diary that narrates the recurring feelings of revulsion that overcome Roquentin, a young historian, as he comes to realize the banality and emptiness of existence. As the attacks of nausea occur more frequently, Roquentin abandons his research and then finds and loses his few friends. In an indifferent world, without work, love, or friendship to sustain him, he must discover value and meaning within himself.",
    image_name: "book_1.jpg"
  },
  {
    name: "Emperor",
    author: "Niccolo Machiavelli",
    status: "in",
    description: "The Prince, political treatise by Niccolò Machiavelli, written in 1513. A short treatise on how to acquire power, create a state, and keep it, The Prince represents Machiavelli’s effort to provide a guide for political action based on the lessons of history and his own experience as a foreign secretary in Florence. His belief that politics has its own rules so shocked his readers that the adjectival form of his surname, Machiavellian, came to be used as a synonym for political maneuvers marked by cunning, duplicity, or bad faith.",
    image_name: "book_2.jpg"
  },
  {
    name: "Count of Monte Cristo",
    author: "Alexandre Dumas",
    status: "in",
    description: "The novel opens in 1815 as the Pharaon arrives in Marseille. The ship’s owner, Monsieur Morrel, learns from the young first mate, Edmond Dantès, that the captain died on the journey and that Dantès took over. The ship’s accountant, Danglars, is bothered that the Pharaon stopped at Elba, but Dantès explains that the captain left a package to be delivered to one of Napoleon’s marshals who is in exile with Napoleon on the island. Morrel makes Dantès captain of the ship, to Danglars’s displeasure. On visiting his father, Dantès learns that a neighbour, Gaspard Caderousse, took most of his father’s resources in payment of a debt. Dantès then goes to see his fiancée, Mercédès, and finds her in the company of Fernand Mondego, who is in love with her. After leaving, Mondego encounters Danglars and Caderousse, and a decision is made to falsely accuse Dantès of treason. In a letter to the crown prosecutor, Danglars alleges that Dantès is a Bonapartist and is carrying a letter from Napoleon to the Bonapartist committee in Paris.",
    image_name: "book_3.jpg"
  },
  {
    name: "Discourse on the Method",
    author: "Rene Descartes",
    status: "in",
    description: "Discourse on Method is Descartes's attempt to explain his method of reasoning through even the most difficult of problems. He illustrates the development of this method through brief autobiographical sketches interspersed with philosophical arguments.",
    image_name: "book_4.jpg"
  },
  {
    name: "Critique of the Power of Judgment",
    author: "Immanuel Kant",
    status: "in",
    description: "The Critique of Judgment, also translated as the Critique of the Power of Judgment, is a 1790 book by the German philosopher Immanuel Kant. Sometimes referred to as the 'third critique', the Critique of Judgment follows the Critique of Pure Reason and the Critique of Practical Reason.",
    image_name: "book_5.jpg"
  }
]

books.each do |item|
  attributes = {
    name: item[:name],  
    author: item[:author],
    status: item[:status],
    description: item[:description]
  }

  File.open(Rails.root.join("db/seeds/images_book/#{item[:image_name]}")) do |image_file|
    SeedsHelper.create_book!(image_file, attributes)
  end
end
