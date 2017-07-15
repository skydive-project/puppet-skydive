# skydive

#### Table of Contents

1. [Description](#description)
1. [Setup](#setup)
    * [What skydive affects](#what-skydive-affects)
    * [Beginning with skydive](#beginning-with-skydive)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module sets up [Skydive](https://github.com/skydive-project/skydive), an open source real-time network topology and protocols analyzer.

## Setup

### What skydive affects

The module offers a class to install and manage the Skydive Analyzer and Agent separately.

### Beginning with skydive

## Usage

Simple include with defaults

```
  include ::skydive::agent
  include ::skydive::analyzer
```

## Limitations

The module has been tested on:

* Centos 7
