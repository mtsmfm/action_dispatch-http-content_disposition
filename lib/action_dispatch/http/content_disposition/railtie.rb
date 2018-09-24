patch = Module.new do
  private

  %i[send_data send_file].each do |m|
    define_method(m) do |data_or_path, options = {}|
      disposition = options.fetch(:disposition, ActionController::DataStreaming::DEFAULT_SEND_FILE_DISPOSITION)

      if disposition
        headers["Content-Disposition"] = ActionDispatch::Http::ContentDisposition.format(disposition: disposition, filename: options[:filename])
      end

      super(data_or_path, options.merge(disposition: nil))
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  require "action_dispatch/http/content_disposition"

  ActionController::Base.prepend(patch)
  ActionController::API.prepend(patch) if defined? ActionController::API
end
