fs_prompt_end = 'Please provide your response based on Previous recommendations and Examples below:'

instruction_meta_example = "The user has interacted with items [[inters_1]] in chronological order. "\
    "Here is the candidate set for the next recommendation: [[candidate_set_1]]. "\
    "Please recommend from the candidate set. List the top 10 recommendations in numbered bullet points."

instruction_meta_example_v2 = "I've purchased the following products in the past in order:\n[[inters_1]]\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n[[candidate_set_1]]\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."


inters_1 = "['Yamaha NTX700 Acoustic Electric Classical Guitar.', 'Behringer UC200 Ultimate Stereo Chorus Instrument Effects Pedal.', 'Behringer Ultra-DI DI20 Professional Active 2-Channel DI-Box/Splitter.', \"D'Addario NYXL1046 Nickel Plated Electric Guitar Strings, Light.\", 'BEHRINGER REVERB MACHINE RV600.', 'BEHRINGER TU300.', 'Behringer VD400 Vintage Analog Delay Effects Pedal.', 'Electro-Harmonix 720 Stereo Looper Pedal.', 'BEHRINGER DIGITAL DELAY DD600.']"
instruction_example1 = f"Below is the instruction for the actor's previous recommendation. The user has interacted with items {inters_1} in chronological order. Please predict the next item that the user would interact with."
response__example1 = "DR Strings Zebra - Acoustic-Electric Round Core 11-50."
last_act_his_str_example1 = "['Behringer TM300 Ultimate Tube Amp Modeling Instrument Effects Pedal.', 'Behringer Compressor/Sustainer CS400 Ultimate Dynamics Effects Pedal.', 'JOYO JF-37 Bundle Acoustic Guitar Knob.', 'Behringer DC9 Dynamics Compressor Pedal.', 'BEHRINGER REVERB MACHINE RV600.', 'Behringer Noise Reducer NR300 Ulitmate Noise Reduction Instrument Effects Pedal.', 'Behringer TO800 Vintage Tube-Sound Overdrive Instrument Effects Pedal.', 'Behringer Ultra Metal UM300 Heavy Metal Distortion Instrument Effect Pedal.', 'Behringer Super Fuzz SF300 3-Mode Fuzz Distortion Instrument Effects Pedal.', 'Behringer EQ700 Ultimate 7-Band Graphic Equalizer.', 'Behringer Ultra Vibrato UV300 Classic Vibrato Instrument Effects Pedal.', 'DAddario Accessories Pro-Winder Guitar String Winder and Cutter  All-In-1 Restringing Tool  Includes Clippers, Bridge Pin Puller, Peg Winder  Designed to Fit Most Guitars.', 'Behringer Vintage Phaser VP1 Authentic Vintage-Style Phase Shifter Instrument Effects Pedal.', 'BEHRINGER TU300.', 'Behringer Hellbabe HB01 Ultimate Wah-Wah Pedal with Optical Control.', 'Behringer PH9 Classic 90 Phase Shifter.', 'BBE Sonic Stomp Sonic Maximizer Stomp Box Pedal for Guitars, Basses and Keyboards.', 'Donner Blues Drive Classical Electronic Vintage Overdrive Guitar Effect Pedal True Bypass Warm/Hot Modes.', 'Behringer UC200 Ultimate Stereo Chorus Instrument Effects Pedal.', 'Elixir Strings 80/20 Bronze Acoustic Guitar Strings w POLYWEB Coating, Light/Medium (.012-.056).']"
fs_example1 = "PREFERENCE: Based on the user's preference for guitar accessories and effects pedals, the identified category of music-related items can contribute to better reflection by focusing on similar products that match the user's interests in music equipment. The categories of items in the user's interaction history and previous recommendations mainly consist of guitar accessories and effects pedals, which are music-related items that suggest the user is interested in music equipment.\n" \
            "ANALYSIS: The previous predictions failed to meet the user's demands because they were too focused on Behringer brand products and did not consider a wider range of possible items the user may be interested in.\n" \
            "SUGGESTIONS: In the future, try to diversify recommendations by considering a broader range of brands and types of items that the user may like based on their historical interactions.\n"

inters_2 = "['Dunlop Acoustic Guitar Frets (37083022001).', 'ChromaCast CC-MINIGS Universal Folding Guitar Stand with Secure Lock.', 'GO-DPS ChromaCast Electric Guitar 6-Pocket Padded Gig Bag with Guitar Strap and Pick Sampler.', 'DAddario Accessories Pro-Winder Guitar String Winder and Cutter  All-In-1 Restringing Tool  Includes Clippers, Bridge Pin Puller, Peg Winder  Designed to Fit Most Guitars.', 'Snark SN2 Guitar Tuner.']"
instruction_example2 = f"Below is the instruction for the actor's previous recommendation. The user has interacted with items {inters_2} in chronological order. Please predict the next item that the user would interact with."
response__example2 = "Hosa GPR-101 PAK10 RCA to 1/4 TS Adaptors, Pack of 10."
last_act_his_str_example2 = "['Dunlop Series 5005 Pickholder, 1 Pack.', \"D'Addario EJ17-B25 Phosphor Bronze Acoustic Guitar Strings, Medium, 13-56, 25 Bulk Sets.\", \"D'Addario Assorted Pearl Celluloid Guitar Picks, 10 Pack, Medium.\", \"D'Addario EJ26 Phosphor Bronze Acoustic Guitar Strings, Custom Light, 11-52.\", 'Snark SN1 Guitar Tuner (Blue).', 'Fender Performance Series Microphone Cable for pro audio, and live sound.', 'Elixir Strings 80/20 Bronze Acoustic Guitar Strings w POLYWEB Coating, Extra Light (.010-.047).', 'Elixir Strings 80/20 Bronze Acoustic Guitar Strings w POLYWEB Coating, Light/Medium (.012-.056).', 'Fender 250L Nickel Plated Steel Electric Guitar Strings - Light.', 'Simtyso\u00ae Predmium Folk Acoustic Electric Guitar Banjo Trigger Capo Key Clamp.', 'DAddario Accessories Pro-Winder Guitar String Winder and Cutter  All-In-1 Restringing Tool  Includes Clippers, Bridge Pin Puller, Peg Winder  Designed to Fit Most Guitars.', 'Dunlop 5006SI Ergo Pickholder.', 'Ernie Ball Earthwood Light Phosphor Bronze Acoustic String Set, .011 - .052.', 'Dunlop Tortex Standard .50mm Red Guitar Pick - 12 Pack.', 'Hosa GTR-205 Straight to Straight Guitar Cable, 5 Feet.', 'On-Stage XCG4 Black Tripod Guitar Stand, Single.', 'Fender Clip-On Tuner FT-004 for Guitar, Ukulele, Bass, Violin, Mandolin, and Banjo.', 'Dunlop 471P3C Max Grip Jazz III Carbon Fiber Guitar Picks, 6-Pack.', \"Dunlop 44P.60 Nylon Standard, Light Gray, .60mm, 12/Player's Pack.\", 'Kyser Quick-Change Capo for 6-string acoustic guitars - Black.']"
fs_example2 = "PREFERENCE: The user may have a preference for audio equipment along with guitar gear, so exploring categories related to audio equipment in addition to guitar accessories could lead to better predictions.\n" \
            "ANALYSIS: The categories of items from previous user interactions mainly revolved around guitar accessories and gear, while the target item was an audio adaptor, showing a possible association with audio equipment. The previous recommendations failed because they were focused on guitar accessories and related items, while the user's next interaction was actually an RCA to 1/4 TS adaptor, which is more related to audio equipment than guitar gear.\n" \
            "SUGGESTIONS: Consider broadening the scope of recommendations to include a wider range of audio equipment and accessories, not just limited to guitar-related items.\n"

# instruction_example3 = 'The user has interacted in chronological order with items: ["Lily Sugar \'N Cream  Super Size Solid Yarn - (4) Medium Gauge 100% Cotton - 4 oz -  Hot Green  -  Machine Wash &amp; Dry", \'Stanwood Needlecraft YBW-B Hand-Operated Yarn Ball Winder, 4-Ounce\', "Lily Sugar \'N Cream  The Original Solid Yarn - (4) Medium Gauge 100% Cotton - 2.5 oz -  Sage Green  -  Machine Wash &amp; Dry", "Lily Sugar\'n Cream Cotton Cone Yarn, 14 oz, Potpourri Prints, 1 Cone", "Lily 10200101628 Sugar \'N Cream  The Original Solid Yarn - (4) Medium Gauge 100% Cotton - 2.5 oz -  Hot Orange  -  Machine Wash &amp; Dry", "Lily Sugar \'N Cream  The Original Solid Yarn - (4) Medium Gauge 100% Cotton - 2.5 oz - Purple -  Machine Wash &amp; Dry", "Lily 10200101628 Sugar \'N Cream  The Original Solid Yarn - (4) Medium Gauge 100% Cotton - 2.5 oz -  Hot Orange  -  Machine Wash &amp; Dry"]. Here is the candidate set for the next recommendation: [\'Conchos Mixed Finishes Western 1&quot; Round Slotted; 25 Pieces\', \'3L Scrapbook Adhesives E-Z Runner Fine Permanent Adhesive Dispenser, 49 Feet\', \'Tandy Leather Wool Daubers Regular 1&quot; (2.5 cm) 10/pk 3445-00\', \'20 Spools (10 Black &amp; 10 White) Sewing, Quilting, Serger Polyester Thread 40S/3\', \'BUTTERICK PATTERNS B5006 Sewing and Knitting Tote and Accessories, One Size Only\', \'item4ever Spiral Metal Boning - 10 Yards, 3/16&quot; + 12 Tips\', "Lily Sugar \'N Cream  Super Size Solid Yarn - (4) Medium Gauge 100% Cotton - 4 oz -  Hot Green  -  Machine Wash &amp; Dry", \'Grabbit Magnetic Pin Cushion\', \'Czech Seed Beads 6/0 Mix Turquoise Fetish Blue Green (1 Ounce)\', \'4pc Heavy-Duty Giant Steel Safety Pins - Choose 2-1/2&quot;, 3&quot;, 4&quot; or 5&quot; - Kilts, Skirts\', \'Jerry Q Art &quot;Grace Art&quot; 18 Piece Artist Sketch &amp; Drawing Set- 8 Graphite, 3 Charcoal Pencils, 1 Sketch, 2 Charcoal Sticks, 1Pencil, 1 Charcoal Sharpener, 1 Kneaded, 1 White Plastic Eraser JQ3018\', \'Janome Memory Craft Foot Control w/Retractable Cord\', \'Adorox Black Velvet Necklace Pendant Chain Jewelry Bust Display Holder Stand (1, Black)\', \'Simplicity-Twill Tape 1&quot;X10yd, White\', "SARAL PAPER SARAL White 12&quot; X12\' Wht Transfer Paper", "Cedar Canyon Textiles Text CCT4004 Plastic Artist\'s Paintstiks Rubbing Plate, Garden Flower, 6-Pack", \'Sakura Quickie Glue Roller Pens, Removable/Permanent, 2-Pack\', \'Daveliou Acrylic Paints Set &ndash; 12ml x 24 Acrylics Paint Tubes &ndash; Non-Toxic Acrylic Painting Set Beginners, Students &amp; Artists\', \'Vilene Water Soluble Embroidery Stabilizer &amp; Backing - Wash Away - For Free Standing Lace 12&quot;x10yd Roll\', \'Reeves Drawing &amp; Sketching Complete Set\', \'Darice 4323 1000-Piece Round Pearl Bead, 5mm, White\', \'Souarts Antique Silver Color Heart Shape Claw Lobster Clasps Jewelry Finding 25x12mm Pack of 20pcs\', \'Clover 3142 Yarn Threader\', \'Hampton Art General 4503020000 Grabber AT2 Radial Tire - 315/70R17 121R\', \'Dritz 223 5/8-Inch by 13-Yard Stitch Witchery, Super\', \'Sculpey Clay Conditioning Machine\', "GEM-inside Indian Agate Gemstone Loose Beads Natural Round 12mm Crystal Energy Stone Power For Jewelry Making 15\'\'", \'Stampers Anonymous Tim Holtz Cling Rubber Stamp Set, 7&quot; by 8.5&quot;, Tree Line\', \'Lawn Fawn Lawn Cuts Custom Craft Die - Scalloped Rectangle Stackables (LF997)\', \'Royal &amp; Langnickel Aqualon Watercolor Painting Box Set\', \'Round Glass Mirrors, Assorted Sizes, 25/Pack\', \'144 Black Prewound Bobbins for Brother Embroidery Machine Size A (156)\', \'95 Oval X2 Power Rings 50% Stronger Than Round Split Rings Zinc Plated Connectors for Key Rings, Lures Fishing Tackle (5.5mmx11mm 0.217x0.433 In)\', \'Sizzix Rub Ons - Dress Ups Faces by Stu Kilgour\', \'Martha Stewart Crafts Pattern Punch All Over The Page Magnetic Punch Heartbeat (42-91009)\', \'Sowder Ostrich Feathers Trims Fringe Satin Ribbon Tape Dress Sewing Crafts Costumes Decoration Pack of 2 Yards(Royal Blue)\', \'Moda Bella Solids Silver 9900-183 Charm Pack, 42 5-inch Cotton Fabric Squares\', \'eCrafty 100-Piece Message Words Inspirational Pewter Charms Pendants Mega Mix DIY Jewelry Making, Silver\', \'PEPPERLONELY Brand Wood Knitting Loom with Yarns and Shuttles\', \'Momenta Stamp &amp; Die Set-Mason Jars\', \'Flexible Mirror Sheets 6&quot; X 9&quot; Soft Non Glass Cut to Size Craft Plastic 3 Sheets &quot;PEEL OFF PROTECTIVE COVER SHEET&quot; Peel Back Sticker And Stick No Glue\', \'Sakura ESP36 36-Piece Cray-Pas Specialist Assorted Colors Oil Pastel Set\', \'ImpressArt SCDESIGN-1518D Cross Outline Design Stamps, 6 mm\', \'BRCbeads Gorgeous Faceted Mookaite Jasper Gemstone Round Loose Beads 12mm Approxi 15.5 inch 30pcs 1 Strand per Bag for Jewelry Making\', \'Premier Yarns Cotton Fair Solid Yarn-Cream\', \'Black Tear Away - Machine Embroidery Stabilizer Backing Medium Weight 1.8oz. Roll of 12 in X 10 Yds\', \'Prima Marketing Julie Nutting Mixed Media Cling Rubber Stamps, Candie\', \'Stampers Anonymous Tim Holtz Layered Bricked Stencil, 4.125 x 8.5\', \'SINGER Quarter Inch &Acirc;&frac14; Inch Piecing Snap-On Presser Foot for Low-Shank Sewing Machines\', \'LorAnn Oils Ultimate Candy Kit\']. Please recommend from the candidate set. List the top 10 recommendations in numbered bullet points. Don\'t output any other content.'
# response__example3 = "Lily Sugar 'N Cream  Super Size Solid Yarn - (4) Medium Gauge 100% Cotton - 4 oz -  Hot Green  -  Machine Wash &amp; Dry"
# last_act_his_str_example3 = '[\'1. Sakura ESP36 36-Piece Cray-Pas Specialist Assorted Colors Oil Pastel Set\', \'2. Jerry Q Art "Grace Art" 18 Piece Artist Sketch & Drawing Set- 8 Graphite, 3 Charcoal Pencils, 1 Sketch, 2 Charcoal Sticks, 1Pencil, 1 Charcoal Sharpener, 1 Kneaded, 1 White Plastic Eraser JQ3018\', \'3. Reeves Drawing & Sketching Complete Set\', \'4. Daveliou Acrylic Paints Set – 12ml x 24 Acrylics Paint Tubes – Non-Toxic Acrylic Painting Set Beginners, Students & Artists\', \'5. Royal & Langnickel Aqualon Watercolor Painting Box Set\', \'6. Stampers Anonymous Tim Holtz Cling Rubber Stamp Set, 7” by 8.5”, Tree Line\', \'7. Momenta Stamp & Die Set-Mason Jars\', \'8. Sakura Quickie Glue Roller Pens, Removable/Permanent, 2-Pack\', \'9. Impression Obsession Clear Stamps, 4.25 x 6.5, Floral Wreath\', \'10. Prima Marketing Julie Nutting Mixed Media Cling Rubber Stamps, Candie\']'
# fs_example3 = "PREFERENCE: The user's preference for yarn and related products suggests a focus on crafting and art supplies, which can guide the recommendations towards similar products.\n\nANALYSIS: The previous recommendations failed to meet the user's demands because they were too diverse and did not consider the user's interest in yarn and crafting supplies. The actor's recommendations included a mix of art supplies, jewelry making materials, and other unrelated products, which did not align with the user's preferences.\n\nSUGGESTIONS: To improve the recommendations, focus on products related to yarn, crafting, and art supplies, such as yarns, threads, needles, hooks, and other crafting tools. Consider recommending products from the same brand or category as the user's previous interactions, such as Lily Sugar 'N Cream yarns."

# instruction_example4 = 'The user has interacted in chronological order with items: [\'Tulip Glitter Spray Paint- Glistening Gold\', \'RED Poly Rayon Sapndex Jersey Knit Fabric By the Yard By Fabricgenie\', \'Mountain Mist Fiberloft Polyester Stuffing, 3 Pounds (303MM)\', \'Tulip 26568 Fabric Spray Paint- Asphalt\', \'Tulip 20406 Soft Fabric Paint 4oz Matte Sunshine Yellow\', \'Mountain Mist Fiberloft Polyester Stuffing, 3 Pounds (303MM)\']. Here is the candidate set for the next recommendation: [\'Darice Carryi Round Knitting, Set of 4 with 11, 9, 7-inch and 5-1/2 inch Sizes &ndash; Includes 1 Yarn Needle, 1 Loom Pick and a Clear Plastic Carrying Case (1171-58), 4 Piece, Multi Colored\', \'Wonder Clips, Sewing and Beading, Paper Clips, Binder Clips, Multi-purpose Clips, Clips for Sewing, Quilting, Beading, Crocheting, Knitting &amp; General Purpose, 50 Pack, Red\', \'Martha Stewart Crafts Glitter Marker Set, 6-Pack\', \'50 Yards - 2mm Old Gold Satin Rattail Cord Chinese/china Knot Rat Tail Jewelry Braid 100% Polyester\', \'Ranger INK36104 Inkssentials Craft Spinner Extension Kit\', \'QoR Watercolor Introductory 6-High Chroma Set\', \'Spring Tension Hoops - Assorted, 7 inches\', \'Coats Cotton Machine Gumballs Quilting Thread, 225 yd, Multicolor\', \'Beading Station 50-Piece Mix 2-tone Crackle Lampwork Glass Round Beads\', \'OxGord Sewing Machine Professional Handheld - Quick Stitch Tool for Fabric, Clothing, or Kids Cloth - Great for Traveling or use in Home - Includes Threads Needles Accessories - Cordless\', "AMRAM Quilting Quilter\'s Quilt Basting Gun Kit. Includes 3,000 Pcs 3/8&quot; FINE Tacks (Red) and 5 FINE Needles.", \'Copic Marker 72-Piece Sketch Set, E (S72-E)\', "Angel Crafts 12&quot; by 8\' PREMIUM Transfer Paper Tape Roll with Grid - PERFECT ALIGNMENT for Cricut or Silhouette Cameo Self Adhesive Vinyl for Walls, Signs, Decals, Windows, and More", \'Penny Black 40-184 Cling Rubber Stamp, Her Heart\', \'Crayola Glitter Glue, 9-Count\', \'Sizzix Bigz Die Box, Square Favor by Lori Whitlock\', \'MyGift Designers Black Metal Adjustable Height Wire Frame Dress Form Display Stand\', \'X-Haibei Love Heart Peace Sign Soap Mini Cake Jello Supplies Silicone Mold 6-Cavity\', \'Pro Art PRO-MAR100 Bullet Point Marker Set\', \'60 5&quot; Luscious Freckles Tonals Charm Pack\', \'1 X Polyester Cotton Broadcloth YELLOW Fabric By the Yard\', \'Armour Etch Over N Over Stencil Berry Floral\', \'Candora Sewing Thread Assortment Coil 30 Color 250 Yards Each Polyester Thread Sewing Kit All Purpose Polyester Thread for Hand and Machine Sewing\', \'KONMAY 1 Roll 25 Yards 2.0mm Black Color Soft Round Real Jewelry Leather Cord\', \'Therm O Web PeelnStick Fabric Fuse Tape 5/8 Inch x 20 Feet (3346)\', \'PETALOO Floral Embellishments Velvet Hydrangeas With Glitter 36/Pkg-Red\', \'Dritz 55140-66 Iron-On Mending Tapes, Assorted, 1-1/4 by 13-Inch\', \'Spellbinders EG-003 M-Bossabilities A-4 Garden Lattice Die Templates\', \'6-pc 3&quot;measure Clip Hemmer No Pin Hem Clip w/Marking Ruler Guides Inch and Cm\', \'Little B 100407 Perfect Positioner, 6-Inch by 12-Inch\', \'Wash-Away - Water Soluble Machine Embroidery Stabilizer &amp; Topping! 10&quot; X 110yd Roll\', \'Artistic Wire Beadalon Connector 3D Knot Nickel Free Silver Plated, 10-Piece\', \'Smart Color Art 160 Colors Gel Pens Set 80 Gel Pen with 80 Refills for Adult Coloring Books Drawing Painting Writing Doodling\', \'Books by Hand pH Neutral PVA Adhesive, 8oz (BBHM217)\', \'Chalk Markers for Chalkboard (Reversible Tip) - Erasable Dustless Water-Based Non-Toxic Liquid Wet Erase Pens\', \'Darice Paper Edging Scissors, 4-Pack\', \'54&quot; Wide Faux Leather Vinyl White Fabric By The yard\', \'Beadaholique Wire Twisting Pliers For Wire Wrapping And Metal Work 10.5 Inch\', \'Deep Red Stamps Steampunk Lady Rubber Stamp\', \'Rockin Beads Brand, 1000 Mixed Acrylic Star Spacer Beads 9mm Round Sold Per Pack of 1000\', \'Fireline Braided Beading Thread .006 Inch - Smoke Gray- 50 Yd\', \'DIY Print Shop Classic Table Top Screen Printing Kit\', \'Logan Graphic Products Inc. 450-1 Artist Elite Mat Cutter for Framing, Art, and Design or Creative Signage Projects-best for At-Home Framers\', \'K&amp;Company Elizabeth Brownd Visions of Christmas Die-cut Cardstock and Acetate\', \'School Smart Plastic Dough Tools - Set of 5 - Assorted Colors\', \'Wirezoll Martha Stewart Crafts Multi-Surface Satin Acrylic Craft Paint Set (2-Ounce), PROMO767B Bright (18-Pack)\', \'ArtBin 1118AB 18-Compartment Prism Box, Transparent Clear\', \'DichroMagic Dichroic Wissmach Texture Scrap on Black - 90 Coe, 1/4 lb\', \'Cuttlebug A2 Embossing Folder/Border Set-Anna Griffin Juliet Damask\', \'Ackfeld Spool Rack, Sewing Machine\']. Please recommend from the candidate set. List the top 10 recommendations in numbered bullet points. Don\'t output any other content.'
# response__example4 = '1 X Polyester Cotton Broadcloth YELLOW Fabric By the Yard'
# last_act_his_str_example4 = "['1. Darice Carryi Round Knitting, Set of 4 with 11, 9, 7-inch and 5-1/2 inch Sizes &ndash; Includes 1 Yarn Needle, 1 Loom Pick and a Clear Plastic Carrying Case (1171-58), 4 Piece, Multi Colored', '2. Wonder Clips, Sewing and Beading, Paper Clips, Binder Clips, Multi-purpose Clips, Clips for Sewing, Quilting, Beading, Crocheting, Knitting &amp; General Purpose, 50 Pack, Red', '3. Martha Stewart Crafts Glitter Marker Set, 6-Pack', '4. 50 Yards - 2mm Old Gold Satin Rattail Cord Chinese/china Knot Rat Tail Jewelry Braid 100% Polyester', '5. Ranger INK36104 Inkssentials Craft Spinner Extension Kit', '6. QoR Watercolor Introductory 6-High Chroma Set', '7. Spring Tension Hoops - Assorted, 7 inches', '8. Coats Cotton Machine Gumballs Quilting Thread, 225 yd, Multicolor', '9. Beading Station 50-Piece Mix 2-tone Crackle Lampwork Glass Round Beads', '10. OxGord Sewing Machine Professional Handheld - Quick Stitch Tool for Fabric, Clothing, or Kids Cloth - Great for Traveling or use in Home - Includes Threads Needles Accessories - Cordless']"
# fs_example4 = "## PREFERENCE: \nThe user's preference seems to be focused on fabric-related items, with a mix of crafting supplies and materials. The interaction history suggests a strong interest in fabric, yarn, and other materials for crafting and sewing.\n\n## ANALYSIS: \nThe previous recommendations failed to meet the user's demands because they were too broad and did not consider the user's specific interests in fabric and crafting supplies. The actor's recommendations were too focused on general crafting supplies and did not take into account the user's specific preferences.\n\n## SUGGESTIONS: \nIn the future, try to prioritize recommendations that are more specific to fabric and crafting supplies, and consider the user's interaction history and preferences when making recommendations."

instruction_example3 = '[[previous_instruction 1]]'
response__example3 = '[[target_item 1]]' 
last_act_his_str_example3 = '[[last_act_his 1]]'
fs_example3 = '[[fs 1]]' 

instruction_example4 = '[[previous_instruction 2]]'
response__example4 = '[[target_item 2]]' 
last_act_his_str_example4 = '[[last_act_his 2]]'
fs_example4 = '[[fs 2]]' 

EP_fs_prompt = "You are an expert of giving reflections to the sequential recommender actor. " \
"The actor is a sequential recommender. It receives instructions and generates item recommendations based on user's historical interactions. " \
"As an expert, you should provide reflections on the actor's previous recommendations to help improve actor's next recommendations for this user." \
\
"\nYou need to take it step by step. "\
"Step 1: Output 1 or 2 sentences starting with 'PREFERENCE:'. By analyzing the user's interaction history based on text information such as item titles and categories with your knowledge "\
"(paying more attention to later items in the history), you can predict the user preferences (e.g., trends, anomalies, interest)."\
"Step 2. Output 1 or 2 sentences starting with 'ANALYSIS:'. Then analyze the problems with the 10 items recommended by the actor based on user history and preferences."\
"Step 3. Output 1 or 2 sentences starting with 'SUGGESTIONS:'. Finally provide suggestions for the actor to make next recommendations for this user (e.g. prioritize [specific aspect or feature])."\
\
"Here are some Examples:\n" \
"\n ## Previous instruction: \n" + instruction_example3 + "\n" \
"\n ## Standard answer: \n" + response__example3 + "\n" \
"\n ## Actor's recommendations: " + last_act_his_str_example3 + "\n" \
"\n ## "+ fs_prompt_end + " " + fs_example3 + "\n" \
\
"\n ## Previous instruction: \n" + instruction_example4 + "\n" \
"\n ## Standard answer: \n" + response__example4 + "\n" \
"\n ## Actor's recommendations: " + last_act_his_str_example4 + "\n" \
"\n ## "+ fs_prompt_end + " " + fs_example4 + "\n" \
\
"Here are the actor's recommendations you need to reflect on now (Don't output any specific titles of items):\n" \
\
"\n ## Previous instruction: \n{instruction}" \
"\n ## Standard answer: \n{response}" \
"\n ## Actor's recommendations: {last_act_his_str}" \
"\n ## "+ fs_prompt_end


# item_IP_example1 = "['Guitar', 'Music', 'Accessories', 'Effects Pedal', 'Instrument', 'Strings', 'Electric Guitar', 'Acoustic Guitar', 'Chorus', 'Delay', 'Looper', 'Reverb', 'Machine', 'Vintage', 'Analog', 'Stereo', 'Professional', 'Active', 'DI-Box', 'Splitter']"
item_IP_example1 = "[[item_IP_list 1]]"
# item_IP_example2 = "['Guitar', 'Music', 'Accessories', 'Stand', 'Gig Bag', 'Strap', 'Pick Sampler', 'Frets', 'Jersey Knit Fabric', 'Polyester Stuffing', 'Fabric Spray Paint', 'Soft Fabric Paint', 'Glitter Spray Paint', 'Machine Wash', 'Dry', 'Asphalt', 'Sunshine Yellow', 'Mountain Mist', 'Fiberloft', 'Polyester', 'Stuffing']"
item_IP_example2 = "[[item_IP_list 2]]"

IP_fs_prompt = "You are an expert of giving reflections based on recommended items' attributes to the sequential recommender actor. " \
"The actor is a sequential recommender. It receives instructions and generates item recommendations based on user's historical interactions. " \
"As an expert, you should provide reflections based on the actor's previous recommendations, especially items' attributes to help improve actor's next recommendations for this user." \
\
"\nYou need to take it step by step. "\
"Step 1: Output 1 or 2 sentences starting with 'PREFERENCE:'. By analyzing the user's interaction history based on both text information such as items' titles and items' attributes with your knowledge "\
"(paying more attention to LATER items' attributes in the history), you can predict the user preferences (e.g., trends, anomalies, interest)."\
"Step 2. Output 1 or 2 sentences starting with 'ANALYSIS:'. Then analyze the problems with the 10 items recommended by the actor based on user history and preferences."\
"Step 3. Output 1 or 2 sentences starting with 'SUGGESTIONS:'. Finally provide suggestions for the actor to make next recommendations for this user (e.g. prioritize [specific aspect, feature or attribute])."\
\
"Here are some Examples:\n" \
"\n ## Previous instruction and items' attributes: \n" + item_IP_example1 + "\n" \
"\n ## Standard answer: \n" + response__example3 + "\n" \
"\n ## Actor's recommendations: " + last_act_his_str_example3 + "\n" \
"\n ## "+ fs_prompt_end + " " + fs_example3 + "\n" \
\
"\n ## Previous instruction and items' attributes: \n" + item_IP_example2 + "\n" \
"\n ## Standard answer: \n" + response__example4 + "\n" \
"\n ## Actor's recommendations: " + last_act_his_str_example4 + "\n" \
"\n ## "+ fs_prompt_end + " " + fs_example4 + "\n" \
\
"Here are the actor's recommendations you need to reflect on now (Don't output any specific titles of items):\n" \
\
"\n ## Previous instruction and items' attributes: \n{instruction}" \
"\n ## Standard answer: \n{response}" \
"\n ## Actor's recommendations: {last_act_his_str}" \
"\n ## "+ fs_prompt_end

IP_fs_prompt_wo_example = "You are an expert of giving reflections based on recommended items' attributes to the sequential recommender actor. " \
"The actor is a sequential recommender. It receives instructions and generates item recommendations based on user's historical interactions. " \
"As an expert, you should provide reflections based on the actor's previous recommendations, especially items' attributes to help improve actor's next recommendations for this user." \
\
"\nYou need to take it step by step. "\
"Step 1: Output 1 or 2 sentences starting with 'PREFERENCE:'. By analyzing the user's interaction history based on both text information such as items' titles and items' attributes with your knowledge "\
"(paying more attention to LATER items' attributes in the history), you can predict the user preferences (e.g., trends, anomalies, interest)."\
"Step 2. Output 1 or 2 sentences starting with 'ANALYSIS:'. Then analyze the problems with the 10 items recommended by the actor based on user history and preferences."\
"Step 3. Output 1 or 2 sentences starting with 'SUGGESTIONS:'. Finally provide suggestions for the actor to make next recommendations for this user (e.g. prioritize [specific aspect, feature or attribute])."\
\
"Here are the actor's recommendations you need to reflect on now (Don't output any specific titles of items):\n" \
\
"\n ## Previous instruction and items' attributes (item titles, categories and brands): \n{instruction}" \
"\n ## Standard answer: \n{response}" \
"\n ## Actor's recommendations: {last_act_his_str}" \
"\n ## "+ fs_prompt_end

item_CF_scores_example1 = "[[item_CF_scores_list 1]]"
item_CF_scores_example2 = "[[item_CF_scores_list 2]]"

CF_fs_prompt = "You are an expert of giving reflections based on user & item's collaborative filtering scores to the sequential recommender actor. " \
"The actor is a sequential recommender. It receives instructions and generates item recommendations based on user's historical interactions. Then, a collaborative filtering model will provide scores based on current user and generated items." \
"As an expert, you should provide reflections on the actor's previous recommendations, especially user-item collaborative filtering scores to help improve actor's next recommendations for this user." \
\
"\nYou need to take it step by step. "\
"Step 1: Output 1 or 2 sentences starting with 'PREFERENCE:'. By analyzing the user's interaction history based on both text information such as item titles and categories, and historical items' collaborative filtering scores with your knowledge "\
"(paying more attention to items with HIGHER collaborative filtering scores in the history), you can predict the user preferences (e.g., trends, anomalies, interest)."\
"Step 2. Output 1 or 2 sentences starting with 'ANALYSIS:'. Then analyze the problems with the 10 items recommended by the actor based on user history and preferences."\
"Step 3. Output 1 or 2 sentences starting with 'SUGGESTIONS:'. Finally provide suggestions for the actor to make next recommendations for this user (e.g. prioritize [specific aspect or feature])."\
\
"Here are some Examples:\n" \
"\n ## Previous instruction and items' collaborative filtering scores: \n" + item_CF_scores_example1 + "\n" \
"\n ## Standard answer: \n" + response__example3 + "\n" \
"\n ## Actor's recommendations: " + last_act_his_str_example3 + "\n" \
"\n ## "+ fs_prompt_end + " " + fs_example3 + "\n" \
\
"\n ## Previous instruction and items' collaborative filtering scores: \n" + item_CF_scores_example1 + "\n" \
"\n ## Standard answer: \n" + response__example4 + "\n" \
"\n ## Actor's recommendations: " + last_act_his_str_example4 + "\n" \
"\n ## "+ fs_prompt_end + " " + fs_example4 + "\n" \
\
"Here are the actor's recommendations you need to reflect on now (Don't output any specific titles of items):\n" \
\
"\n ## Previous instruction and items' collaborative filtering scores: \n{instruction}" \
"\n ## Standard answer: \n{response}" \
"\n ## Actor's recommendations: {last_act_his_str}" \
"\n ## "+ fs_prompt_end

CF_fs_prompt_wo_example = "You are an expert of giving reflections based on user & item's collaborative filtering scores to the sequential recommender actor. " \
"The actor is a sequential recommender. It receives instructions and generates item recommendations based on user's historical interactions. Then, a collaborative filtering model will provide scores based on current user and generated items." \
"As an expert, you should provide reflections on the actor's previous recommendations, especially user-item collaborative filtering scores to help improve actor's next recommendations for this user." \
\
"\nYou need to take it step by step. "\
"Step 1: Output 1 or 2 sentences starting with 'PREFERENCE:'. By analyzing the user's interaction history based on both text information such as item titles and categories, and historical items' collaborative filtering scores with your knowledge "\
"(paying more attention to items with HIGHER collaborative filtering scores in the history), you can predict the user preferences (e.g., trends, anomalies, interest)."\
"Step 2. Output 1 or 2 sentences starting with 'ANALYSIS:'. Then analyze the problems with the 0 items recommended by the actor based on user history and preferences."\
"Step 3. Output 1 or 2 sentences starting with 'SUGGESTIONS:'. Finally provide suggestions for the actor to make next recommendations for this user (e.g. prioritize [specific aspect or feature])."\
\
"Here are the actor's recommendations you need to reflect on now (Don't output any specific titles of items):\n" \
\
"\n ## Previous instruction and items' collaborative filtering scores (item titles & CF scores): \n{instruction}" \
"\n ## Standard answer: \n{response}" \
"\n ## Actor's recommendations: {last_act_his_str}" \
"\n ## "+ fs_prompt_end


rec_prompt = \
    "The user has interacted in chronological order with items: {inters}. " \
    "Here is the candidate set for the next recommendation: {candidate_set}. " \
    "Please recommend from the candidate set. List the top 10 recommendations in numbered bullet points. " \
    "Don't output any other content."
    
rec_w_reflect_prompt = \
    "The user has interacted in chronological order with items: {inters}. \n" \
    "Here is the candidate set for the next recommendation: {candidate_set}. \n" \
    "Hint: {reflect}.\n" \
    "Please recommend from the candidate set, and you can use the previous hint to assist recommendation. "\
    "List the top 10 recommendations in numbered bullet points. " \
    "Don't output any other content."
    
rec_prompt_v2 = "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."

rec_w_reflect_prompt_v2 = "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "And after last previous recommendation for me (maybe a failed trial), you give the following reflects:\n{reflect}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list." 
    
rec_w_reflect_prompt_v3 = \
    "I've purchased the following products in the past in order:\n{inters}\n\n" \
    "And after last previous recommendation (maybe a failed trial), you give the following reflects:\n{reflect}\n" \
    "Now there are [[candidate_set_size]] candidate products that I can consider to purchase next:\n{candidate_set}\n" \
    "Please rank these [[candidate_set_size]] products by measuring the possibilities that I would like to purchase next most, according to the given purchasing records and reflects. Please think step by step.\n" \
    "Please show me your ranking results with order numbers. Split your output with line break. You MUST rank the given candidates. You can not generate candidates that are not in the given candidate list."

fs_prompts = {'EP': EP_fs_prompt, 'IP' : IP_fs_prompt, 'CF' : CF_fs_prompt}

rec_prompts = {1: rec_prompt, 2: rec_prompt_v2}
rec_w_reflect_prompts = {1: rec_w_reflect_prompt, 2: rec_w_reflect_prompt_v2, 3: rec_w_reflect_prompt_v3}

