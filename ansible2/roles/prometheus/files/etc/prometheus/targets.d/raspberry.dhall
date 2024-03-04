

let pi4 =
      { targets = [ "192.168.157.27" ]
      , labels = { instance = "raspberry pi 4" }
      }
let pi3 =
      { targets = [ "192.168.157.28" ]
      , labels = { instance = "raspberry pi 3" }
      }
in  [ pi4, pi3 ]


-- - targets:
--   - '192.168.157.27'
--   labels:
--     instance: 'raspberry pi 4'
-- - targets:
--   - '192.168.157.28'
--   labels:
--     instance: 'raspberry pi 3'
