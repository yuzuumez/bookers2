class BooksController < ApplicationController



 # 投稿データの保存
  def create
    @books=Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @user=current_user
    render :index
    end
  end

  def index
     @book=Book.new
     @user=current_user
     @books=Book.all
  end

  def show
     @user=current_user
    @book=Book.find(params[:id])
  end

#投稿データの削除 books_pathで一覧画面に遷移したい
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    
    if @book.user == current_user
    render "edit"
    else
    redirect_to books_path
    end
  end
    
  def update
    @book= Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), alert: "Book was successfully updated."
    else
    render :edit
    end
  end


    # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  

  
end

