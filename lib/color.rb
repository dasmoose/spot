module Spot
  module Color
    extend self

    CODES = {
      :reset   => "\e[0m",
      :cyan    => "\e[36m",
      :magenta => "\e[35m",
      :red     => "\e[31m",
      :yellow  => "\e[33m"
    }

   def colorize(string, color_code)
    "#{CODES[color_code] || color_code}#{string}#{CODES[:reset]}"
   end

  end
end
