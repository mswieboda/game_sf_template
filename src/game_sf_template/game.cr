require "./stage"

module GameSFTemplate
  class Game < GSF::Game
    getter manager

    def initialize
      super(title: "game_sf_template")

      @stage = Stage.new(window)
    end
  end
end
