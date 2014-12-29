# Development plan

Will use Wt library, and the FXCM api for starters.

We should store/cache everything in postgres.

--------

## Layers

Let's write it in layers.

### Price action layer

#### Models

##### Currency

 * pair_name

##### Tick

 * Currency
 * time (WDateTime)
 * Value

##### Candle
 
 * Period length (5 min / 1 hour / 1 day, etc)
 * time (WDateTime)
 * open price
 * close price
 * high
 * low

### Price Analysis layer

 * Moving average
 * Fibionacci

### Signal analysis layer

 * Signals when moving averages cross etc.

---------

# Archetecture

 +--src
 |--price_action
 |  |--models
 |  |--price_provider
 |     |--fxcm_api.cpp
 |     |--postgres.cpp
 |     |--cached_fxcm_api.cpp # Gets from fxcm, and caches/fills in postgres
 |--price_analysis
 |  |--moving_averages.cpp
 |  |--ichimoku.cpp
 |--signal_analysis
 |  |--events
 |  |  |--moving_average_events.cpp
 |  |--processors # Processes a chain of events, to give a higher level signal
 |     |-- ichimoku_triple_cross.cpp
 |--strategies
 |  |-- ichimoku_triple_cross.cpp
 |--strategy_tester
 |  |--model # So we can store the results of tests against historical data
 |--strategy_creator.cpp # Creates and tests the robots own strategies
 |--GUI
    |--main_window.cpp
    |--strategy_result.cpp
    |--strategy_runner.cpp
    |--widgets
       |--candle.cpp # ? Maybe can use Wt charting .. maybe need to use canvas to draw our own
       |--line.cpp

---------

# Development process

 1. Make the lower level models
 2. Get the fxcm api working
 3. Download some stuff into postgres

