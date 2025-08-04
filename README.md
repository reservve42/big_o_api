# big_o_api
#1 example using API + Big O Notation + Ruby + Sinatra

## Lightweight Ruby API for Algorithmic Complexity Estimation
# Abstract
is a HTTP service that estimates time complexity (Big-O) of user-defined Ruby functions via runtime benchmarking.
It evaluates time growth over varying input sizes and heuristically classifies the algorithm's asymptotic behavior.

This tool is intended for:

Algorithm analysis and validation in early R&D.

Teaching Big-O by visual, empirical behavior.

Integrating complexity validation into CI/CD pipelines.

Lightweight benchmark automation without external dependencies.

--
## Requirements 
- Ruby > 2.6 (https://www.ruby-lang.org/pt/documentation/installation/)
- Sinatra > 3.0 (https://sinatrarb.com/)
-- 

# Instalation

gem install sinatra 

git clone https://github.com/reservve42/big_o_api.git
cd big_o_api

ruby app.rb

(obs: by default, the server runs on localhost:3000)



Receives a Ruby function via JSON, executes it with multiple input sizes, and returns estimated complexity with raw timing data.

## curl

json
{
  "complexity": "O(n) - Logarithmic or Linear time",
  "timings": [
    { "n": 10, "time": 0.00001 },
    { "n": 100, "time": 0.00005 },
    { "n": 1000, "time": 0.00031 },
    { "n": 5000, "time": 0.00129 }
  ]
}

(obs: run in your terminal — i'm using Ubuntu to run)

curl -X POST http://localhost:3000/big_o \
  -H "Content-Type: application/json" \
  -d '{
    "code": "def run(n); arr = Array.new(n) { rand }; arr.sort!; end"
  }'

## Complexity Heuristic

- ~1x: Constant → O(1)
- ~2x: Linear / Logarithmic → O(n) or O(log n)
- ~4-7x: O(n log n) or O(n²)
- >>10x: Likely superlinear (quadratic or worse)
this is not a formal complexity analyzer (like asymptotic proof tools), but a pragmatic and empirical profiler

