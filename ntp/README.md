# NTP check
{{< img src="integrations/ntp/ntpgraph.png" alt="NTP Graph" responsive="true" popup="true">}}
## Overview

The Network Time Protocol (NTP) integration is enabled by default and reports the time offset from an ntp server every 15 minutes. When the local agent's time is more than 15 seconds off from the Datadog service and the other hosts that you are monitoring, you may experience:

* Incorrect alert triggers
* Metric delays
* Gaps in graphs of metrics

## Setup
### Installation

The NTP check is packaged with the Agent, so simply [install the Agent](https://support.serverdensity.com/hc/en-us/search?query=install) on any host. If you need the newest version of the check, install the `sd-agent-ntp` package.

### Configuration

The Agent enables the NTP check by default, but if you want to configure the check yourself, create a file `ntp.yaml` in the Agent's `conf.d` directory. See the [sample ntp.yaml](https://github.com/DataDog/integrations-core/blob/master/ntp/conf.yaml.default) for all available configuration options:

```
init_config:

instances:
  - offset_threshold: 60 # seconds difference between local clock and NTP server when ntp.in_sync service check becomes CRITICAL; default is 60
#   host: pool.ntp.org # set to use an NTP server of your choosing
#   port: 1234         # set along with host
#   version: 3         # to use a specific NTP version
#   timeout: 5         # seconds to wait for a response from the NTP server; default is 1
```

Configuration Options:

* `host` (Optional) - Host name of alternate ntp server, for example `pool.ntp.org`
* `port` (Optional) - What port to use
* `version` (Optional) - ntp version
* `timeout` (Optional) - Response timeout

[Restart the Agent](https://docs.datadoghq.com/agent/faq/start-stop-restart-the-datadog-agent) to effect any configuration changes.

### Validation

[Run the Agent's `info` subcommand](https://docs.datadoghq.com/agent/faq/agent-status-and-information/) and look for `ntp` under the Checks section:

```
  Checks
  ======
    [...]

    ntp
    -------
      - instance #0 [OK]
      - Collected 1 metrics, 0 events & 0 service checks

    [...]
```

### Compatibility

The NTP check is compatible with all major platforms.

## Data Collected
### Metrics
See [metadata.csv](metadata.csv) for a list of metrics provided by this check.

