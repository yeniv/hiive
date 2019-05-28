def validator(text)
  text.gsub(/[",']/, "")
  splitted = text.split(" ")
  arr = splitted.reject { |word| !word.match?(/(https?:)?(www\.)?([a-zA-Z0-9_%]*)\b\.[a-z]{2,4}(\.[a-z]{2})?((.[a-zA-Z0-9_%]*)+)?(\.[a-z]*)?/) }
  p arr
end

validator("NEW Lightroom PRESET PACK: https://goo.gl/1CfEKF
    The Music I use: https://goo.gl/IMZC9A - AMAZING for YouTubers
    Colour Graded with my PM LUTS Pack : https://goo.gl/JmUrM7
    PM MERCH & COFFEE! : https://goo.gl/TkzM6S
    
    My 2019 KIT for Filmmaking, Photography & Vlogs:
    Camera Bag: https://amzn.to/2MafNtQ
    Camera Bag Organizer Pouches: https://amzn.to/2suAQ0Z
    GoPro Hero 7 : https://amzn.to/2M7WSzV
    My Drone : https://amzn.to/2spuHDx
    My Smaller Drone : https://amzn.to/2MdxOHF
    ND's For my Drone: https://amzn.to/2VSwkHl
    ND Filters: https://amzn.to/2M9M6ZX
    Cheaper Filter Case: https://amzn.to/2Fsf5Ys
    Main Vlog Camera: https://amzn.to/2RMov6D
    Photo / Timelapse Camera 2: https://amzn.to/2M8W0uS
    VLOG LENS! : https://amzn.to/2Fsiuqi
    Magic ZOOM LENS OF LIFE: https://amzn.to/2ChiDZi
    Gnarly 28-70 Lens: https://amzn.to/2ChiJA8
    DOPE B Roll Lens: https://amzn.to/2VUQVeb
    Small Roll of Gaff Tape: https://amzn.to/2RPUJy6
    Aputure AL-MX Light: https://amzn.to/2VSj9pJ
    3 Legged Thing Tripod: https://amzn.to/2D9dd4v
    Cheap alternative to expensive Time-lapse remote: https://amzn.to/2Dava2z
    Expensive Time-lapse Remote: https://amzn.to/2VUq6GI
    Rode Video Mic Pro Plus: https://amzn.to/2RMROWF
    Think Tank Memory Card Organizers: https://amzn.to/2st9bO2
    Think Tank SD Organizers: https://amzn.to/2Mgvlwl
    Samsung T5 SSD Drive: https://amzn.to/2MbSqQp
    
    FOLLOW ME: 
    Instagram: https://www.instagram.com/petermckinnon/
    Twitter: https://twitter.com/petermckinnon
    Facebook: https://www.facebook.com/petermckinno...
    Website: http://www.petermckinnon.com
    Categoria
    Pessoas e blogues
    ")

# eliminate all quotes
