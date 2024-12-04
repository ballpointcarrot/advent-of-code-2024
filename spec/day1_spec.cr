require "./spec_helper"

describe Day1 do
  input = "3   4
4   3
2   5
1   3
3   9
3   3"

  describe "read_input" do
    it "returns two lists" do
        Day1.read_input(input).should eq([
          [3, 4, 2, 1, 3, 3],
          [4, 3, 5, 3, 9, 3]
        ])
    end
  end
  describe "part1" do
    it "satisfies the base example for part 1" do
        Day1.part1(input).should eq(11)
    end
    it "runs the full dataset for part 1" do
        Day1.part1(File.new("./input/day1.txt").gets_to_end).should eq(2264607)
    end
  end 

  describe "part2" do
    it "satisfies the base example for part 1" do
        Day1.part2(input).should eq(31)
    end
    it "runs the full dataset for part 2" do
        result = Day1.part2(File.new("./input/day1.txt").gets_to_end)
        puts "result: #{result}"
        result.should eq(19457120)
    end
  end
end