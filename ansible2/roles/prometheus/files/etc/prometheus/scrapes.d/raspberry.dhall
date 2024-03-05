

let relabel_config1 =
      { source_labels = [ "__address__" ]
      , target_label = "__address__"
      , replacement = "$1:9100"
      }
let scrape_config1 =
      { job_name = "raspberries"
      , file_sd_configs = [ { files = [ "../targets.d/raspberry.yml" ] } ]
      , relabel_configs = [ relabel_config1 ]
      }
in  { scrape_configs = [ scrape_config1 ] }


-- scrape_configs:
-- # Node Exporter
-- - job_name: 'raspberries'
--   file_sd_configs:
--     - files:
--       - ../targets.d/raspberry.yml
--   relabel_configs:
--     - source_labels:
--         - __address__
--       target_label: __address__
--       replacement: '$1:9100'
-- 
-- #- job_name: 'blackbox-icmp'
-- #  file_sd_configs:
-- #    - files:
-- #      - ../targets.d/*.yml
-- #  metrics_path: /probe
-- #  params:
-- #    module:
-- #    - icmp
-- #  relabel_configs:
-- #    - source_labels:
-- #        - __address__
-- #      target_label: __param_target
-- #    - source_labels:
-- #        - __param_target
-- #      target_label: instance
-- #    - target_label: __address__
-- #      replacement: blackbox-exporter:9115
