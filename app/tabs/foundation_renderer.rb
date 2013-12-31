class FoundationRenderer < Tabulous::DefaultRenderer
  def tabs_html
    <<-HTML.strip_heredoc
      <section class="top-bar-section">
        <ul class="left">
          #{ tab_list_html }
        </ul>
      </section>
    HTML
  end
end
