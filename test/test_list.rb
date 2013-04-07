require 'helper'

describe 'working with lists' do
  let(:list) { Todo::List.new }
  let(:item1) { Todo::Item.new('foo') }
  let(:item2) { Todo::Item.new('bar') }

  it 'works' do
    assert_equal 0, list.size

    list << item1
    list << item2
    list << 'fizz'
    list << 'buzz'

    assert_equal 4, list.size
    assert_equal %w(foo bar fizz buzz), list.map(&:text)

    list.delete(item2)

    assert_equal 3, list.size
    assert_equal %w(foo fizz buzz), list.map(&:text)

    list.delete(1)

    assert_equal 2, list.size
    assert_equal %w(foo buzz), list.map(&:text)

    list.delete('buzz')

    assert_equal 1, list.size
    assert_equal %w(foo), list.map(&:text)
  end
end
