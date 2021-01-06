module Api
    module V1
        class ArticlesController < ApplicationController

            #Listar todos os artigos
            def index
                articles = Article.order('created_at DESC');
                render json: { status: 'SUCCESS', message: 'Loaded articles', data: articles }, status: :ok
            end

            #Listar artigo passando o ID
            def show
                article = Article.find(params[:id])
                render json: { status: 'SUCCESS', message: 'Loaded article', data: article }, status: :ok
            end

            #Criar um novo artigo
            def create
                article = Article.new(article_params)
                if article.save
                    render json: {status: 'SUCCESS', message: 'The Article has been saved', data: article}, status: :ok
                else
                    render json: {status: 'ERROR', message: "The Article couldn't be saved", data: article.error}, status: :unprocessable_entity
                end
            end
            
            # Parâmetros aceitos
            private

            def article_params
                params.permit(:title, :body)
            end
        end
    end
end