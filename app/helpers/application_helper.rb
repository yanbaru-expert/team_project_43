module ApplicationHelper

  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(':')[0] if language.present?
        case language.to_s
        when 'rb'
            lang = :ruby
        when 'yml'
            lang = :yaml
        when 'css'
            lang = :css
        when 'html'
            lang = :html
        when ''
            lang = :md
        else
            lang = language
        end
        CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" }
    )
    options = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text).html_safe
  end

  def max_width
    if devise_controller? || controller.controller_name == "lines"
      "mw-md"
    else
      "mw-xl"
    end
  end

  def bg_color
    if controller.controller_name == "lines"
      "bg-success"
    else
      "bg-primary"
    end
  end

  def title_name
    if params[:genre] == nil
      "Ruby/Railsテキスト教材"
    else
      "PHPテキスト教材"
    end
  end

  def movie_title
    if params[:genre] == nil
      "Ruby/Rails動画教材"
    else
      "PHP動画教材"
    end
  end
end
