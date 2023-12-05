class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        # turbo_stream.append :comments, partial: 'comments/comment', locals: { comment: @comment }
        # ActionCable.server.broadcast 'comment_channel', {comment: @comment.as_json} 
        # CommentsMailer.submitted(@comment).deliver_later
        redirect_to article_path(@article)
      end
    
      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
      end

      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
