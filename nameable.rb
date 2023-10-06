class Nameable
  def correct_name
    raise NotImplementedError, " has not implemented method '#{__method__}'"
  end
end
