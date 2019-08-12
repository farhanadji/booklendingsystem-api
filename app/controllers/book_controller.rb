class BookController < ApplicationController

    def index
        @book = Book.all
        render json: {
            message: "success",
            total: @book.size,
            values: @book
        }, status: 200
    end

    def available
        @book = Book.where(:availability => true)
        render json: {
            message: 'success',
            total: @book.size,
            values: @book
        }, status: 200
    end

    def show
        @book = Book.find_by_id(params[:id])
        if @book.present?
            render json: {
                message: 'success',
                values: @book
            }, status: 200
        else
            render json: {
                message: 'Sorry, book not found!',
            }, status: 400
        end
    end

    def book_params
        params.permit(:title, :author, :price)
    end

    def addBook
        @book = Book.new(book_params)
        @book.availability = true
        if @book.save
            render json: {
                message: 'success',
                values: @book,
            }, status: 200
            else
                render json: {
                    message: 'Sorry, Failed to add new book!'
                },status: 400
        end
    end

    def updateBook
        @book = Book.find(params[:id])

        if @book.update(book_params)
            render json: {
                message: 'success',
                values: @book
            }, status: 200
        else
            render json: {
                message: 'Sorry,Update Book Failed!'
            }, status: 400
        end
    end

    def deleteBook
        @book = Book.find(params[:id])
        if @book.destroy
            render json: {
                message: 'book deleted succesfully'
            }, status: 200
        else
            render json: {
                message: 'Sorry, Delete Book Failed!'
            }, status: 400
        end
    end

    def borrowBook
        @book = Book.find(params[:id])
        
        if @book.availability == true
            if @book.update(availability: false)
               render json: {
                    message: 'Borrow Book Successfully',
                    values: @book.as_json(:except => [:availability, :created_at, :updated_at])
                }, status: 200
            else
                render json: {
                    message: 'Sorry,Borrow Book Failed!'
                }, status: 400
            end
        else
            render json: {
                message: 'Sorry, You Cannot Borrow Unavailable Book'
            }
        end
    end

    def returnBook
        @book = Book.find(params[:id])

        if @book.availability == false
            if @book.update(availability: true)
                render json: {
                    message: 'Return Book Successfully',
                    values: @book.as_json(:except => [:availability, :created_at, :updated_at])
                }, status: 200 
            else
                render json: {
                    message: 'Sorry, Delete Book Failed!'
                }, status: 400
            end
        else
            render json: {
                message: 'Sorry, You Cannot Return Available Book'
            }
        end
    end
end
