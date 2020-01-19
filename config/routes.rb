Rails.application.routes.draw do
  root 'guest_book#index'

  post   'guest_book/sign'
  delete 'guest_book/destroy/:id', to: 'guest_book#destroy', as: 'destroy'
  get    'guest_book/wipe',        to: 'guest_book#wipe',    as: 'wipe_book'
end
