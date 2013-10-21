require 'helper'

describe 'executable integration' do
  let(:bin_path) { File.expand_path('../../bin/todo', __FILE__) }
  let(:lib_path) { File.expand_path('../../lib', __FILE__) }
  let(:tmpdir) { Dir.mktmpdir }

  after do
    FileUtils.remove_entry_secure(tmpdir)
  end

  def todo(args = '')
    Dir.chdir tmpdir do
      capture_subprocess_io do
        system "ruby -I#{lib_path} #{bin_path} #{args}"
      end
    end
  end

  it 'works' do
    stdout, stderr = todo

    assert_equal '', stdout
    assert_equal '', stderr

    todo('foo')
    todo('bar')

    stdout, stderr = todo

    assert_equal "1. foo\n2. bar\n", stdout
    assert_equal '', stderr

    todo('-d1')

    stdout, stderr = todo

    assert_equal "1. bar\n", stdout
    assert_equal '', stderr
  end
end
