module Day2
    extend self 
    
    def read_input(input : String)
        reports = Array(Array(Int32)).new
        input.chomp.split("\n").each do |line|
          numbers = line.split(" ")
          reports.push(numbers.map{ |n| n.to_i })
        end
        reports
    end

    def build_offsets(list)
        offsets = list.map_with_index do |val, i|
          if i == 0
            0
          else
            val - list[i-1]
          end
        end
        offsets.shift
        offsets
    end

    def find_unsafe_condition(offsets : Array(Int32))
      offsets.each_with_index do |val, i|
        return i if val == 0
        return i if val.abs() > 3
        if i > 0
          return i if (val <=> 0) != (offsets[i-1] <=> 0)
        end
      end
      nil
    end

    def part1(input : String)
      reports = read_input(input)
      valid = reports.select do |report|
        find_unsafe_condition(build_offsets(report)) == nil
      end

      valid.size
    end

    def part2(input : String)
      reports = read_input(input)
      valid = reports.select do |report|
        offset = build_offsets(report)

        unsafe_condition = find_unsafe_condition(offset)
        if unsafe_condition == nil
          true
        else
          pos = unsafe_condition.as(Int32)
          pre = report.clone
          pre.delete_at(pos - 1)
          pre_offsets = build_offsets(pre)

          cur = report.clone
          cur.delete_at(pos)
          cur_offsets = build_offsets(cur)

          nxt = report.clone
          nxt.delete_at(pos + 1)
          nxt_offsets = build_offsets(nxt)

          if [pre_offsets, cur_offsets, nxt_offsets]
            .map{|o| find_unsafe_condition(o)}
            .any? {|res| res == nil}
            true
          else
            false
          end
        end
      end

      valid.size
    end
end