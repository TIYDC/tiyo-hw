require_relative "tiyo_hw/version"
require_relative "tiyo_hw/run"
require_relative "tiyo_hw/setup"
require "active_support/core_ext/string"
module TiyoHw
  SLEEP_TIME = 4
  HOMEWORK_DIR = "~/theironyard/homework".freeze
  EDITOR = "atom".freeze

  def self.generate_cmd(command, url_or_path = nil)
    return fail_msg("Please enter a valid URL: #{url_or_path.inspect} is not a valid url ") if url_or_path.to_s.blank?

    case command
    when "setup"
      Setup.new(url_or_path).cmd
    when "run"
      Run.new(url_or_path).cmd
    when "cmd"
      ShellFunction.cmd
    end
  end

  def self.fail_msg(msg)
    "echo '#{msg}'"
  end
end