class InsertInitialGenres < ActiveRecord::Migration[6.1]
  def up
    genres = [
      {
        parameter: "Basic",
        title: "Basic",
        color: "#007bff"
      },
      {
        parameter: "Git",
        title: "Git",
        color: "#343a40"
      },
      {
        parameter: "Ruby",
        title: "Ruby",
        color: "#dc3545"
      },
      {
        parameter: "Ruby on Rails",
        title: "Ruby on Rails",
        color: "#dc3545"
      },
      {
        parameter: "Php",
        title: "PHP",
        color: "#6f42c1"
      },
      {
        parameter: "AWS",
        title: "AWS",
        color: "#ec7211"
      }
    ]

    Genre.create!(genres)
  end
end
