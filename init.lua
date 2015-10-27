hungarian = require 'libhungarian'

hungarian.minCost = function(costMat)
  
  assert(torch.isTensor(costMat),'input matrix should be torch tensor')
  assert(costMat:min()>=0,'cost should >=0')
  local h,w = unpack(costMat:size():totable()) -- h: #person; w: #job
--
--Step 1: Input should be row->person;column->job
--
--Step 2: Ensure square matrix
  local n = math.max(h,w)
  -- fill the empty elements with largest value in the cost
  --local mat = costMat.new():resize(n,n):fill(costMat:max())
  local mat = torch.IntTensor(n,n):fill(costMat:max())
  local mask = torch.ByteTensor(n,n):fill(0)
  -- use a mask as the index to copy cost from costMat to mat
  mask:sub(1,h,1,w):fill(1)
  mat:maskedCopy(mask,costMat)

--
--Step 3: solve it
  local inds = hungarian.solver(mat)
  inds:maskedFill(inds:gt(w),0)
  
  inds = inds[{{1,h}}] --discard the appended rows, if any.
  inds:maskedFill(inds:gt(w),0)
  
  return inds
end

return hungarian
