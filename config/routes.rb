Rails.application.routes.draw do
  root to: proc { Driver.count; [200, {}, ['API is up and running.']] }

  # Use standard Rails routing syntax below
end
