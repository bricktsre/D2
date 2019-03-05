# Class to check arguments of ruby_rush
class Check
  def check_arguments(args)
    args.size == 3 && args[0].to_i && args[1].to_i > 0 && args[2].to_i > 0
  end
end
