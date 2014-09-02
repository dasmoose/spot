module Spotify
  class Control
    class << self
      def status
        `osascript -e 'tell application "Spotify" to player state as string'`
      end

      def current_artist
        `osascript -e 'tell application "Spotify" to artist of current track as string'`
      end

      def current_track
        `osascript -e 'tell application "Spotify" to name of current track as string'`
      end

      def current_album
        `osascript -e 'tell application "Spotify" to album of current track as string'`
      end

      def current_album_art
        `osascript -e 'tell application "Spotify" to artwork of current track as string'`
      end

      def play
        `osascript -e 'tell application "Spotify" to play'`
      end

      def pause
        `osascript -e 'tell application "Spotify" to pause'`
      end

      def next
        `osascript -e 'tell application "Spotify" to next track'`
      end

      def previous
        `osascript -e 'tell application "Spotify" to previous track'`
      end

      def shuffle
        `osascript -e 'tell application "Spotify" to shuffling'`
      end

      def repeat
        `osascript -e 'tell application "Spotify" to repeating'`
      end

      def quit
        `osascript -e 'tell application "Spotify" to quit'`
      end

      def start
        `osascript -e 'tell application "Spotify" to launch'`
      end
    end
  end
end
