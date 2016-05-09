module ApplicationHelper
  def omniauth_provider_name(provider)
    if provider == :google_oauth2
      "Google"
    else
      OmniAuth::Utils.camelize(provider)
    end
  end

  def flash_to_bootstrap_classname(name)
    "alert-" + case name
      when "notice"
        "info"
      when "alert"
        "warning"
      when "error"
        "danger"
      else
        name
      end
  end
end
