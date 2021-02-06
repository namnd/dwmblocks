#!/bin/sh

eth=$(curl -s https://api.btcmarkets.net/v3/markets/tickers?marketId=ETH-AUD | \
            grep -Po '"lastPrice":.*?[^\\]"' | \
            sed "s/\"//g" | \
            awk -F':' '{printf ("$%0.2f", $2)}')

echo "ETH: $eth"

