require "spot/version"
require "spotify"
require "color"

module Spot
  class Command
    class << self
      include Spot::Color
      def execute(*args)
        command = args.shift

        return help unless command

        return play           if command == 'play' || command == 'p'
        return pause          if command == 'pause' || command == 's'
        return next_track     if command == 'next' || command == 'n'
        return previous_track if command == 'previous' || command == 'b'
        return artist         if command == 'artist'
        return album          if command == 'album'
        return track          if command == 'song' || command == 'track'
        return shuffle        if command == 'shuffle'
        return repeat         if command == 'repeat'
        return quit           if command == 'quit'
        return start          if command == 'start'
        return help           if command == 'help'
        return current        if command == 'current'

        output "Command, #{command} not found"
        help
      end

      def play
        Spotify::Control.play
        current
      end

      def pause
        Spotify::Control.pause
        output "#{colorize("Spotify", :red)} is now paused"
      end

      def next_track
        Spotify::Control.next
        current
      end

      def previous_track
        Spotify::Control.previous
        current
      end

      def artist
        output "#{colorize("Spotify", :red)} is playing the artist #{colorize(Spotify::Control.current_artist, :cyan)}"
      end

      def album
        output "#{colorize("Spotify", :red)} is playing the album #{colorize(Spotify::Control.current_album, :magenta)}"
      end

      def track
        output "#{colorize("Spotify", :red)} is playing the song #{colorize(Spotify::Control.current_track, :yellow)}"
      end

      def shuffle
        Spotify::Control.shuffle
        output "#{colorize("Spotify", :red)} will now shuffle"
      end

      def repeat
        Spotify::Control.repeat
        output "#{colorize("Spotify", :red)} will now repeat"
      end

      def quit
        Spotify::Control.quit
        output "#{colorize("Spotify", :red)} will not quit. Bye!"
      end

      def start
        Spotify::Control.start
        output "#{colorize("Spotify", :red)} is starting up"
      end

      def current
        output "#{colorize("Spotify", :red)} is now playing #{colorize(Spotify::Control.current_track, :yellow)} by #{colorize(Spotify::Control.current_artist, :cyan)} on #{colorize(Spotify::Control.current_album, :magenta)}"
      end

      def help
        s = "Control Spotify with the following commands:"
        s << "\nstatus  # Shows the current status of Spotify"
        s << "\ncurrent # Shows the current song playing"
        s << "\nnext    # Goes to the next song (can also use n)"
        s << "\nprev    # Goes to the previous song (can also use b)"
        s << "\nartist  # Shows the artist of the current song"
        s << "\nalbum   # Shows the album of the current song"
        s << "\ntrack   # Shows the name of the current song"
        s << "\nshuffle # Starts shuffling the current list"
        s << "\nrepeat  # Starts repeating the current song"
        s << "\nquit    # Quits Spotify"
        s << "\nstart   # Starts Spotify"
        output s
      end

      def output(s)
        puts s.tr("\n","")
      end
    end
  end
end
