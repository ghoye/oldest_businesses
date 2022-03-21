# oldest_businesses

A key element of any successful business is foresight. In other words, a company must ensure that it can survive whatever changes that may occur in the market. Some businesses are not able to weather the economic storms, whereas others have continued to operate for hundreds of years.

BusinessFinancing.co.uk <a href="https://businessfinancing.co.uk/the-oldest-company-in-almost-every-country">researched</a> the oldest company that is still in business in (almost) every country in the world and compiled the results into a dataset. In this project, I explored their findings.

The database contains three tables:

<h3 id="categories"><code>categories</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>category_code</code></td>
<td>varchar</td>
<td>Code for the category of the business</td>
</tr>
<tr>
<td style="text-align:left;"><code>category</code></td>
<td>varchar</td>
<td>Description of the business category</td>
</tr>
</tbody>
</table>
<h3 id="countries"><code>countries</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>country_code</code></td>
<td>varchar</td>
<td>ISO 3166-1 3-letter country code</td>
</tr>
<tr>
<td style="text-align:left;"><code>country</code></td>
<td>varchar</td>
<td>Name of the country</td>
</tr>
<tr>
<td style="text-align:left;"><code>continent</code></td>
<td>varchar</td>
<td>Name of the continent that the country exists in</td>
</tr>
</tbody>
</table>
<h3 id="businesses"><code>businesses</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>business</code></td>
<td>varchar</td>
<td>Name of the business</td>
</tr>
<tr>
<td style="text-align:left;"><code>year_founded</code></td>
<td>int</td>
<td>Year the business was founded</td>
</tr>
<tr>
<td style="text-align:left;"><code>category_code</code></td>
<td>varchar</td>
<td>Code for the category of the business</td>
</tr>
<tr>
<td style="text-align:left;"><code>country_code</code></td>
<td>char</td>
<td>ISO 3166-1 3-letter country code</td>
</tr>
</tbody>
</table>

From the dataset, I discovered that the oldest business still in operation is Kongō Gumi, a Japanese construction company founded in 578 A.D. The latest "oldest" business was founded in 1999, namely the Meridian Corporation in Kosovo. Other businesses founded before the year 1000 include the St. Peter Stifts Kulinarium in Austria (803); the Royal Mint in Wales (886); and Sean's Bar in Ireland (900). Of the 19 categories (see <i>categories.csv</i> for more details), banking and finance boasts the largest number of businesses (37), followed by breweries (22) and transportation (19).

Created as part of the DataCamp project <a href="https://app.datacamp.com/learn/projects/worlds_oldest_businesses/guided/SQL">"What and Where are the World's Oldest Businesses"</a> by Richie Cotton.
