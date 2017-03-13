module More
    def more(post, type)
        if (post and post.include?("<!--more-->"))
            if type == "summary"
                return post.split("<!--more-->").first
            elsif type == "remaining"
                return post.split("<!--more-->").last
            end
        end
        return post
    end

    def post_contains_summary(post)
        if (!post)
          return false
        end
        return post.include?("<!--more-->")
    end
end

Liquid::Template.register_filter(More)
