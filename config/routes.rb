Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'index' => 'book#index'
  get 'available' => 'book#available'
  get 'show/:id' => 'book#show'
  post 'create' => 'book#addBook'
  put 'update/:id' => 'book#updateBook'
  put 'borrow/:id' => 'book#borrowBook'
  put 'return/:id' => 'book#returnBook'
  delete 'delete/:id' => 'book#deleteBook'
end
