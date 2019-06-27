# frozen_string_literal: true

file = ARGV[0]
mode = ARGV[1]&.to_sym || :full
valid_modes = %i[full separate major minor patch]
exit "#{mode} is not a valid mode. Supported: #{valid_modes}" unless valid_modes.include? mode

atomic = File.read(file)
             .match(/SET_PROJECT_VERSION\(([\d]* [\d]* [\d]*)\)/)
             .captures.first.split(' ')

puts case mode
     when :full
       atomic.join('.')
     when :separate
       atomic
     when :major
       atomic.first
     when :minor
       atomic[1]
     when :patch
       atomic.last
     else # default to semver string
       atomic.join('.')
     end
