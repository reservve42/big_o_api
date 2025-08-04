# big_o_api
#1 example using API + Big O Notation + Ruby + Sinatra

## Lightweight Ruby API for Algorithmic Complexity Estimation
# Abstract
is a minimalistic HTTP service that estimates time complexity (Big-O) of user-defined Ruby functions via runtime benchmarking.
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
