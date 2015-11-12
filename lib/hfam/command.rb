Dir.glob("./lib/hfam/command/*").each  { |command| require command }
Dir.glob("./lib/hfam/commands/*").each { |command| require command }