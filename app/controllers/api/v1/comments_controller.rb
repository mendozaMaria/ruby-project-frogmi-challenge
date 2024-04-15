# app/controllers/api/v1/comments_controller.rb
module Api
  module V1
    class CommentsController < ApplicationController
      def create
        @earthquake = Earthquake.find(params[:earthquake_id])
        @comment = @earthquake.comments.new(comment_params)
      
        if @comment.save
          render json: @earthquake, include: :comments, status: :created
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end
      def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
          render json: @comment, status: :ok
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        earthquake = Earthquake.find(params[:earthquake_id])
        comments = earthquake.comments
        render json: comments, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Earthquake not found' }, status: :not_found
      end

      private

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end

