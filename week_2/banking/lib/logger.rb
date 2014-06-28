module Logger
  def log(message)
    output = "#{Time.now} : #{message}"
    File.open("log.txt", "a") do |logfile|
      logfile << output
    end
  end
end
