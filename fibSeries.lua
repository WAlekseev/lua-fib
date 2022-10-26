-- Written 26.10.2022 by Vladimir Alekseev for MyOffice request as test coding task.
-- This script tested only with lua 5.3 and due to some issues with float/integer number types 
-- may not work with 5.2 and yearly versions of lua. Please use version 5.3
-- I'm using math.floor for print integer and float for store Fibonacci series in table.


--[[ FUNCTIONS ]]-- 

-- Recursive Method calculating Fibonacci
function fibonacciSeries(depth)
  -- start from 1, 2 cause in task mentioned natural numbers
  local fib = {1.0, 2.0}
  for i=3, depth do
    fib[i] = fib[i-2] + fib[i-1]
  end
  return fib
end

-- Get input and check for integer number
function getInput(prompt)

  local numba = 0

  repeat
    print(prompt)
    numba = tonumber(io.read())
    if numba ~= nil then
      return numba
    else
      print("Error, value must be integer")
    end
  until (tonumber(io.read()) ~= nil)
 

end

-- Check A2 cell value for even/odd sign
function modulusNum(n)

  if (n % 2 == 0) then
    return "even"
  else
    return "odd"
  end

end

-- Create matrix table
function createMatrix(rows, cols)
  local m = {}
    for i=1, rows do
      m[i] = {}
      for j=1, cols do
        m[i][j] = 0
      end
    end
  -- fill basic values
  m[1][1] = cell.A1  -- A row, with index 1
  m[2][1] = cell.A2  -- A row, with index 2
  m[1][2] = 0        -- B column, with index 1
  m[2][2] = cell.B2  -- B column, with index 2
  return m
end

-- Print matrix table
function printMatrix(m)
  local rows = #m
  local cols = #m[1]
  print("--- Resulting matrix ---")
  io.write("\n  A  B .. \n")
  for i=1, rows do
    io.write("[")
    for j=1, cols do
      io.write(" " .. math.floor((m[i][j])) .. " ") -- use math.floor to get largest int value, lua have dynamic variable type model
    end
    io.write("]\n")
  end
  io.write("rows: " .. rows .. ", cols: " .. cols .. "\n")
end


--[[ MAIN ]]-- 


cell = {}        -- table for basic reference values
local ft = {}    -- table for Fibonacci series data
matrixCell = {}  -- matrix table with resulting values (2D array)

cell.A1 = 0      -- A1 cell for define depth in Fibonacci series
cell.A2 = 0      -- A2 cell for define fill type in table
cell.B2 = 0      -- B2 cell as starting point to store Fibonacci series

-- print header
print("\n-- Fibonacci calculator --\n\n")


-- get values for calculating
cell.A1 = getInput("Enter integer value for cell A1: ")
cell.A2 = getInput("Enter integer value for cell A2: ")


-- print values
print("\n" .. "A1 = " .. cell.A1 .. ", Fibonacci series depth")
print("A2 = " .. cell.A2 .. ", number type: " .. modulusNum(cell.A2) .. "\n")

-- calucate Fibonacci series and print it in special manner: A2 even = row, odd = column
ft = fibonacciSeries(cell.A1)

-- print ft table
io.write("#\tFibonacci series\n")
for k,v in pairs(ft) do
  io.write(k .. "\t" .. v .. "\n")
end

-- form resulting table (matrix) with Fibonacci series for selected order:
-- B2 .. Bn for odd - vertical filling type, store values in matrix by rows
-- B2 .. Zn2 for even - horizontal filling type, store values in matrix by columns
if modulusNum(cell.A2) == "odd" then
  -- ROW mode
  print("\n" .. "row mode filling" .. "\n")
  -- init resulting table (matrix)
  matrixCell = createMatrix(#ft+1,2)  -- create resulting matrix for row mode, shift to B2
  -- use ft table for basic pairs
  for k,v in pairs(ft) do
    -- print (k,v)
    matrixCell[k+1][2] = v -- create row-based matrix, shift to B2
  end
  -- print resulting table (matrix)
  printMatrix(matrixCell)
 
elseif modulusNum(cell.A2)  == "even" then
  -- COLUMN mode
  print("\n" .. "column mode filling" .. "\n")
  -- init resulting table (matrix)
  matrixCell = createMatrix(2,#ft+1)  -- create resulting matrix for row mode, shift to B2
  -- use ft table for basic pairs
  for k,v in ipairs(ft) do
    matrixCell[2][k+1] = v -- create column-based matrix, shift to B2
  end
  -- print resulting table (matrix)
  printMatrix(matrixCell)
end



