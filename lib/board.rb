class Board
attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end  

  def [](position)
    row, col = position
    @grid[row][col]
  end  

  def []=(position, val)
    row, col = position
    @grid[row][col] = val
  end  

  def num_ships
    count = 0
    @grid.flatten.each do |ele|
      count += 1 if ele == :S 
    end   
    count  
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship"
      true
    else
      self[position] = :X
      false
    end 
  end  

  def place_random_ships
    rando_ships = (@size * 0.25).round
    while self.num_ships < rando_ships
      rando_row = rand(0...@grid.length)
      rando_col = rand(0...@grid.length)
      pos = [rando_row, rando_col]
      self[pos] = :S
    end  
  end  

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele  
        end  
      end
    end  
  end 

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end  
  end  

  def cheat
    Board.print_grid(@grid)
  end  

  def print
    Board.print_grid(hidden_ships_grid)
  end  
end
