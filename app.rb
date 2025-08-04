require 'sinatra'
require 'json'
require 'benchmark'

set :port, 3000
set :bind, '0.0.0.0' 

# Route: POST /big_o
post '/big_o' do
  content_type :json

  begin
    data = JSON.parse(request.body.read)
    code = data["code"]

    # Evaluate the user-defined method called `run(n)`
    eval(code)

    input_sizes = [10, 100, 1_000, 5_000]
    timings = []

    input_sizes.each do |n|
      time = Benchmark.realtime do
        run(n) # Call user-defined function
      end
      timings << { n: n, time: time }
    end

    complexity = estimate_big_o(timings)

    { complexity: complexity, timings: timings }.to_json

  rescue => e
    status 400
    { error: e.message }.to_json
  end
end

# Helper function to estimate Big O
def estimate_big_o(timings)
  ratios = []
  (1...timings.size).each do |i|
    prev = timings[i - 1][:time]
    curr = timings[i][:time]
    ratios << curr / prev
  end

  avg_ratio = ratios.sum / ratios.size

  case avg_ratio
  when 0...1.5
    "O(1) - Constant time"
  when 1.5...2.5
    "O(log n) or O(n) - Logarithmic or Linear time"
  when 2.5...5
    "O(n log n) or O(n^2)"
  else
    "O(n^2) or worse"
  end
end
