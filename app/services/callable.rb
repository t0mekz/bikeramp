module Callable
  def call(*args)
    new(*args).call
  end

  def async_call(*args)
    ServiceInvocationJob.perform_later(self.to_s, args)
  end
end
