module Jekyll
  class LanguageLink < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "hi #{@text}"
    end
  end
end

Liquid::Template.register_tag('language_link', Jekyll::LanguageLink)