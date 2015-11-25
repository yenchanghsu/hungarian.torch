require 'hungarian'

local function rearrange_mat(mat,assignment)
  local n = mat:size(2)
  local new_mat = mat.new():resize(n,n):fill(0)
  for i=1,assignment:nElement() do
    if assignment[i]~=0 then new_mat[assignment[i] ] = mat[i] end
  end
  return new_mat
end

local function hungarian_test(mat)
--This function is for unit test
--test 1
  mat = mat or torch.IntTensor({{10,19, 8,15},
                             {10,18, 7,17},
                             {13,16, 9,14},
                             {12,19, 8,18},
                             {14,17,10,19}})                            
  print('test1 input:')
  print(mat)
  local assignment = hungarian.minCost(mat)
  local new_mat = rearrange_mat(mat,assignment)
  print('test1 output:')
  print(assignment)
  print('test1 rearrange result:')
  print(new_mat)
  local answer = torch.IntTensor({1,3,4,0,2})   
  assert(assignment:add(answer:mul(-1)):sum()==0)

--test 2
  mat=mat:t()
  print('test2 input:')
  print(mat)
  local assignment = hungarian.minCost(mat)
  local new_mat = rearrange_mat(mat,assignment)
  print('test2 output:')
  print(assignment)
  print('test2 rearrange result:')
  print(new_mat)
  answer = torch.IntTensor({1,5,2,3})  
  assert(assignment:add(answer:mul(-1)):sum()==0)
    
  print('TEST PASS!')
  
end

hungarian_test()