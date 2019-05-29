## WIPE DB

puts "Wiping DB clean..."

Product.delete_all
User.delete_all
Review.delete_all

# CREATE USERS

puts "Creating fake Joao..."

joao = User.new(
  email: "joao@fetch.com",
  password: "123456",
  first_name: "Joao",
  last_name: "Lobo",
  user_type: "creator",
  photo: Pathname.new("./app/assets/images/seed-user/joao.jpg").open,
)
joao.save!

puts "Creating fake Max S..."

max_s = User.new(
  email: "max.s@fetch.com",
  password: "123456",
  first_name: "Max",
  last_name: "Salemans",
  user_type: "shopper",
  photo: Pathname.new("./app/assets/images/seed-user/max-s.jpg").open,
)
max_s.save!

puts "Creating fake Max T..."

max_t = User.new(
  email: "max.t@fetch.com",
  password: "123456",
  first_name: "Max",
  last_name: "Teunissen",
  user_type: "shopper",
  #photo: Pathname.new("./app/assets/images/seed-user/max-t.jpg").open
)
max_t.save!

puts "Creating fake Tristan..."

tristan = User.new(
  email: "tristan@fetch.com",
  password: "123456",
  first_name: "Tristan",
  last_name: "Viney",
  user_type: "creator",
  photo: Pathname.new("./app/assets/images/seed-user/tristan.jpg").open,

)
tristan.save!

# CREATE PRODUCTS

puts "Creating Tristan's gear"

bag = Product.new(
  referal_link: "http://amzn.to/2m8jnaT",
  title: "Lowepro ProTactic 450 AW Camera Backpack - Professional Protection for Your Camera Gear or DJI Mavic Pro/Mavic Pro Platinum",
  price: 199,
  description: 'Fits 1-2 Pro DSLRs, one with up to 70-200mm f/2.8 lens attached, 8 lenses/speed lights, 15" laptop, tripod and accessories. The ProTactic 450 AW also fits the DJI Mavic Pro drone
                Never miss a critical mission thanks four access points: the molded, turret-loading top, quick-grab from both sides, and full, back entry for set-up and security
                Create limitless set-ups with a robust, Slip Lock compatible strap system. Internal Dimensions: 31.8 x 19.8 x 44 cm (12.52 x 7.80 x 17.32 in) External Dimensions: 34.8 x 27 x 48.8 cm (13.70 x 10.63 x 19.21 in). Weight: 2.6 kg (5.72 lbs)
                Get versatile with five modular accessories - water bottle pouch, accessory case, tripod cup and two cinch straps - all Slip Lock-compatible and included with pack
                ProTactic features ActivZone System technology to deliver targeted support at shoulder blades, lumbar and waist for comfort on the move. Laptop compartment dimensions-11.2x 1.1 x 14.5 inch',
  brand: "Lowepro",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/tristan-gear/tristan-bag.jpg").open,
)

bag.user = tristan
bag.save!

main_camera = Product.new(
  referal_link: "http://amzn.to/2kdu35o",
  title: "Canon EOS-1DX Mark II DSLR Camera (Body Only)",
  price: 4298,
  description: "Fastest shooting EOS-1D, capable of up to 14 fps full-resolution RAW or JPEG, and up to 16 fps in Live View mode with new Dual DIGIC 6+ Image Processors. The magnification is approx. 0.76x (-1m-1 with 50mm lens at infinity) / 35.1° angle of view
                Achieves a maximum burst rate of up to 170 RAWs in continuous shooting at up to 16 fps, and 4K movies using CFast cards in the new CFast 2.0 slot
                Improved AF performance through 61-point, wide area AF system with 41 cross-type points, improved center point focusing sensitivity to -3 EV and compatibility down to f/8
                Accurate subject tracking for stills and video with new EOS Intelligent Tracking and Recognition AF with 360,000-pixel metering sensor. Working temperature range: 0°C - 45°C / 32°F - 113°F
                4K video (4096 x 2160) up to 60 fps (59.94), with an 8.8-Megapixel still frame grab in camera. Full 1080p HD capture up to 120 fps for slow motion",
  brand: "Canon",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/tristan-gear/tristan-main-camera.jpg").open,
)

main_camera.user = tristan
main_camera.save!

vlog_cam = Product.new(
  referal_link: "http://amzn.to/2kSyfdj",
  title: "Canon EOS 6D Mark II Digital SLR Camera Body – Wi-Fi Enabled",
  price: 1155,
  description: "26.2 Megapixel Full-frame CMOS Sensor
                Optical Viewfinder with a 45-point All Cross-type AF System. Compatible Lenses: Canon EF lenses (excluding EF-S and EF-M lenses)
                Dual Pixel CMOS AF with Phase-detection & Full HD 60p
                DIGIC 7 Image Processor, ISO 100-40000. GPS, Wi-Fi, NFC and Bluetooth low energy
                Vary-angle Touch Screen, 3.0-inch LCD
                Standard Power Supply: Battery Pack LP-E6N / LP-E6",
  brand: "Canon",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/tristan-gear/tristan-vlog-camera.jpg").open,
)

vlog_cam.user = tristan
vlog_cam.save!

backup_camera = Product.new(
  referal_link: "http://amzn.to/2r29gGg",
  title: "Canon EOS 5D Mark IV Full Frame Digital SLR Camera Body",
  price: 2799,
  description: "30.4 MP full-frame CMOS sensor for versatile shooting
                Up to 7.0 frames per second continuous shooting speed
                61-point AF system with 41 cross-points for expanded vertical coverage
                ISO range 100-32000 with 50-102400 expansion
                4K video recording at 30p or 24p and in-camera still frame grab of 8.8MP images
                Touch-screen LCD monitor",
  brand: "Canon",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/tristan-gear/tristan-backup-cam.jpg").open,
)

backup_camera.user = tristan
backup_camera.save!

favorite_lens = Product.new(
  referal_link: "http://amzn.to/2kQNK4U",
  title: "Canon EF 24mm f/1.4L II USM Wide Angle Lens - Fixed",
  price: 1549,
  description: "Make sure this fits by entering your model number.
                Lens not zoomable
                Minimum focus Distance is 0.8ft
                Focal Length -24 mm
                Diagonal angle of view: 84°",
  brand: "Canon",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/tristan-gear/tristan-lens.jpg").open,
)

favorite_lens.user = tristan
favorite_lens.save!

puts "Creating Joao's gear"

wheels = Product.new(
  referal_link: "https://www.amazon.com/dp/B076B9W78H/?cv_ct_id=amzn1.idea.SP5UNTPPW3RG&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_cyclingmaven_dp_vv_d",
  title: "Enve 4.5 Clincher Wheelset",
  price: 2900,
  description: "Custom built product- Please allow 2 business days production before shipping.
                Brake Type: Rim brake only with molded surface. Not suitable for disc brake use.
                Weight: DT Swiss 240S-1530g, Chris King R45-1520g, DT Swiss 180 Ceramic-1470g
                Spoke Count & Type: 20/24 Front/Rear, Bladed DT Aerolite or Sapim CX-Ray Black
                Included in package: 700C Enve 4.5 wheelset, rim tape, brake pads, valve extenders",
  brand: "Enve",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/joao-gear/joao-wheels.jpg").open,
)

wheels.user = joao
wheels.save!

cycle_bag = Product.new(
  referal_link: "https://www.amazon.com/dp/B00ND21JW0/?cv_ct_id=amzn1.idea.SP5UNTPPW3RG&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_cyclingmaven_dp_vv_d",
  title: 'Lowepro ProTactic 350 AW - A Professional Camera Backpack for 1-2 Pro DSLR Cameras and 13" Laptop',
  price: 124.95,
  description: 'Fits 1-2 Pro DSLRs, one with up to 24-70mm f/2.8 lens attached, 6 lenses/speed lights, 13" laptop, tripod and accessories
                Never miss a critical mission thanks four access points: the molded, turret-loading top, quick-grab from both sides, and full, back entry for set-up and security
                Create limitless set-ups with a robust, SlipLock compatible strap system
                Get versatile with five modular accessories - water bottle pouch, accessory case, tripod cup and two cinch straps - all Slip Lock-compatible and included with pack
                ProTactic features ActivZone System technology to deliver targeted support at shoulder blades, lumbar and waist for comfort on the move.Exterior Material : Nylon',
  brand: "Lowepro",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/joao-gear/joao-wheels.jpg").open,
)

cycle_bag.user = joao
cycle_bag.save!

helmet = Product.new(
  referal_link: "https://www.amazon.com/dp/B00YS9MY1M/?cv_ct_id=amzn1.idea.SP5UNTPPW3RG&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_cyclingmaven_dp_vv_d",
  title: "Kask Protone Helmet",
  price: 181.42,
  description: "Aero Control Technology creates an incredibly aerodynamic and top-performing shell, tested in the Wind Tunnel and able to provide an impressive CX rate
                MIT Technology guarantees higher safety and complete protection, thanks to the polycarbonate layer that covers the shell on the top, on the base ring and on the back
                In-Mold construction joins the inner polystyrene core to the outer polycarbonate layer to ensure better shock absorption
                Reinforced frame protects the shell from secondary impacts",
  brand: "Kask",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/joao-gear/joao-helmet.jpg").open,
)

helmet.user = joao
helmet.save!

shimano_gear = Product.new(
  referal_link: "https://www.amazon.com/dp/B00E3P1RXW/?cv_ct_id=amzn1.idea.SP5UNTPPW3RG&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_cyclingmaven_dp_vv_d",
  title: "SHIMANO 6800 Ultegra 11-Speed Cassette",
  price: 223,
  description: "HG-EV 11-speed cassette sprocket
                Rider tuned wider gearing options
                Includes lock ring
                Made in Japan",
  brand: "Shimano",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/joao-gear/joao-shimano-gear.jpg").open,
)

shimano_gear.user = joao
shimano_gear.save!

puts "Creating Max Gear"

chisel = Product.new(
  referal_link: "https://www.amazon.com/dp/B0165WKKY2/?cv_ct_id=amzn1.idea.MUCBTHY2XFPZ&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_thewoodwhisperer_dp_vv_d",
  title: 'Narex 6 pc set 6mm (1/4"), 10 (3/8"), 12 (1/2"), 16 (5/8"), 20 (13/16") , 26 (1 1/16") Woodworking Chisels in Wooden Presentation Box 853053',
  price: 84.99,
  description: "6 piece set comes on a wooden presentation box
                Blades are made from fine-grained, nicely tempered chrome-manganese steel and hardened to Rc 59
                Contains the following sizes: 6, 10, 12, 16, 20 and 26 mm
                Bevel ground at a 25 degree bevel.
                Handles are made from stained European Beech",
  brand: "Narex",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/max-gear/max-chisel.jpg").open,
)

chisel.user = max_s
chisel.save!

router = Product.new(
  referal_link: "https://www.amazon.com/dp/B01LG5XIZG/?cv_ct_id=amzn1.idea.MUCBTHY2XFPZ&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_thewoodwhisperer_dp_vv_d",
  title: "Festool 574692 Router OF 1400 EQ Imperial",
  price: 600,
  description: "Ergonomic handles: Festool routers are designed for increased control and reduced fatigue. Integrated switches allow use with just one hand
                Dust extraction: Integrated dust extraction ports capture dust and debris at the point of creation, increasing visibility, prolonging cutter life, and saving valuable cleanup time
                Swiveling chip deflector: Can be used with edge forming bits, maximizing chip and dust extraction even around curves and corners. Attaches and releases quickly with tool-free spring clip system
                System integration: Designed for use with the FS Guide Rail system, MFS multi-routing templates, and a wide range of other accessory options
                Precision depth adjustment: Micro-adjustability dial allows routing with tremendous precision",
  brand: "Festool",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/max-gear/max-festool.jpg").open,
)

router.user = max_s
router.save!

bevel = Product.new(
  referal_link: "https://www.amazon.com/dp/B001C04FZS/?cv_ct_id=amzn1.idea.MUCBTHY2XFPZ&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_thewoodwhisperer_dp_vv_d",
  title: "Crown Tools 116 / Big Horn 20120 9 Inch Miniature Bevel, Rosewood",
  price: 22.94,
  description: 'Exceptional quality tool from Crown Hand Tools Ltd, Sheffield, England
                Tempered blued steel blade | Rosewood Handle
                Solid brass end cap with adjusting wing nut
                Use with dovetails and framing
                Use to transfer corner angles to shelves | Size: 9"',
  brand: "CROWN",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/max-gear/max-bevel.jpg").open,
)

bevel.user = max_s
bevel.save!

finish = Product.new(
  referal_link: "https://www.amazon.com/dp/B0155AUTG4/?cv_ct_id=amzn1.idea.3QN2LXQZFF81P&cv_ct_pg=storefront&cv_ct_wn=aip-storefront&ref=exp_cov_thewoodwhisperer_dp_vv_d",
  title: "Tried and True Danish Oil, Pint",
  price: 23.99,
  description: 'Superior penetrating linseed oil finish that is polymerized for fast and easy application on interior woodwork and furniture
                Danish Oil is a good choice for any wood work where you want a satin finish
                Use on kitchenware, cutting boards, and children\'s furniture, since it is food safe and non-toxic
                The coverage is 1000 sq. ft./gallon, very economical
                Two or three coats is typical for most applications, apply with lint-free cloth',
  brand: "Tried & True Wood Finish",
  seller: "Amazon",
  photo: Pathname.new("./app/assets/images/max-gear/max-finish.jpg").open,
)

finish.user = max_s
finish.save!

puts "Creating reviews ..."

r1 = Review.new(
  description: "Hands down the best DSLR you will ever use! I purchased the 1Dx Mark ii for its incredible image quality & high frame rates for both still images & video. It’s ability to take 120 FPS video at 1080p is totally legit & well worth the money!
                It’s also full frame, so the images this camera produces are unparalleled.
                This is a heavy camera, but it curtainly helps with image stabilization.",
  rating: 5,
)

r1.product = main_camera
r1.user = max_s
r1.save!

r2 = Review.new(
  description: 'This lens is absolute gold! I use it every single day for vlogging, filming, and photo shoots! The auto focus is amazing and the clarity is unmatched! I highly recommend this lens! I took it to Honduras for 2 weeks and didn\'t end up using any other lens. I took it to Toronto for 5 days and ended up not using any of my other lenses. A lot of people told me, just get a Sigma, they are half the price. But I said no and let me tell you, this baby has paid for itself!',
  rating: 5,
)

r2.product = favorite_lens
r2.user = joao
r2.save!

r3 = Review.new(
  description: "Overall an excellent improvement on the 1DX. Features that I find most useful are:

                ) All 61 focus points (21 X-type) can focus at f8 when one uses series III teleconverters on specific L-lenses.
                2) Increase spread in AF points across the frame to aid in composition
                3) Improved dynamic range below ISO 1600 and improved shadow noise. Below ISO 3200 there is virtually no noise and noise is well controlled up to ISO 12800.
                4) AF sensors in red rather than black so they are easier to see
                5) Improved buffer with 170 RAW files (from Canon) although I saw a video with Andy Rouse where he got over 200 RAW files before the buffer slowed down. WOW!!
                6) DPAF for quick focusing on sensor (useful for stills and movies) in live view mode
                7) Ability to view a level in the viewfinder at all times which is very useful for handheld photography.
                8) Better focus tracking ability
                9) 1.5% spot metering",
  rating: 5,
)

r3.product = main_camera
r3.user = joao
r3.save!

r4 = Review.new(
  description: 'I\'m thrilled LowePro has made a bag like this for people that need fast access to their gear and the ability to expand with molle-compatible attachments based on their field assignments. My load changes from a 2-3 body + 2-3 lens setup to a 1 body + 4 lens + 2 speed light setup. The idea that I can just strap a molle-compatible pouch full of cables/filters/memory cards outside the bag makes them easy to get to and quick to access. It also gives me the flexibility of leaving behind the elements I don\'t need. The ProTactic is also built like everything else from LowePro, which is to say it\'s designed outlast the rest of the gear you\'re carrying in it, all while being fairly light on its own.
                Now the bad part - My primary body is a Nikon D4s, and it\'s a really tight fit getting it into and out of the side compartment with the 70-200 f/2.8 attached. If I have to pull my camera out of my bag quickly, it takes a lot of yanking and wiggling. Nothing like the ease of similar bags from Think Tank that were built with pro-grade, full-sized, grip\'d DSLRs in mind. Additionally, it\'s a super tight fit when the laptop in there. It\'s sometimes tough to close the main compartment zipper. Again... All problems resulting from using larger-than-average grip\'d bodies. To be clear, the side deployment is still possible, but it\'s not a smooth in and out.
                Also, the belt pouch is 100% useless. Why they included it is beyond me.
                The ProTactic is not a perfect carry solution, but it\'s the best I\'ve found so far.',
  rating: 4,
)

r4.product = bag
r4.user = max_s
r4.save!

r5 = Review.new(
  description: 'I just had the worst accident in my 10 years of road cycling. This helmet saved my life. I hit hard on the back left of my head and walked away with an arm fracture, sprained wrist, bruised ribs, but no concussion or head trauma. This helmet did its job and cracked a bit but I didn\'t. I just bought another Kask Protone. Please wear a good helmet and fit it right.',
  rating: 5,
)

r5.product = helmet
r5.user = max_s
r5.save!

r6 = Review.new(
  description: 'I bought this helmet few weeks ago. Fits nicely, no wind noise. I had a nasty crash, fractured my collarbone & hit me head pretty hard on the pavement but helmet protected me really well, didn\'t feel a thing, didn\'t lose consciousness. In fact barely noticed the contact with pavement. Will buy another before I ride again',
  rating: 5,
)

r6.product = helmet
r6.user = tristan
r6.save!

r7 = Review.new(
  description: 'Functionally excellent, but with a couple caveats. Replaced a 105 11-speed 11-32t cassette with this Ultegra cassette (same specs)., and found out that the Ultegra requires an additional large spacer between the hub and the cassette. Two, I don\'t see any functional advantage between the 105 and the Ultegra - both shift smoothly and work fine. Very slight difference in weight; otherwise, you\'re just paying more.',
  rating: 4,
)

r7.product = shimano_gear
r7.user = tristan
r7.save!

r8 = Review.new(
  description: "Wanted to do a Di2 upgrade on my bike with a broader range cassette for climbing the hills and mountains of western NC. Shimano is quality and reliability. Works like a charm on my Dura ace Di2 bike (with the exception of this cassette and a medium cage Ultegra 6870 Di2 rear derailleur). Compatibility is great with the e tube Shimano system.",
  rating: 5,
)

r8.product = shimano_gear
r8.user = max_s
r8.save!

r9 = Review.new(
  description: 'Had some issues with comfort when I first bought it, but now I know it needed to be broken in. I moved from a shoulder bag to backpack style so I could be hands free to haul additional gear at the same time. This is great if you travel as dragging wheeled luggage or wheeled pelican cases with the backpack is easy. Try hauling extra gear with a shoulder bag - it sucks.
                I regularly carry a gripped 5d3, 4 lenses (50, 85, 24-70, and 14mm, battery holder with 4 batteries, nd filter, giotto air blower, black rapid strap, charger or two, an ipad, and lots of other stuff I\'m forgetting I carry in the top foldout section.
                Picture I uploaded is with a 70-200 f2.8 configuration. It fits in the bottom part of the bag with room for a few more items.',
  rating: 4,
)

r9.product = cycle_bag
r9.user = tristan
r9.save!

r10 = Review.new(
  description: 'I\'ve been woodworking for decades and had a major project that involved cutting complex and precise mortises, and my old chisels were frustrating me. After searching through all the brands available on Amazon, the Narex chisels seemed to get consistently good reviews and were priced very affordably. They are very well made and very sharp. I\'m a good woodworker, but not a fanatic who spends hours fine-tuning new tools. These cut very well out of the box, and held up without resharpening for my whole project. This set has a very useful selection of sizes and meet my needs for most projects involving chisels.',
  rating: 5,
)

r10.product = chisel
r10.user = joao
r10.save!

r11 = Review.new(
  description: 'The chisel set was made with precision and craftsmanship both on machining the steel, wood handle finish, and even the woods box that they came with.
                Expect to spend some effort to flatten the back (some more difficult than others). But way better than my old Craftsman set. It took me a couple hours to sharpen all six of them. They feel good in my hand. Can\'t testify how well it stay sharp ye',
  rating: 4,
)

r11.product = chisel
r11.user = tristan
r11.save!

r12 = Review.new(
  description: 'After messing around with other brands of routers I finally broke down and bought a Festool 1440 EQ Router. AMAZING machine. Having just bought a new table saw (Grizzly G0690) I was frustrated with the lack of repeatable accuracy for crosscuts of large/long cabinet sides. Dados are very hard to get right with a cutting depth of 29" to the right of the saw blade. Enter the Festool 1440 router and the Festool MFT/3 Table. The Router is SMOOOOOTH as silk in its running. Quiet too! I\'ve had PC routers and Dewalt routers that sound like a jet engine. When combined with the Festool MFT/3 and its rail system the accurancy is just what I was looking to have in my funiture shop. The initial investment is a bit much (ouch) but in the end I am VERY happy. I HAD another brands setup that starts with "M" but I sent it back... not nearly accurage enough. So YES... I have drank the green coolaid! I also have the TS 55 Track saw and love it too!',
  rating: 5,
)

r12.product = router
r12.user = tristan
r12.save!

r13 = Review.new(
  description: 'Absolutely love this oil. It\'s so easy to apply, has a nice natural fragrance that doesn\'t stick around, and best of all it lets the natural color of the wood come through perfectly. For example on a piece of walnut I used walnut oil, and while the finish is lovely, the color turned quite red and dark. The exact same walnut with this varnish is a lovely natural un-red, not-too-dark color that shows off the grain fantastically. The satin finish is absolutely beautiful--they ought to squeeze \'silky\' into the name somehow.
                I use 5000 steel wool in between coats and put on 4 or 5 (depending on how much time I have) coats--it\'s so easy and lovely to put on, I don\'t see any reason not to keep going if I have the time, plus it\'s great for my hands--a little extra bonus. I\'ve used this varnish for years and for sure will never use any other wood / furniture oil ever again',
  rating: 5,
)

r13.product = finish
r13.user = joao
r13.save!

puts "All seeds created successfully!"
