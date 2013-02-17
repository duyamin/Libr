require 'spec_helper'

describe BookInstance do
  before(:each) do
    @book = Book.create!(name: 'test', isbn: '1787563353424', image: 'http://img3.douban.com/mpic/s13657833.jpg')
    @user = User.create!(name: 'Tony')
    @instance = BookInstance.create!(book_id: @book.id, user_id: @user.id)
  end

  it :borrowed? do
    @instance.should_not == nil
    @instance.borrowed?.should == false
  end

  it 'ensure when someone borrowed this book,borrowed? should return true' do
    @user.borrow @book
    @instance.borrowed?.should == true
  end

end
