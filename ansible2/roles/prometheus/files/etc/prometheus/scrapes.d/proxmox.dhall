

let relabel_config1 =
      { source_labels = [ "__address__" ]
      , target_label = "__address__"
      , replacement = "$1:9221"
      }
let scrape_config1 =
      { job_name = "pve"
      , file_sd_configs = [ { files = [ "../targets.d/proxmox.yml" ] } ]
      , metrics_path = "/pve"
      , relabel_configs = [ relabel_config1 ]
      , params =
        { module = [ "default" ]
        , cluster = [ "1" ]
        , node = [ "1" ]
        }
      }
in  { scrape_configs = [ scrape_config1 ] }


-- scrape_configs:
-- - job_name: 'pve'
--   file_sd_configs:
--     - files:
--       - ../targets.d/proxmox.yml
--   relabel_configs:
--     - source_labels:
--         - __address__
--       target_label: __address__
--       replacement: '$1:9221'
--   metrics_path: /pve
--   params:
--     module: [default]
--     cluster: ['1']
--     node: ['1']



