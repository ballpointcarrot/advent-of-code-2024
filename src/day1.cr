module Day1
    extend self 
    
    def read_input(input : String)
        col1 = [] of Int32
        col2 = [] of Int32
        input.split("\n").each do |line|
          number_matches = /(\d+)\s+(\d+)/.match(line)
          if number_matches
            col1.push(number_matches[1].to_i)
            col2.push(number_matches[2].to_i)
          end
        end
        [col1, col2]
    end

    def part1(input : String)
      first_group, second_group = read_input(input)
      first_group.sort!
      second_group.sort!
      first_group.map_with_index{|num, idx| (num-second_group[idx]).abs() }.sum()
    end

    def part2(input : String)
      first_group, second_group = read_input(input)
      second_group_tally = second_group.tally()
      first_group.reduce(0) do |memo, num|
        if second_group_tally.has_key?(num)
            memo + num * second_group_tally[num]
        else
            memo
        end
      end
    end
end