require "test_helper"

class ActionDispatch::Http::ContentDispositionTest < Minitest::Test
  include Capybara::DSL

  def test_encoding_a_latin_filename
    Thread.current[:filename] = "racecar.jpg"
    assert_content_disposition %(attachment; filename="racecar.jpg"; filename*=UTF-8''racecar.jpg)
  end

  def test_encoding_a_latin_filename_with_accented_characters
    Thread.current[:filename] = "råcëçâr.jpg"
    assert_content_disposition %(attachment; filename="racecar.jpg"; filename*=UTF-8''r%C3%A5c%C3%AB%C3%A7%C3%A2r.jpg)
  end

  def test_encoding_a_non_latin_filename
    Thread.current[:filename] = "автомобиль.jpg"
    assert_content_disposition %(attachment; filename="%3F%3F%3F%3F%3F%3F%3F%3F%3F%3F.jpg"; filename*=UTF-8''%D0%B0%D0%B2%D1%82%D0%BE%D0%BC%D0%BE%D0%B1%D0%B8%D0%BB%D1%8C.jpg)
  end

  def assert_content_disposition(expected)
    ["/via_send_data", "/via_send_file", "/via_send_data_api", "/via_send_file_api"].each do |path|
      next if path.end_with?("_api") && !defined? ActionController::API

      visit path
      assert_equal 200, status_code
      assert_equal expected, response_headers["Content-Disposition"]
    end
  end
end
