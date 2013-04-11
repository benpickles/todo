require 'helper'

describe 'executable integration' do
  let(:bin_path) { File.expand_path('../../bin/todo', __FILE__) }
  let(:lib_path) { File.expand_path('../../lib', __FILE__) }
  let(:tmpdir) { Dir.mktmpdir }

  after do
    FileUtils.remove_entry_secure(tmpdir)
  end

  def todo(args = '')
    command = "ruby -I#{lib_path} #{bin_path} #{args}"

    Open3.capture3(command, { chdir: tmpdir }).tap do |_, err, status|
      assert status.success?, "command failed:\n#{err}"
    end
  end

  it 'works' do
    stdout, stderr = todo

    assert_equal '', stdout
    assert_equal '', stderr

    todo('foo')
    todo('bar')

    stdout, stderr = todo

    assert_equal "foo\nbar\n", stdout
    assert_equal '', stderr

    todo('-d0')

    stdout, stderr = todo

    assert_equal "bar\n", stdout
    assert_equal '', stderr
  end
end
