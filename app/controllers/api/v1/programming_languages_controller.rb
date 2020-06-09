module Api
  module V1
    class ProgrammingLanguagesController < ApplicationController

      def index
          render json: ProgrammingLanguage.all
      end

      def show
        render json: programming_language.find(params[:id])
      end

      def create
        programming_language = ProgrammingLanguage.new(programming_language_params)

        if programming_language.save # happy path
          render json: programming_language, status: :created # 201
        else # Failure path
          render json: {erros: programming_language.full_messagens}, status: :bad_request # 400
        end
      end

      def update
        programming_language = ProgrammingLanguage.find(params[:id])

        if programming_language.update(programming_language_params)
          render json: programming_language, status: :accepted # 202
        else 
          render json: {erros: programming_language.full_messagens}, status: :bad_request # 400
        end
      end

      def destroy
        programming_language = ProgrammingLanguage.find(params[:id])

        if programming_language.destroy
          render json: programming_language, status: :accepted # 202
        else 
          render json: {erros: programming_language.full_messagens}, status: :bad_request # 400
        end
      end

      private

      def programming_language_params
        params.require(:programming_language)
        .permit(:name, :creator, :release_year)
      end

    end
  end
end