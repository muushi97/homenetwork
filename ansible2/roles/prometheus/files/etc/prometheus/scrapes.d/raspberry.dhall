
let Dict = List { mapKey : Text, mapValue : List Text }

let RelabelConfig =
      { source_labels : Optional (List Text)
      , separator : Optional Text
      , target_label : Optional Text
      , regex : Optional Text
      , modulus : Optional Integer
      , replacement : Optional Text
      , action : Optional Text
      }
let RelabelConfigDefault =
      { source_labels = None (List Text)
      , separator = None (Text)
      , target_label = None (Text)
      , regex = None (Text)
      , modulus = None (Integer)
      , replacement = None (Text)
      , action = None (Text)
      } : RelabelConfig

let FileSDConfig = { files : List Text }

--let ScrapeConfig =
--      { Type =
--        { job_name : Text
--        , file_sd_configs : List FileSDConfig
--        , relabel_configs : Optional (List RelabelConfig)
--        , metrics_path : Optional Text
--        , params : Optional Dict
--        }
--
--      , default =
--        { job_name = "hoge"
--        , file_sd_configs = []
--        , relabel_configs = None (List RelabelConfig)
--        , metrics_path = None Text
--        , params = None Dict
--        }
--      }

let relabel_configs_1 =
      [ RelabelConfigDefault //
        { source_labels = Some [ "__address__" ]
        , target_label = Some "__address__"
        , replacement = Some "$1:9100"
        }
      ]
let blackbox_relabel_configs =
      [ RelabelConfigDefault //
        { source_labels = Some [ "__address__" ]
        , target_label = Some "__param_target"
        }
      , RelabelConfigDefault //
        { source_labels = Some [ "__param_target" ]
        , target_label = Some "instance"
        }
      , RelabelConfigDefault //
        { target_label = Some "__address__"
        , replacement = Some "10.1.0.103:9115"
        }
      ]
let scrape_config1 =
      { job_name = "raspberries"
      , file_sd_configs = [ { files = [ "../targets.d/raspberry.yml" ] } ]
      , metrics_path = None Text
      , params = None Dict
      , relabel_configs = relabel_configs_1
      }
let blackbox_scrape_config =
      { job_name = "blackbox-icmp"
      , file_sd_configs = [ { files = [ "../targets.d/raspberry.yml" ] } ]
      , metrics_path = Some "/probe"
      , params = Some [ { mapKey = "module", mapValue = [ "icmp" ] } ]
      , relabel_configs = blackbox_relabel_configs
      }
in  { scrape_configs = [ scrape_config1, blackbox_scrape_config ] }


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
