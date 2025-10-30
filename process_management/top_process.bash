#! /bin/bash

ps --sort=-pcpu,-pmem -eo "%c %C" | head
