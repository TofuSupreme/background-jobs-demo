class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args) # NOTE: The perform method naming method is absolute. Cannot change to 'perform_this' or anything else.

    puts "I'm starting a new job!"
    sleep 3
    puts "Okay, I'm done!"
    # Do something later
  end
end
