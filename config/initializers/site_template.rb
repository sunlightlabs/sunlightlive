# Create a site template if one doesn't exist.
unless SiteTemplate.first
  template_text = <<-EOT.strip_heredoc
  <html>
    <head>
      <title>Your Datajam Site</title>
      {{{ head_assets }}}
    </head>

    <body>
      <h1>Site Header</h1>
      {{{ content }}}
      {{{ body_assets }}}
    </body>

  </html>
  EOT
  SiteTemplate.create!(name: 'Site', template: template_text)
end
