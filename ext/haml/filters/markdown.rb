require 'haml'
require 'redcarpet'
require './ext/rouge.rb'


module Haml::Filters
  remove_filter("Markdown") #remove the existing Markdown filter

  module Markdown # the contents of this are as before, but without the lazy_require call
    include Haml::Filters::Base


    def render(text)
      markdown.render(text)
    end


    private

      def markdown
        @markdown ||= Redcarpet::Markdown.new(renderer, extensions)
      end

      def renderer
        @renderer ||= Ext::RougeRenderer.new(render_options)
      end

      def render_options
        {
            filter_html: true,
            hard_wrap: true,
            no_styles: true,
            prettify: true,
            safe_links_only: true,
            with_toc_data: false
        }
      end

      def extensions
        {
            autolink: true,
            fenced_code_blocks: true,
            disable_indented_code_blocks: true,
            footnotes: false,
            highlight: true,
            no_images: true,
            no_intra_emphasis: true,
            quote: true,
            space_after_headers: false,
            strikethrough: true,
            superscript: true,
            tables: true,
            underline: true
        }
      end
  end
end
