class MDHtml
    attr_accessor :indents, :html_data
    SELF_CLOSING_TAGS = %i(area base br col embed iframe hr img input link meta param source track wbr command keygen menuitem)

    def initialize(&block)
        @indents = 0
        @html_data = ""
        instance_eval(&block)
    end

    def to_s
        @html_data
    end
  
    def method_missing(html_tag, *args, &block)
        tag(html_tag, args, &block)
    end

    private

    def tag(html_tag, args, &block)
        content = find_content(args)
        options = html_options(find_options(args))

        if(html_tag.to_s == "html") 
            @html_data << "<!doctype html>"
        end

        @html_data << "\n#{indent}<#{html_tag}#{options}"
        
        if SELF_CLOSING_TAGS.member?(html_tag)
            @html_data << '/>'
            return
        else
            @html_data << ">"
        end

        @html_data << "#{content}"

        if block_given?
            @indents += 1
            instance_eval(&block)
            @indents -= 1
            @html_data << "\n#{indent}"
        end

        unless SELF_CLOSING_TAGS.member?(html_tag)
            @html_data << "</#{html_tag}>"
        end
    end
  
    def find_content(args)
      args.detect{|arg| arg.is_a?(String)}
    end
  
    def find_options(args)
      args.detect{|arg| arg.is_a?(Hash)} || {}
    end
    def html_options(options)
        options.collect{|key, value|
          value = value.to_s.gsub('"', '\"')
          " #{key}=\"#{value}\""
        }.join("")
    end
  
    def indent
      "  " * indents
    end

end

output = MDHtml.new do
    html do
        head do
            meta charset: "utf-8"
            title "The HTML5 Template"
            meta description: "The HTML5 Template"
            
            meta author: "MobiDev"
            link stylesheet: "css/styles.css?v=1.0"
        end
            
        body do
            div do
                span "Hello World"
            end
            script src:"js/scripts.js"
        end
    end
end
puts(output.to_s)