#!/bin/bash

export CUDA_VISIBLE_DEVICES=0

# cd to parent dir
cd ..

case="nmaexample"

# parameters

# buy_cost_pct (float): cost for buying shares
# sell_cost_pct (float): cost for selling shares
# hmax (int, array): maximum cash to be traded in each tradeper asset.
#                   If an array is provided, then each index correspond to each asset

# running script
python main_multi_crypto_trading.py --no_train --prep_flag 0\
       --model_name sac\
       --data_dir daata/Binance/spot-15min\
       --results_dir results/$case\
       --start_date 2022-01-01\
       --end_date 2022-07-16\
       --start_trade_date 2022-04-01\
       --tech_indicators macd boll_ub boll_lb rsi_30 cci_30 dx_30 close_30_sma close_60_sma\
       --market Binance\
       --tickers BTCUSDT ETHUSDT ADAUSDT\
       --hmax 100\
       --initial_amount 1000\
       --buy_cost_pct 0.001\
       --sell_cost_pct 0.001\
       --learning_rate 0.0001\
       --total_timesteps 80000\
