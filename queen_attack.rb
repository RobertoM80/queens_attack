class Queens
  def initialize hash={}
    @position = hash
    raise ArgumentError, "You cannot occupy same spaces..." if (@position.values.flatten.uniq.length == 2 && @position.values[0][0] == @position.values[1][0])
  end

  def white
    @position.length != 0 ? @position[:white] : [0, 3]
  end

  def black
    @position.length != 0 ? @position[:black] : [7, 3]
  end

  def to_s
      line_zer = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_one = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_two = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_tre = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_fou = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_fiv = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_six = ["_", "_", "_", "_", "_", "_", "_", "_"]
      line_sev = ["_", "_", "_", "_", "_", "_", "_", "_"]

      board_arr = [line_zer, line_one, line_two, line_tre, line_fou, line_fiv, line_six, line_sev]
      
      board_arr[white[0]].delete_at(white[1])
      board_arr[white[0]] = board_arr[white[0]].insert(white[1], "W")
      
      board_arr[black[0]].delete_at(black[1])
      board_arr[black[0]] = board_arr[black[0]].insert(black[1], "B")

      board = ""
      board_arr.each do |arr|
        arr.each do |el|
          board << (el + " ")  
        end
        board << "\n"
      end

      board = board.split(" \n").join("\n")
  end

  def is_diagonal?
    valid_coordinates = []
    for i in 0..7
      valid_coordinates << [white[0]+ i, white[1]+ i]
      valid_coordinates << [white[0]- i, white[1]- i]
      valid_coordinates << [white[0]+ i, white[1]- i]
      valid_coordinates << [white[0]- i, white[1]+ i]
    end

    if valid_coordinates.include?(black)
      true
    else
      false
    end
  end

  def attack?
    if (white[0] == black[0]) || (white[1] == black[1])
      true
    elsif is_diagonal?
      true
    else
      false
    end
  end
end