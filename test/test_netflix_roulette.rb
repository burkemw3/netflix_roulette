require "test_helper"

class NetflixRouletteTest < Test::Unit::TestCase
  
  def test_get_version
    assert_equal "5.0", NetflixRoulette.get_version
  end
  
  def test_get_media_rating_found
    assert_equal "4.5", NetflixRoulette.get_media_rating("Breaking Bad")
  end
  
  def test_get_media_rating_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_rating("Breaking Bad", 2020)
  end

  def test_get_media_poster_found
    assert_equal "http://netflixroulette.net/api/posters/70143836.jpg", NetflixRoulette.get_media_poster("Breaking Bad")
  end
  
  def test_get_media_poster_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_poster("Breaking Bad", 2020)
  end
  
  def test_get_media_type_found
    assert_equal 1, NetflixRoulette.get_media_type("Breaking Bad")
  end
  
  def test_get_media_type_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_type("Breaking Bad", 2020)
  end
  
  def test_get_media_release_year_found
    assert_equal "2008", NetflixRoulette.get_media_release_year("Breaking Bad")
  end
  
  def test_get_media_release_year_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_release_year("Breaking Bad", 2020)
  end
  
  def test_get_media_cast_found
    assert_equal "Bryan Cranston, Anna Gunn, Aaron Paul, Betsy Brandt, R.J. Mitte, Dean Norris, Bob Odenkirk, Steven Michael Quezada, Jonathan Banks, Giancarlo Esposito", NetflixRoulette.get_media_cast("Breaking Bad")
  end
  
  def test_get_media_cast_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_cast("Breaking Bad", 2020)
  end
  
  def test_get_media_category_found
    assert_equal "TV Shows", NetflixRoulette.get_media_category("Breaking Bad")
  end
  
  def test_get_media_category_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_category("Breaking Bad", 2020)
  end
  
  def test_get_media_summary_found
    assert_equal "Emmy winner Bryan Cranston stars as Walter White, a high school science teacher who learns that he has terminal lung cancer and teams with a former student to manufacture and sell high-quality crystal meth to secure his family's future.", NetflixRoulette.get_media_summary("Breaking Bad")
  end
  
  def test_get_media_summary_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_summary("Breaking Bad", 2020)
  end
  
  def test_get_media_director_found
    assert_equal "", NetflixRoulette.get_media_director("Breaking Bad")
  end
  
  def test_get_media_director_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_media_director("Breaking Bad", 2020)
  end
  
  def test_get_netflix_id_found
    assert_equal 70143836, NetflixRoulette.get_netflix_id("Breaking Bad")
  end
  
  def test_get_netflix_id_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_netflix_id("Breaking Bad", 2020)
  end
  
  def test_get_runtime_found
    assert_equal "45 min", NetflixRoulette.get_runtime("Breaking Bad")
  end
  
  def test_get_runtime_not_found
    assert_equal "Unable to locate data", NetflixRoulette.get_runtime("Breaking Bad", 2020)
  end
  
  def test_get_all_data_found
    assert_equal(
      {
        "unit"        => 7968,
        "show_id"     => 70143836,
        "show_title"  => "Breaking Bad",
        "release_year"=> "2008",
        "rating"      => "4.5",
        "category"    => "TV Shows",
        "show_cast"   => "Bryan Cranston, Anna Gunn, Aaron Paul, Betsy Brandt, R.J. Mitte, Dean Norris, Bob Odenkirk, Steven Michael Quezada, Jonathan Banks, Giancarlo Esposito",
        "director"    => "",
        "summary"     => "Emmy winner Bryan Cranston stars as Walter White, a high school science teacher who learns that he has terminal lung cancer and teams with a former student to manufacture and sell high-quality crystal meth to secure his family's future.",
        "poster"      => "http://netflixroulette.net/api/posters/70143836.jpg",
        "mediatype"   => 1,
        "runtime"     => "45 min"
      },
      NetflixRoulette.get_all_data("Breaking Bad")
    )
  end
  
  def test_get_media_for_actor
    assert_block do
      NetflixRoulette.get_media_for_actor("Nicolas Cage").all? do |media|
        media["show_cast"] =~ /Nicolas Cage/
      end
    end
  end
  
  def test_get_media_for_director
    assert_block do
      NetflixRoulette.get_media_for_director("Quentin Tarantino").all? do |media|
        media["director"] =~ /Quentin Tarantino/
      end
    end
  end
  
  class NetflixRoulette::ClientTest < Test::Unit::TestCase
    def test_version
      assert_equal "5.0", NetflixRoulette::Client.new.version
    end
  end
end