-- Master Items seed data
-- Extracted from Woolworths receipts (Mar 2026) and Aldi receipts (Oct 2025, Jan 2026)
-- Generated 2026-03-28

INSERT INTO master_items (name, category, store, last_price, last_seen) VALUES

-- =============================================
-- WOOLWORTHS - 07 Mar 2026 (Glenrose/Belrose)
-- =============================================
('WW Traditional Fruit Hot Cross Bun 6pk', 'Pantry', 'Woolworths', 4.40, '2026-03-07'),
('D Card Cake Wish', 'Other', 'Woolworths', 7.99, '2026-03-07'),
('D Card Cat', 'Other', 'Woolworths', 5.99, '2026-03-07'),
('CCs Corn Chips Taco 175g', 'Pantry', 'Woolworths', 2.50, '2026-03-07'),
('Carmans Protein Slice Dark Choc Crisp Roast Nut 175g 5pk', 'Pantry', 'Woolworths', 7.90, '2026-03-07'),
('MMC Beef Stroganoff w Spinach Fettuccine 355g', 'Frozen', 'Woolworths', 9.95, '2026-03-07'),
('MMC Honey Soy Chicken Rice & Veg 330g', 'Frozen', 'Woolworths', 9.95, '2026-03-07'),
('Peters Twin Pole Cola Spider 8pk 544ml', 'Frozen', 'Woolworths', 5.00, '2026-03-07'),
('Farmers Union Greek Yogurt Mango 130g', 'Dairy', 'Woolworths', 2.50, '2026-03-07'),
('Farmers Union Yoghurt Pouch Passionfruit 130g', 'Dairy', 'Woolworths', 2.50, '2026-03-07'),
('Farmers Union Greek Yogurt Strawberry 130g', 'Dairy', 'Woolworths', 2.50, '2026-03-07'),
('MMC Chicken Burrito Bowl 450g', 'Frozen', 'Woolworths', 9.95, '2026-03-07'),

-- =============================================
-- WOOLWORTHS - Online 01 Mar 2026
-- =============================================
('Burgen Soy & Linseed Low GI Sliced Bread 700g', 'Pantry', 'Woolworths', 6.00, '2026-03-14'),
('Woolworths White Wrap 8 Pack', 'Pantry', 'Woolworths', 2.20, '2026-03-01'),
('Sunbites Grain Waves Sour Cream & Chives 170g', 'Pantry', 'Woolworths', 5.00, '2026-03-14'),
('Rokeby Protein Smoothie Vanilla Wafer 425ml', 'Drinks', 'Woolworths', 3.50, '2026-03-01'),
('Coca-Cola Classic 375ml x 24 Pack', 'Drinks', 'Woolworths', 21.00, '2026-03-01'),
('Peters Twin Pole Vanilla Choc 8pk 590ml', 'Frozen', 'Woolworths', 6.00, '2026-03-14'),
('Green Kiwifruit Each', 'Fruit & Veg', 'Woolworths', 1.95, '2026-03-01'),

-- =============================================
-- WOOLWORTHS - 13 Mar 2026 (Glenrose/Belrose)
-- =============================================
('Elbow Grease Baking Soda 350g', 'Household', 'Woolworths', 3.50, '2026-03-13'),
('Cadbury Dairy Milk Roll 55g', 'Pantry', 'Woolworths', 1.50, '2026-03-13'),
('Elbow Grease Descaler 3x25ml', 'Household', 'Woolworths', 8.00, '2026-03-13'),
('Chux Magic Eraser Spot Cleaner 8pk', 'Household', 'Woolworths', 8.00, '2026-03-13'),
('OCedar Miracle Stain Remover 110ml', 'Household', 'Woolworths', 35.00, '2026-03-13'),
('CLR Ready to Use Spray 400ml', 'Household', 'Woolworths', 7.00, '2026-03-13'),
('OzKleen Oven Power Cleaning Kit 500ml', 'Household', 'Woolworths', 4.20, '2026-03-13'),
('MCo FG Foundation 4 Medium 30ml', 'Other', 'Woolworths', 4.65, '2026-03-13'),

-- =============================================
-- WOOLWORTHS - 14 Mar 2026 (Glenrose/Belrose)
-- =============================================
('Mission Mini Wraps Original 8pk 384g', 'Pantry', 'Woolworths', 5.00, '2026-03-14'),
('FFM Satay Chicken Noodles 350g', 'Frozen', 'Woolworths', 8.90, '2026-03-14'),
('Noshu Low Carb Bars Cherry & Coconut 160g 5pk', 'Pantry', 'Woolworths', 6.00, '2026-03-14'),
('Strength Teriyaki Chicken w Brown Rice 350g', 'Frozen', 'Woolworths', 8.95, '2026-03-14'),
('Easy Eats Teriyaki Chicken Stir Fry 350g', 'Frozen', 'Woolworths', 9.50, '2026-03-14'),
('Mayvers LCHP Bar Choc Fudge 128g 4pk', 'Pantry', 'Woolworths', 4.00, '2026-03-14'),
('Strength Meals Co Chicken Pad Thai 350g', 'Frozen', 'Woolworths', 8.95, '2026-03-14'),

-- =============================================
-- WOOLWORTHS - 21 Mar 2026 (Glenrose/Belrose)
-- =============================================
('MCo Makeup Blender Colour Changing 1pk', 'Other', 'Woolworths', 6.45, '2026-03-21'),
('MCo FG Foundation 3.5 Light/Medium 30ml', 'Other', 'Woolworths', 17.50, '2026-03-21'),

-- =============================================
-- ALDI Receipt 1 (~Jan 2026, Belrose)
-- =============================================
('Quilton Toilet Paper 18pk', 'Household', 'Aldi', 9.89, '2026-01-01'),
('Pasta Sauce 425g', 'Pantry', 'Aldi', 3.99, '2026-01-01'),
('Recipe Bases 40g', 'Pantry', 'Aldi', 1.49, '2026-01-01'),
('Beef Ravioli 625g', 'Frozen', 'Aldi', 4.79, '2025-10-25'),
('Frozen Blueberries 500g', 'Frozen', 'Aldi', 3.19, '2026-01-01'),
('Protein Choc Pudding 170g', 'Pantry', 'Aldi', 2.69, '2026-01-01'),
('Harbior Roll 45g', 'Pantry', 'Aldi', 0.99, '2026-01-01'),
('Bread Multigrain 800g', 'Pantry', 'Aldi', 3.69, '2026-01-01'),
('Vitamin Wheat Bread 700g', 'Pantry', 'Aldi', 2.99, '2026-01-01'),
('Chicken Breast Stir Fry', 'Meat', 'Aldi', 7.55, '2026-01-01'),
('Biscuit Hound Thousands 200g', 'Pantry', 'Aldi', 1.55, '2026-01-01'),
('Baby Broccoli Bunch', 'Fruit & Veg', 'Aldi', 1.99, '2026-01-01'),
('Organic Crispetts 125g', 'Pantry', 'Aldi', 2.29, '2026-01-01'),
('Lean Diced Beef 500g', 'Meat', 'Aldi', 10.99, '2026-01-01'),
('Beef Burgers 500g', 'Meat', 'Aldi', 7.79, '2026-01-01'),
('WK Engrs Beef Stroganoff', 'Frozen', 'Aldi', 8.99, '2026-01-01'),
('Milk UHT Full Cream 1L', 'Dairy', 'Aldi', 1.65, '2026-01-01'),
('Soap Bar 8x100g', 'Household', 'Aldi', 3.99, '2026-01-01'),
('Potato Spudlite 1.5kg', 'Fruit & Veg', 'Aldi', 4.99, '2026-01-01'),
('Stir Fry Mix 400g', 'Frozen', 'Aldi', 2.99, '2026-01-01'),
('Banana Cavendish per kg', 'Fruit & Veg', 'Aldi', 3.37, '2026-01-01'),
('Riverina Full Cream Milk 2L', 'Dairy', 'Aldi', 4.49, '2025-10-25'),
('Weet-Bix 375g', 'Pantry', 'Aldi', 3.49, '2026-01-01'),
('Summer Mandarin 750g', 'Fruit & Veg', 'Aldi', 3.99, '2026-01-01'),
('Detail Cleaning Brush', 'Household', 'Aldi', 3.49, '2026-01-01'),
('Mango KP Each', 'Fruit & Veg', 'Aldi', 2.99, '2026-01-01'),
('Mushroom Sliced 200g', 'Fruit & Veg', 'Aldi', 3.49, '2026-01-01'),

-- =============================================
-- ALDI Receipt 2 (25 Oct 2025, Belrose)
-- =============================================
('Dog Food 400g', 'Household', 'Aldi', 1.99, '2025-10-25'),
('Organic Pasta Sauce 500g', 'Pantry', 'Aldi', 2.49, '2025-10-25'),
('Chicken Breast Diced', 'Meat', 'Aldi', 8.97, '2025-10-25'),
('Chicken Tender H&G 400g', 'Meat', 'Aldi', 6.99, '2025-10-25'),
('Cauliflower Each', 'Fruit & Veg', 'Aldi', 3.00, '2025-10-25'),
('Cucumber Lebanese per kg', 'Fruit & Veg', 'Aldi', 0.35, '2025-10-25'),
('Sweet Chilli Crisp 150g', 'Pantry', 'Aldi', 2.99, '2025-10-25'),
('Vanilla Yogurt 1kg', 'Dairy', 'Aldi', 3.79, '2025-10-25'),
('Crunchy Salad Kit 450g', 'Fruit & Veg', 'Aldi', 3.49, '2025-10-25'),
('Jam Premium Australian 300g', 'Pantry', 'Aldi', 3.99, '2025-10-25'),
('Ibuprofen 24pk', 'Household', 'Aldi', 1.39, '2025-10-25'),
('Soap Dove 3x90g', 'Household', 'Aldi', 4.39, '2025-10-25'),
('Yoghurt Greek Pot Set 2kg', 'Dairy', 'Aldi', 10.99, '2025-10-25'),
('Mouthwash 1L', 'Household', 'Aldi', 3.29, '2025-10-25'),
('White Sliced Bread 650g', 'Pantry', 'Aldi', 2.29, '2025-10-25'),
('Pesto Basil 190g', 'Pantry', 'Aldi', 1.89, '2025-10-25'),
('Turkey Mince 500g', 'Meat', 'Aldi', 5.99, '2025-10-25'),
('Cob Corn 400g', 'Frozen', 'Aldi', 3.99, '2025-10-25'),
('Roma Tomato 250g', 'Fruit & Veg', 'Aldi', 2.99, '2025-10-25'),
('Cheese Tasty 500g', 'Dairy', 'Aldi', 6.99, '2025-10-25'),
('Pork Sausages 500g', 'Meat', 'Aldi', 7.99, '2025-10-25'),
('Cooking Wine 1.5kg', 'Pantry', 'Aldi', 13.49, '2025-10-25'),
('Mandarin Gold 750g', 'Fruit & Veg', 'Aldi', 2.99, '2025-10-25'),
('Extra Gum 64g', 'Household', 'Aldi', 3.00, '2025-10-25'),
('Chicken Kebab', 'Meat', 'Aldi', 6.49, '2025-10-25'),
('Iceberg Shred 200g', 'Fruit & Veg', 'Aldi', 1.99, '2025-10-25'),
('Organic Granola 500g', 'Pantry', 'Aldi', 5.19, '2025-10-25'),
('Caterer Butter 1kg', 'Dairy', 'Aldi', 4.59, '2025-10-25'),
('Muesli Bars 185g', 'Pantry', 'Aldi', 2.49, '2025-10-25'),
('Bonsoy Milk UHT 1L', 'Drinks', 'Aldi', 4.49, '2025-10-25'),
('Honey Manuka Blend Tea & Sugar 375g', 'Pantry', 'Aldi', 3.59, '2025-10-25'),
('Nutella 400g', 'Pantry', 'Aldi', 6.69, '2025-10-25'),
('Cheese Goats Slice 150g', 'Dairy', 'Aldi', 4.79, '2025-10-25'),
('Swiss Cheese Slices 200g', 'Dairy', 'Aldi', 9.49, '2025-10-25'),
('T&G Hair Accessory', 'Household', 'Aldi', 3.99, '2025-10-25'),
('Cheese Goats Brie 150g', 'Dairy', 'Aldi', 3.99, '2025-10-25');
