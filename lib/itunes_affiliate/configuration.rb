
module ItunesAffiliate
  class Configuration
      
      # An array of valid keys in the options hash when configuring
      VALID_OPTIONS_KEYS =[
        :linkshare_key,
        :linkshare_japan_key,
        :tradedoubler_key,
        :dgm_key].freeze
      
      DEFAULT_KEY = :linkshare_key
      DEFAULT_LINKSHARE_KEY = ''
      DEFAULT_LINKSHARE_JAPAN_KEY = ''
      DEFAULT_TRADEDOUBLE_KEY = ''
      DEFAULT_DGM_KEY = ''
            
      attr_accessor *VALID_OPTIONS_KEYS
       
      # When this module is extended, set all configuration options to their default values
      def self.extended(base)
        base.reset
      end
      
      # Convenience method to allow configuration options to be set in a block.
      def configure
        yield self
      end
      
      # Create a hash of options and their values.
      def options 
        options = {}
        VALID_OPTIONS_KEYS.each {|k| options[k] = send(k)}
        options
      end
      
      # Reset all configuration options to defaults
      def reset
        self.linkshare_key =DEFAULT_LINKSHARE_KEY
        self.linkshare_japan_key =DEFAULT_LINKSHARE_JAPAN_KEY
        self.tradedoubler_key =DEFAULT_TRADEDOUBLE_KEY
        self.dgm_key =DEFAULT_DGM_KEY
        
      end
    end
end
