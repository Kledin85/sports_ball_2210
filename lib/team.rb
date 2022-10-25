class Team
  attr_reader :team_name, :city,
              :roster,    :player_count,
              :long_term_players,
              :short_term_players

  def initialize(team_name, city)
    @team_name = team_name
    @city = city
    @roster = []
    @player_count = 0
    @long_term_players = []
    @short_term_players = []
  end

  def add_player(player)
    @roster << player
    @player_count += 1
    if player.contract_length > 24
      @long_term_players << player
    else
      @short_term_players << player
    end
  end

  def total_value
    @roster.map do |player|
      player.total_cost
    end.sum
  end

  def average_cost_of_player
    @roster.map do |player|
      player.total_cost
    end.sum / @roster.length
  end

  def players_by_last_name
    last_names =  @roster.map do |player|
      player.last_name
    end
    last_names.sort { |a, b| a <=> b }
  end
end
