#hungarian algorithm for torch#

Wrapping c implementation of Hungarian algorithm (or Munkres assignment algorithm) to torch/lua

The c code comes from [Cyrill Stachniss's work](http://www2.informatik.uni-freiburg.de/~stachnis/misc/libhungarian-v0.1.3.tgz)


## Installation ##

Install from server:
```
luarocks install hungarian
```

Or from local source:
```
luarocks make hungarian-scm-1.rockspec
```

## Usage ##
```lua
require 'hungarian'
-- input must be torch.IntTensor
matrix = torch.IntTensor({{10,19, 8,15},
                          {10,18, 7,17},
                          {13,16, 9,14},
                          {12,19, 8,18},
                          {14,17,10,19}})     
min_assignment = hungarian.minCost(matrix)
max_assignment = hungarian.maxCost(matrix)
```

Also see test.lua for example
