require 'test_helper'

class CareerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid career" do
    career = Career.new(
      name: "Ingenieria de Software",
      description: "Lorem Ipsum dolor sit amet, consectetur adipiscing elit",
      study_plan: "meya"
    )

    assert career.valid? 
  end

  test "invalid without name" do
    career = Career.new(name: "", description: "Lorem Ipsum dolor sit amet, consectetur adipiscing elit", study_plan: "mefi")
    
    refute career.valid?, "career is valid without a name"
    assert_not_nil career.errors[:name], "no validations error for name present"
  end

  test "invalid without study plan" do
    career = Career.new(name: "Ingenieria de Software", description: "Lorem Ipsum dolor sit amet, consectetur adipiscing elit", study_plan: "")

    refute career.valid?, "career is valid without study plan"
    assert_not_nil career.errors[:study_plan], "no validations error for study plan present"
  end
end
