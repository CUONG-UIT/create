class CommentsController < ApplicationController
  http_basic_authenticate_with name: "phan" ,password: "2" ,only: :destroy

  #method allow action when you was assign

  def create
      @article = Article.find(params[:article_id]) #@article will association between article and
      # comment through artitcle_id
      @comment = @article.comments.create(comment_params) #We use the create method on @article.comments
       # to create and save comment.

      redirect_to article_path(@article)# call show action on article

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter , :body)
  end
end
