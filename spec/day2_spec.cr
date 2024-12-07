require "./spec_helper"

describe Day2 do
  input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

  describe "read_input" do
    it "returns six arrays" do
      reports = Day2.read_input(input)
      reports.size().should eq(6)
    end

    it "has a report with five numbers" do
      reports = Day2.read_input(input)
      reports[0].should eq([7,6,4,2,1])
    end
  end

  describe "part1" do
    it "satisfies the base example for part 1" do
        Day2.part1(input).should eq(2)
    end
    it "runs the full dataset for part 1" do
        Day2.part1(File.new("./input/day2.txt").gets_to_end).should eq(314)
    end
  end 

  describe "part2" do
    it "satisfies the base example for part 2" do
        Day2.part2(input).should eq(4)
    end
    it "runs the full dataset for part 2" do
        result = Day2.part2(File.new("./input/day2.txt").gets_to_end)
        result.should eq(373)
    end
  end
end