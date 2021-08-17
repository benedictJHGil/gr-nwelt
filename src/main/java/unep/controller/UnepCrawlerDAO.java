// package unep.controller;
//
// import java.util.ArrayList;
// import java.util.List;
//
// import org.jsoup.Jsoup;
// import org.jsoup.nodes.Document;
// import org.jsoup.nodes.Element;
// import org.jsoup.select.Elements;
//
// public class UnepCrawlerDAO {
//
// 	private String UrlOfAfrica, UrlOfAsia, UrlOfEurope, UrlOfAmerica;
// 	private Document docOfAfrica, docOfAsia, docOfEurope, docOfAmerica;
// 	private Elements eleOfAfrica, eleOfAsia, eleOfEurope, eleOfAmerica;
//
// 	public UnepCrawlerDAO()
// 	{
// 		try
// 		{
// 			UrlOfAfrica = "https://www.unep.org/resources?f%5B0%5D=region%3A61";
// 			UrlOfAsia = "https://www.unep.org/resources?f%5B0%5D=region%3A62&f%5B1%5D=region%3A66";
// 			UrlOfEurope = "https://www.unep.org/resources?f%5B0%5D=region%3A63";
// 			UrlOfAmerica = "https://www.unep.org/resources?f%5B0%5D=region%3A64&f%5B1%5D=region%3A65";
//
// 			// docOfAfrica = null; docOfAsia = null; docOfEurope = null; docOfAmerica = null;
//
// 			docOfAfrica = Jsoup.connect(UrlOfAfrica).userAgent("Mozilla/5.0").get();
// 			docOfAsia = Jsoup.connect(UrlOfAsia).userAgent("Mozilla/5.0").get();
// 			docOfEurope = Jsoup.connect(UrlOfEurope).userAgent("Mozilla/5.0").get();
// 			docOfAmerica = Jsoup.connect(UrlOfAmerica).userAgent("Mozilla/5.0").get();
//
// 			eleOfAfrica = docOfAfrica.select("div.result_items");
// 			eleOfAsia = docOfAsia.select("div.result_items");
// 			eleOfEurope = docOfEurope.select("div.result_items");
// 			eleOfAmerica = docOfAmerica.select("div.result_items");
// 		}
//
// 		catch (Exception e)
// 		{
// 			e.printStackTrace();
// 		}
// 	}
//
// 	public List<UnepVO> listTitleAndLink()
// 	{
// 		List<UnepVO> titlesAndlinkslist = new ArrayList<UnepVO>();
//
// 		try
// 		{
// 			int no = 0;
// 			for (Element e : eleOfAfrica.select("div.views-field.views-field-nothing"))
// 			{
// 				no++;
// 				String continent = "africa";
// 				String title = e.select("div.result_item_title").text();
// 				String link = "https://www.unep.org" + e.getElementsByAttribute("href").attr("href");
//
// 				String[] dateSplit = e.select("span.date").text().split(" ");
// 				String day = dateSplit[0];
// 				String month = "";
// 				switch (dateSplit[1])
// 				{
// 					case "Jan": month = "1";
// 						break;
// 					case "Feb": month = "2";
// 						break;
// 					case "Mar": month = "3";
// 						break;
// 					case "Apr": month = "4";
// 						break;
// 					case "May": month = "5";
// 						break;
// 					case "Jun": month = "6";
// 						break;
// 					case "Jul": month = "7";
// 						break;
// 					case "Aug": month = "8";
// 						break;
// 					case "Sep": month = "9";
// 						break;
// 					case "Oct": month = "10";
// 						break;
// 					case "Nov": month = "11";
// 						break;
// 					case "Dec": month = "12";
// 						break;
// 				}
// 				String year = dateSplit[2];
//
// 				String date = year + "-" + month + "-" + day;
// 				String type = e.select("span.type").text();
//
// 				String image = e.getElementsByAttribute("src").attr("src");
//
// 				UnepVO unepVO = new UnepVO(no, continent, title, link, date, type, image);
// 				titlesAndlinkslist.add(unepVO);
// 			}
//
// 			for (Element e : eleOfAsia.select("div.views-field.views-field-nothing"))
// 			{
// 				no++;
// 				String continent = "asia";
// 				String title = e.select("div.result_item_title").text();
// 				String link = "https://www.unep.org" + e.getElementsByAttribute("href").attr("href");
//
// 				String[] dateSplit = e.select("span.date").text().split(" ");
// 				String day = dateSplit[0];
// 				String month = "";
// 				switch (dateSplit[1])
// 				{
// 					case "Jan": month = "1";
// 						break;
// 					case "Feb": month = "2";
// 						break;
// 					case "Mar": month = "3";
// 						break;
// 					case "Apr": month = "4";
// 						break;
// 					case "May": month = "5";
// 						break;
// 					case "Jun": month = "6";
// 						break;
// 					case "Jul": month = "7";
// 						break;
// 					case "Aug": month = "8";
// 						break;
// 					case "Sep": month = "9";
// 						break;
// 					case "Oct": month = "10";
// 						break;
// 					case "Nov": month = "11";
// 						break;
// 					case "Dec": month = "12";
// 						break;
// 				}
// 				String year = dateSplit[2];
//
// 				String date = year + "-" + month + "-" + day;
// 				String type = e.select("span.type").text();
//
// 				String image = e.getElementsByAttribute("src").attr("src");
//
// 				UnepVO unepVO = new UnepVO(no, continent, title, link, date, type, image);
// 				titlesAndlinkslist.add(unepVO);
// 			}
//
// 			for (Element e : eleOfEurope.select("div.views-field.views-field-nothing"))
// 			{
// 				no++;
// 				String continent = "europe";
// 				String title = e.select("div.result_item_title").text();
// 				String link = "https://www.unep.org" + e.getElementsByAttribute("href").attr("href");
//
// 				String[] dateSplit = e.select("span.date").text().split(" ");
// 				String day = dateSplit[0];
// 				String month = "";
// 				switch (dateSplit[1])
// 				{
// 					case "Jan": month = "1";
// 						break;
// 					case "Feb": month = "2";
// 						break;
// 					case "Mar": month = "3";
// 						break;
// 					case "Apr": month = "4";
// 						break;
// 					case "May": month = "5";
// 						break;
// 					case "Jun": month = "6";
// 						break;
// 					case "Jul": month = "7";
// 						break;
// 					case "Aug": month = "8";
// 						break;
// 					case "Sep": month = "9";
// 						break;
// 					case "Oct": month = "10";
// 						break;
// 					case "Nov": month = "11";
// 						break;
// 					case "Dec": month = "12";
// 						break;
// 				}
// 				String year = dateSplit[2];
//
// 				String date = year + "-" + month + "-" + day;
// 				String type = e.select("span.type").text();
//
// 				String image = e.getElementsByAttribute("src").attr("src");
//
// 				UnepVO unepVO = new UnepVO(no, continent, title, link, date, type, image);
// 				titlesAndlinkslist.add(unepVO);
// 			}
//
// 			for (Element e : eleOfAmerica.select("div.views-field.views-field-nothing"))
// 			{
// 				no++;
// 				String continent = "america";
// 				String title = e.select("div.result_item_title").text();
// 				String link = "https://www.unep.org" + e.getElementsByAttribute("href").attr("href");
//
// 				String[] dateSplit = e.select("span.date").text().split(" ");
// 				String day = dateSplit[0];
// 				String month = "";
// 				switch (dateSplit[1])
// 				{
// 					case "Jan": month = "1";
// 						break;
// 					case "Feb": month = "2";
// 						break;
// 					case "Mar": month = "3";
// 						break;
// 					case "Apr": month = "4";
// 						break;
// 					case "May": month = "5";
// 						break;
// 					case "Jun": month = "6";
// 						break;
// 					case "Jul": month = "7";
// 						break;
// 					case "Aug": month = "8";
// 						break;
// 					case "Sep": month = "9";
// 						break;
// 					case "Oct": month = "10";
// 						break;
// 					case "Nov": month = "11";
// 						break;
// 					case "Dec": month = "12";
// 						break;
// 				}
// 				String year = dateSplit[2];
//
// 				String date = year + "-" + month + "-" + day;
// 				String type = e.select("span.type").text();
//
// 				String image = e.getElementsByAttribute("src").attr("src");
//
// 				UnepVO unepVO = new UnepVO(no, continent, title, link, date, type, image);
// 				titlesAndlinkslist.add(unepVO);
// 			}
// 		}
//
// 		catch (Exception e)
// 		{
// 			e.printStackTrace();
// 		}
//
// 		return titlesAndlinkslist;
// 	}
//
// }
