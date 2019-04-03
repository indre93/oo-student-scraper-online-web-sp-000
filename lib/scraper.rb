require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    scraped_students = []

    doc.css("div.student-card").each do |student|
      scraped_hash = {
        name: student.css(".student-name").text,
        location: student.css(".student-location").text,
        profile_url: student.css("a").attribute("href").value
      }
      scraped_students << scraped_hash
    end
    scraped_students
  end


  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))


    hash = {
      twitter: doc.css("img").attribute("src").value,
      linkedin: doc.css("a").attribute("href").value,
      github: doc.css("a").attribute("href").value,
      blog: doc.css("a").attribute("href").value,
      profile_quote: doc.css(".profile-quote").text,
      bio: doc.css("p").text
    }

    binding.pry
  end

end
