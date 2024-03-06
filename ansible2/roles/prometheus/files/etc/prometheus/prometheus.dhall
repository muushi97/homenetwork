


let config =
      { scrape_interval = "15s"
      , evaluation_interval = "15s"
      , external_labels = { monitor = "codelab-monitor" }
      }
in  { global = config
    , rule_files = [ "./rules.d/*.yml" ]
    , scrape_config_files = [ "./scrapes.d/*.yml" ]
    , alerting =
      { alertmanagers =
        [ { static_configs = [ { targets = [ "10.0.0.102:9093" ] } ] } ]
      }
    }


-- global:
--   scrape_interval: 15s
--   evaluation_interval: 15s
--   external_labels:
--     monitor: 'codelab-monitor'
-- 
-- rule_files:
-- - ./rules.d/*.yml
-- 
-- scrape_config_files:
-- - ./scrapes.d/*.yml
-- 
-- 
-- #alerting:
-- #  alertmanagers:
-- #  - static_configs:
-- #    - targets:
-- #      - alertmanager:9093
