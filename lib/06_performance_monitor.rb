def measure n = 1
  time = Time.now
  n.times {yield}
  time = (Time.now - time) / n.to_f
end
