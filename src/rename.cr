class Rename
  @class_name = ""
  @file_name = ""
  @display_name = ""

  def class_name(name)
    name.camelcase
  end

  def file_name(name)
    name.underscore
  end

  def display_name(name)
    file_name(name).gsub('_', ' ').titleize
  end

  def name_prompt
    print "Rename GameSFTemplate class to: "

    input = (gets || "")
    input = "GameExample" if input.blank?
    name = input.squeeze(' ').gsub(' ', '_')

    @class_name = class_name(name)
    @file_name = file_name(name)
    @display_name = display_name(name)

    name_prompt_custom unless name_values_okay?
  end

  def name_values_okay?
    puts "Are these okay?"
    puts "class: #{@class_name}"
    puts "directory/file: #{@file_name}"
    puts "display: #{@display_name}"
    print "Are these okay? y/n: "

    answer = gets || ""

    answer.downcase == "y"
  end

  def name_prompt_custom
    puts "Okay, lets go custom, one by one"
    print "Rename GameSFTemplate class to: "

    @class_name = gets || ""

    print "Rename game_sf_template directory/file to: "

    @file_name = gets || ""

    print "Rename Game SF Template display to: "

    @display_name = gets || ""

    name_prompt_custom unless name_values_okay?
  end

  def replace
    puts "Replacing files and folders..."
  end

  def run
    name_prompt

    replace
  end
end

Rename.new.run
