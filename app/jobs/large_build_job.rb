class LargeBuildJob < ApplicationJob
  include Buildable

  queue_as :medium
end
