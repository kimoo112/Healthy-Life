class RecipeModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final bool isHealthy;
  final bool isSoup;
  final bool isSnack;
  final Nutrition nutrition;

  RecipeModel({
    required this.id,
    required this.name,
    required this.isHealthy,
    required this.isSoup,
    required this.isSnack,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.nutrition,
  });
}

class Nutrition {
  final int calories;
  final int protein;
  final int prepTime;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.prepTime,
  });
}

final List<RecipeModel> recipes = [
  RecipeModel(
    id: "1",
    isHealthy: false,
    name: "Spaghetti Bolognese",
    description: "A classic Italian meat sauce served over pasta",
    imageUrl: "assets/images/spaghetti.png",
    ingredients: ["spaghetti", "ground beef", "onions", "tomato sauce"],
    steps: [
      "Cook the spaghetti according to package directions.",
      "Brown the ground beef and onions.",
      "Add the tomato sauce and simmer for 1 hour.",
      "Toss with cooked spaghetti and serve."
    ],
    nutrition: Nutrition(calories: 650, protein: 35, prepTime: 60),
    isSoup: false,
    isSnack: false,
  ),
  RecipeModel(
    id: "2",
    isSoup: false,
    isSnack: false,
    isHealthy: false,
    name: "Chicken Parmesan",
    description:
        "Breaded chicken breast topped with tomato sauce and mozzarella",
    imageUrl: "assets/images/chicken.png",
    ingredients: [
      "chicken breasts",
      "breadcrumbs",
      "parmesan",
      "tomato sauce",
      "mozzarella"
    ],
    steps: [
      "Bread chicken breasts with breadcrumbs.",
      "Pan fry until golden brown.",
      "Top with tomato sauce and mozzarella.",
      "Bake until cheese is melted."
    ],
    nutrition: Nutrition(calories: 550, protein: 45, prepTime: 30),
  ),
  RecipeModel(
    id: "3",
    isSoup: false,
    isSnack: false,
    isHealthy: true,
    name: "Caesar Salad",
    description:
        "Romaine lettuce with creamy Caesar dressing, croutons and parmesan",
    imageUrl: "assets/images/salad.png",
    ingredients: ["romaine lettuce", "caesar dressing", "croutons", "parmesan"],
    steps: [
      "Chop romaine lettuce.",
      "Toss with caesar dressing.",
      "Top with croutons and parmesan."
    ],
    nutrition: Nutrition(calories: 250, protein: 10, prepTime: 10),
  ),
  RecipeModel(
    id: "4",
    isSoup: false,
    isSnack: false,
    name: "Tacos",
    description:
        "Soft tortilla shells filled with seasoned ground beef, lettuce, cheese and salsa",
    isHealthy: false,
    imageUrl: "assets/images/tacos.png",
    ingredients: ["tortillas", "ground beef", "lettuce", "cheese", "salsa"],
    steps: [
      "Cook ground beef with taco seasoning.",
      "Warm tortillas.",
      "Fill with beef, lettuce, cheese and salsa."
    ],
    nutrition: Nutrition(calories: 500, protein: 20, prepTime: 20),
  ),
  RecipeModel(
    isSoup: false,
    isSnack: false,
    id: "5",
    name: "Pasta Alfredo",
    description:
        "Fettuccine pasta tossed in a rich, creamy parmesan cheese sauce",
    isHealthy: false,
    imageUrl: "assets/images/alfredo.png",
    ingredients: ["fettuccine", "butter", "cream", "parmesan"],
    steps: [
      "Cook pasta according to package directions.",
      "Melt butter in a pan.",
      "Add cream and parmesan and cook until thick and creamy.",
      "Toss pasta with sauce."
    ],
    nutrition: Nutrition(calories: 800, protein: 15, prepTime: 15),
  ),
  RecipeModel(
    id: "6",
    isSoup: false,
    isSnack: true,
    name: "Cheese Pizza",
    description: "Crispy crust with tomato sauce and mozzarella cheese",
    isHealthy: false,
    imageUrl: "assets/images/pizza.png",
    ingredients: ["pizza dough", "tomato sauce", "mozzarella"],
    steps: [
      "Stretch dough into rounds.",
      "Top with sauce and cheese.",
      "Bake until crust is crispy and cheese melted."
    ],
    nutrition: Nutrition(calories: 700, protein: 20, prepTime: 40),
  ),
  RecipeModel(
    id: "7",
    isHealthy: true,
    isSoup: false,
    isSnack: true,
    name: "Hamburger",
    description:
        "Juicy beef patty with lettuce, tomato, onion and cheese on a bun",
    imageUrl: "assets/images/burger.png",
    ingredients: [
      "ground beef",
      "hamburger buns",
      "lettuce",
      "tomato",
      "onion",
      "cheese"
    ],
    steps: [
      "Form ground beef into patties and grill.",
      "Toast buns.",
      "Place patty on bun and top with lettuce, tomato, onion and cheese."
    ],
    nutrition: Nutrition(calories: 650, protein: 25, prepTime: 15),
  ),
  RecipeModel(
    id: "8",
    isSoup: false,
    isSnack: true,
    isHealthy: false,
    name: "Chocolate Chip Cookies",
    description: "Chewy cookies filled with chocolate chips",
    imageUrl: "assets/images/cookies.png",
    ingredients: ["flour", "butter", "sugar", "eggs", "chocolate chips"],
    steps: [
      "Cream butter and sugar.",
      "Beat in eggs.",
      "Stir in flour and chocolate chips.",
      "Scoop dough and bake."
    ],
    nutrition: Nutrition(calories: 200, protein: 3, prepTime: 30),
  ),
  RecipeModel(
    isHealthy: true,
    id: "9",
    isSoup: false,
    isSnack: false,
    name: "Chicken Fried Rice",
    description: "Rice stir-fried with chicken, vegetables and egg",
    imageUrl: "assets/images/rice.png",
    ingredients: ["rice", "chicken", "vegetables", "egg", "soy sauce"],
    steps: [
      "Cook rice.",
      "Stir fry chicken and vegetables.",
      "Add rice and stir fry.",
      "Scramble egg and mix in.",
      "Season with soy sauce."
    ],
    nutrition: Nutrition(calories: 450, protein: 25, prepTime: 30),
  ),
  RecipeModel(
    isHealthy: true,
    isSoup: false,
    isSnack: false,
    id: "10",
    name: "Prato Meat",
    description:
        "Classic Brazilian dish featuring seasoned meat served with rice",
    imageUrl: "assets/images/dish_meat_prato.png",
    ingredients: ["Beef sirloin", "Garlic", "Cumin", "Paprika", "Salt"],
    steps: [
      "Slice the beef sirloin into thin strips.",
      "In a bowl, mix minced garlic, cumin, paprika, and salt to create the seasoning.",
      "Rub the seasoning mixture onto the beef strips, ensuring they are well-coated.",
      "Heat a skillet over medium-high heat and cook the seasoned beef until browned and cooked through.",
      "Serve the Prato Meat over a bed of rice and enjoy this flavorful Brazilian dish!"
    ],
    nutrition: Nutrition(calories: 400, protein: 22, prepTime: 30),
  ),
  RecipeModel(
    isHealthy: true,
    isSoup: false,
    isSnack: false,
    id: "11",
    name: "Chinese Ribs",
    description: "Delicious Chinese-style ribs with a savory and sweet glaze",
    imageUrl: "assets/images/ribs vegetarian cuisine chinese with corn.png",
    ingredients: ["Pork ribs", "Soy sauce", "Hoisin sauce", "Garlic", "Ginger"],
    steps: [
      "Preheat the oven to 375°F (190°C).",
      "In a bowl, mix soy sauce, hoisin sauce, minced garlic, and grated ginger to create the marinade.",
      "Place the pork ribs in a large Ziploc bag and pour the marinade over them.",
      "Seal the bag and marinate in the refrigerator for at least 2 hours or overnight for best flavor.",
      "Remove the ribs from the marinade and place them on a baking sheet lined with foil.",
      "Bake for 45-50 minutes or until the ribs are cooked through and caramelized.",
      "Serve hot and enjoy your delicious Chinese Ribs!"
    ],
    nutrition: Nutrition(calories: 350, protein: 18, prepTime: 120),
  ),
  RecipeModel(
    isHealthy: true,
    isSoup: false,
    isSnack: true,
    id: "12",
    name: "Mango Cake",
    description:
        "A guilt-free and delicious chocolate cake with a hint of mango flavor",
    imageUrl: "assets/images/healthy choclate cake with mango.png",
    ingredients: ["rice", "chicken", "vegetables", "egg", "soy sauce"],
    steps: [
      "Preheat the oven to 350°F (175°C).",
      "In a bowl, mix whole wheat flour and cocoa powder.",
      "Add mango puree, Greek yogurt, and honey to the dry ingredients.",
      "Stir until well combined and smooth.",
      "Pour the batter into a greased cake pan.",
      "Bake for 25-30 minutes or until a toothpick inserted comes out clean.",
      "Let it cool before slicing.",
      "Enjoy your guilt-free Mango Diet Chocolate Cake!"
    ],
    nutrition: Nutrition(calories: 200, protein: 8, prepTime: 40),
  ),
  RecipeModel(
    isHealthy: true,
    id: "13",
    isSoup: false,
    isSnack: true,
    name: "Diet Cereal",
    description: "Healthy and delicious diet cereal",
    imageUrl: "assets/images/diet ceral.png",
    ingredients: ["Whole Grain Oats", "Almonds", "Chia Seeds", "Honey", "Milk"],
    steps: [
      "Combine whole grain oats, almonds, and chia seeds in a bowl.",
      "Drizzle honey over the mixture.",
      "Pour milk into the bowl.",
      "Stir well and let it sit for a few minutes.",
      "Enjoy your healthy diet cereal!"
    ],
    nutrition: Nutrition(calories: 300, protein: 10, prepTime: 10),
  ),
  RecipeModel(
    isHealthy: true,
    isSoup: true,
    isSnack: false,
    id: "14",
    name: "Vegetarian Soup",
    description: "A hearty and nutritious vegetarian soup",
    imageUrl: "assets/images/vegetarian soup.png",
    ingredients: [
      "Carrots",
      "Celery",
      "Potatoes",
      "Tomatoes",
      "Vegetable Broth"
    ],
    steps: [
      "Chop carrots, celery, and potatoes into bite-sized pieces.",
      "Dice tomatoes.",
      "In a pot, combine all chopped vegetables.",
      "Pour vegetable broth into the pot.",
      "Bring the mixture to a boil and then simmer until vegetables are tender.",
      "Season with salt and pepper to taste.",
      "Serve hot and enjoy your delicious vegetarian soup!"
    ],
    nutrition: Nutrition(calories: 150, protein: 5, prepTime: 20),
  ),
];
