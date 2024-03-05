let Labels = { severity : Text }
let Annotations = { summary : Text, description : Text }
let AlertingRule = { alert : Text, expr : Text, for : Text, labels : Labels, annotations : Annotations }
let RuleGroup = { name : Text, rules : List AlertingRule }
let example : List AlertingRule =
 [ { alert = "instance down"
   , expr = "up == 0"
   , for = "5m"
   , labels =
     { severity = "critical" }
   , annotations =
     { summary = "Instance {{ $labels.instance }} down"
     , description = "{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes."
     }
   }
 ]
let thermal : List AlertingRule =
 [ { alert = "thermal warning"
   , expr = "node_thermal_zone_temp{job=\"raspberries\", type=\"cpu-thermal\"} > 65.0"
   , for = "5m"
   , labels =
     { severity = "warning" }
   , annotations =
     { summary = "{{ $labels.instance }} is over {{ $value }}."
     , description = "none."
     }
   }
 , { alert = "thermal critical"
   , expr = "node_thermal_zone_temp{job=\"raspberries\", type=\"cpu-thermal\"} > 75.0"
   , for = "5m"
   , labels =
     { severity = "critical" }
   , annotations =
     { summary = "{{ $labels.instance }} is over {{ $value }}."
     , description = "none."
     }
   }
 ]
let diskusage : List AlertingRule =
 [ { alert = "disk usage warning"
   , expr = "100.0 - 100.0 * (node_filesystem_avail_bytes / node_filesystem_size_bytes{job=\"raspberries\", mountpoint=\"/\"}) > 85.0"
   , for = "5m"
   , labels =
     { severity = "warning" }
   , annotations =
     { summary = "Instance {{ $labels.instance }} is low on disk space ({{ $value }}%)."
     , description = "none."
     }
   }
 , { alert = "disk usage critical"
   , expr = "100.0 - 100.0 * (node_filesystem_avail_bytes / node_filesystem_size_bytes{job=\"raspberries\", mountpoint=\"/\"}) > 95.0"
   , for = "5m"
   , labels =
     { severity = "warning" }
   , annotations =
     { summary = "Instance {{ $labels.instance }} is low on disk space ({{ $value }}%)."
     , description = "none."
     }
   }
 ]
in { groups =
     [ { name = "example"
       , rules = example
       }
     , { name = "thermal"
       , rules = thermal
       }
     , { name = "diskusage"
       , rules = diskusage
       }
     ]
   }
 