require_relative 'game'

def check_arguments(args)
  args.size == 3 && args[0].to_i && args[1].to_i > 0 && args[2].to_i > 0
end

if check_arguments(ARGV)
  @g = Game.new(ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i)
  @g.run
else
  puts 'ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*'
  puts '*seed* should be an integer'
  puts '*num_prospectors* should be a non-negative integer'
  puts '*num_turns* should be a non-negative integer'
  exit 0
end
