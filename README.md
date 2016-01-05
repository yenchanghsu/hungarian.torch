#hungarian algorithm for torch#

Wrapping c implementation of Hungarian algorithm (or Munkres assignment algorithm) to torch/lua

The c code comes from [Cyrill Stachniss's work](http://www2.informatik.uni-freiburg.de/~stachnis/misc/libhungarian-v0.1.3.tgz)

## Benchmark ##
Compute 1000x1200 matrix only takes 0.28s with Intel 4790K

## Installation ##

Install from local source:
```
luarocks make hungarian.torch/hungarian-scm-1.rockspec
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

## Test ##
```
th test.lua
```

Expected results:

```
test1 input:	
 10  19   8  15
 10  18   7  17
 13  16   9  14
 12  19   8  18
 14  17  10  19
[torch.IntTensor of size 5x4]

test1 output:	
 1
 3
 4
 0
 2
[torch.IntTensor of size 5]

test1 rearrange result:	
 10  19   8  15
 14  17  10  19
 10  18   7  17
 13  16   9  14
[torch.IntTensor of size 4x4]

test2 input:	
 10  10  13  12  14
 19  18  16  19  17
  8   7   9   8  10
 15  17  14  18  19
[torch.IntTensor of size 4x5]

test2 output:	
 1
 5
 2
 3
[torch.IntTensor of size 4]

test2 rearrange result:	
 10  10  13  12  14
  8   7   9   8  10
 15  17  14  18  19
  0   0   0   0   0
 19  18  16  19  17
[torch.IntTensor of size 5x5]

TEST PASS!	
```