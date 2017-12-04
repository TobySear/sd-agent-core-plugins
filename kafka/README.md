# Kafka Integration

## Overview

Get metrics from kafka service in real time to:

* Visualize and monitor kafka states
* Be notified about kafka failovers and events.

## Installation

Install the `sd-agent-kafka` package manually or with your favorite configuration manager

## Configuration

Edit the `kafka.yaml` file to point to your server and port, set the masters to monitor

## Validation

When you run `sd-agent info` you should see something like the following:

    Checks
    ======

        kafka
        -----------
          - instance #0 [OK]
          - Collected 39 metrics, 0 events & 7 service checks

## Compatibility

The kafka check is compatible with all major platforms
