# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, instance|
  if html_tag =~ /^<label/
    html_tag.to_s.html_safe
  else
    %(<div class="has-error">#{html_tag}<span class="help-block">#{instance.error_message.first}</span></div>).html_safe
  end
end
