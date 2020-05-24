module namespace page = 'http://topgames.com';



(:This is for  List the specified game:)
declare
  %rest:POST
  %rest:path('/games')
  %output:method('html')
  %rest:form-param('gameid','{$gameid}','(nogameid)')
  %output:doctype-system('about:legacy-compat')
function page:game(
    $gameid as xs:string
) as element(html) {
  <html>
    <head>
      <title>Listing</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #e1cee2;">
      <img style="border: 10px solid; padding: 2px;" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f208a0b1-b95d-4e18-9279-dc040bc0300c/d6zy5m0-8cf85eaf-2d93-4725-b6ad-171adb19e8ad.jpg/v1/fill/w_960,h_305,q_75,strp/games_collage_for_group_banner__1_by_thinkstoomuch_d6zy5m0-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3siaGVpZ2h0IjoiPD0zMDUiLCJwYXRoIjoiXC9mXC9mMjA4YTBiMS1iOTVkLTRlMTgtOTI3OS1kYzA0MGJjMDMwMGNcL2Q2enk1bTAtOGNmODVlYWYtMmQ5My00NzI1LWI2YWQtMTcxYWRiMTllOGFkLmpwZyIsIndpZHRoIjoiPD05NjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.M_LwXO3U8xKe_elpPigEvvdgd9_l9gjmjxHtViFkTCg" alt="games" width="100%" height="200px"/>
    
    <div class="container" style="text-align:center;">
    <br/>
        <table class="table table-bordered">
      <tr class="success">
      <th scope="col">ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DEVELOP</th>
      <th scope="col">YEAR</th>
      <th scope="col">MONTH</th>
      <th scope="col">DAY</th>
    </tr>
{
for $game in doc("games")//game
where $game/gameid/text() = $gameid
return 
 
     
<tr class="table table-dark">
  <td>{$game/gameid/text()}</td>
  <td>{$game/name/text()}</td>
  <td>{$game/develop/text()}</td>
  <td>{$game/year/text()}</td>
  <td>{$game/month/text()}</td>
  <td>{$game/day/text()}</td>
</tr> 
         
}
</table>
<div  style="text-align:center;">
<a href="/allgames" class="button btn btn-danger">Back to list of games</a>
</div>
</div>
    </body>
  </html>
};

(:This is for List all games:)
declare
  %rest:GET
  %rest:path('/allgames')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:AllGames(
) as element(html) {
  <html>
    <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <title>prueba</title>
    </head>
    <body style="background-color: #e1cee2;">
    <img src="https://www.laxtore.com/imagenes/banner_xboxone.png" alt="games" width="100%" height="200px"/>
      <H1 style="text-align: center; background-color: #000; color: #fff; border-radius:150px; margin-left:20%; margin-right:20%; border-style: double;">List of games 1995-2020</H1>
      
      <table class="table table-bordered"  >
      <tr class="success">
      <th scope="col">ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DEVELOP</th>
      <th scope="col">YEAR</th>
      <th scope="col">MONTH</th>
      <th scope="col">DAY</th>
    </tr>
{
for $game in doc("games")//game
return 
 
     
<tr class="table table-dark">
  <td>{$game/gameid/text()}</td>
  <td>{$game/name/text()}</td>
  <td>{$game/develop/text()}</td>
  <td>{$game/year/text()}</td>
  <td>{$game/month/text()}</td>
  <td>{$game/day/text()}</td>
</tr> 
         
}

</table>
<div class="container" style="margin-left:20%;" >
<div class="row">
<div class="col-sm-3">
<a   href="/addgame" class="button btn btn-primary">Add a Game</a>
</div>
<div class="col-sm-3">
<a href="/updategame" class="button btn btn-info">Update a Game</a>
</div>
<div class="col-sm-3">
<a  href="/deletegame" class="button btn btn-danger">Delete a Game</a>
</div>
<div class="col-sm-3">
<a   href="/choosegame" class="button btn btn-success" >Select a Game</a>
</div>
</div>
</div>
    </body>
  </html>
};


(:This is for select a game:)
declare
  %rest:GET
  %rest:path('/choosegame')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:choosegame(
) as element(html) {
  <html>
    <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <title>SELECT A GAME</title>
    </head>
    <body style="background-color: #e1cee2;">
    <img src="https://gamerselite.com/wp-content/uploads/2017/10/Games-Banner-1140x400.png" alt="games" width="100%" height="200px"/>
       <H1 style="text-align: center; background-color: #000; color: #fff; border-radius:150px; margin-left:20%; margin-right:20%; border-style: double;">Choose a game by the id</H1>
      <form action = "/games" method="POST">
      <p style="margin-left:45%; " >Select a game</p>
        <input style="margin-left:45%; padding: 12px 20px;box-sizing: border-box; background-color: #3CBC8D; color: white;" type="text" name="gameid" /><br/><br/>
        <button style="margin-left:48.5%;"  class="btn btn-primary" type = "submit">Choose</button><br/>
        <br/>
        <div class="container">
        <div class="row">
        <div class="col-sm-4">
        <img src="https://i.imgur.com/FX4m9ad.jpeg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/03/27/15537190644260.png"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://media.rockstargames.com/rockstargames-newsite/uploads/e4e67668228df3eb050e64232a664f454ab7b030.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        </div>

        <br/>

        <div class="row">
        <div class="col-sm-4">
        <img src="https://esports.eldesmarque.com/wp-content/uploads/2019/09/LoL2.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/09/25/15694380175756.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://i.blogs.es/285282/rl/1366_2000.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        </div>

        <br/>

        <div class="row">
        <div class="col-sm-4">
        <img src="https://i.blogs.es/cdbd43/tomb-raider/450_1000.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://i.blogs.es/d85632/h2x1_nswitch_ultrastreetfighter2thefinalchallengers/1366_2000.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/04/01/Recortada/img_mbrugat_20200401-113815_imagenes_lv_terceros_cod-kNdE-U48250327520w6H-992x558@LaVanguardia-Web.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        </div>
        </div>
      </form>
    </body>
  </html>
};



(:This is for add a game:)
declare
  %rest:GET
  %rest:path('/addgame')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:addgame(
) as element(html) {
  <html>
    <head>
      <title>Add</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #e1cee2;">
      <H1 style="text-align: center; background-color: #000; color: #fff; border-radius:150px; margin-left:20%; margin-right:20%; border-style: double;"> Add a game by the id</H1>
      <div class="container">
      <div class="row">
      <div class="col-sm-3">
      </div>
      <div class="col-sm-6">
      <form  action = "/game/add" method="POST">
      <div class="form-group">
        <p>ID</p><input class="form-control form-control-lg"  type="text" name="gameid"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Name</p><input  class="form-control form-control-lg" type="text" name="name"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Develop</p><input class="form-control form-control-lg" type="text" name="develop"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Year</p><input class="form-control form-control-lg" type="text" name="year"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Month</p><input class="form-control form-control-lg" type="text" name="month"/><br/><br/>
        </div>
         <div class="form-group ">
        <p>Day</p><input class="form-control form-control-lg" type="text" name="day"/><br/><br/>
        </div>
        <div class="container">
      <div class="row">
      <div class="col-sm-5">
        <a href="/allgames" class="button btn btn-danger">Back to the list</a>
      </div>
        <div class="col-sm-2">

        <button type = "submit" class="button btn btn-info">Add</button>
        </div>
        </div>
        </div>
      </form>
      </div>
      </div>
      </div>
    </body>
  </html>
};


declare
%rest:POST
%rest:path('/game/add')
%rest:form-param('gameid','{$gameid}','(nogameid)')
%rest:form-param('name','{$name}','(noname)')
%rest:form-param('develop','{$develop}','(nodevelop)')
%rest:form-param('year','{$year}','(noyear)')
%rest:form-param('month','{$month}','(nomonth)')
%rest:form-param('day','{$day}','(noday)')
%output:method('html')
%output:doctype-system('about:legacy-compat')
updating function page:addedgame(
  $gameid as xs:string,
  $name as xs:string,
  $develop as xs:string,
  $year as xs:string,
  $month as xs:string,
  $day as xs:string
) {
  update:output(web:redirect('/allgames')),
  for $games in doc("games")/games
  return insert node
  <game>
  <gameid>{$gameid}</gameid>
  <name>{$name}</name>
  <develop>{$develop}</develop>
  <year>{$year}</year>
  <month>{$month}</month>
  <day>{$day}</day>
  </game>
  as last into $games
};


(:This is for delete a game:)


declare
%rest:POST
%rest:path('/game/delete')
%rest:form-param('gameid','{$gameid}','(nogameid)')
%output:method('html')
%output:doctype-system('about:legacy-compat')
updating function page:deletedgame(
  $gameid as xs:string

) {
  update:output(web:redirect('/allgames')),
  for $x in doc("games")//game
  where $x/gameid/text() = $gameid
  return delete node
  $x
  
};



declare
  %rest:GET
  %rest:path('/deletegame')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:deletegame(
) as element(html) {
  <html>
    <head>
      <title>Delete</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #e1cee2;">
      <form action = "/game/delete" method="POST">
        <H1 style="text-align: center; background-color: #000; color: #fff; border-radius:150px; margin-left:20%; margin-right:20%; border-style: double;">Delete a game by the id</H1>
        <div class="container">
      <div class="row">
      <div class="col-sm-3">
      </div>
      <div class="col-sm-5">
        <input class="form-control form-control-lg" type="text" name="gameid"/>
        <br/>
        </div>
        <div class="col-sm-3">
        <button class="btn btn-danger" type = "submit">Delete</button><br/>
        </div>
        
        <div class="col-sm-3">
        <br/><a href="/allgames" class="btn btn-primary">Back to the list</a>
        </div>
        
        <br/><br/>
        </div>
        </div>
        <br/>
        <div class="container">
        <div class="row">
        <div class="col-sm-4">
        
        <img src="https://i.imgur.com/FX4m9ad.jpeg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/03/27/15537190644260.png"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://media.rockstargames.com/rockstargames-newsite/uploads/e4e67668228df3eb050e64232a664f454ab7b030.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        </div>

        <br/>

        <div class="row">
        <div class="col-sm-4">
        <img src="https://esports.eldesmarque.com/wp-content/uploads/2019/09/LoL2.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/09/25/15694380175756.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://i.blogs.es/285282/rl/1366_2000.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        </div>

        <br/>

        <div class="row">
        <div class="col-sm-4">
        <img src="https://i.blogs.es/cdbd43/tomb-raider/450_1000.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://i.blogs.es/d85632/h2x1_nswitch_ultrastreetfighter2thefinalchallengers/1366_2000.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        <div class="col-sm-4">
        <img src="https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/04/01/Recortada/img_mbrugat_20200401-113815_imagenes_lv_terceros_cod-kNdE-U48250327520w6H-992x558@LaVanguardia-Web.jpg"  alt="valorant" width="100%" height="100%"/>
        </div>
        </div>
        </div>
      </form>
    </body>
  </html>
};


(:This is for update a game:)


declare
%rest:POST
%rest:path('/game/update')
%rest:form-param('gameid','{$gameid}','(nogameid)')
%rest:form-param('name','{$name}','(noname)')
%rest:form-param('develop','{$develop}','(nodevelop)')
%rest:form-param('year','{$year}','(noyear)')
%rest:form-param('month','{$month}','(nomonth)')
%rest:form-param('day','{$day}','(noday)')
%output:method('html')
%output:doctype-system('about:legacy-compat')
updating function page:updatedgame(
  $gameid as xs:string,
  $name as xs:string,
  $develop as xs:string,
  $year as xs:string,
  $month as xs:string,
  $day as xs:string
) {
  update:output(web:redirect('/allgames')),
  for $x in doc("games")//game
  where $x/gameid/text() = $gameid
  return replace node $x with
  <game>
  <gameid>{$gameid}</gameid>
  <name>{$name}</name>
  <develop>{$develop}</develop>
  <year>{$year}</year>
  <month>{$month}</month>
  <day>{$day}</day>
  </game>
  
};




declare
  %rest:GET
  %rest:path('/updategame')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:updategame(
) {
  <html>
    <head>
      <title>Update</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #e1cee2;">
       <H1 style="text-align: center; background-color: #000; color: #fff; border-radius:150px; margin-left:20%; margin-right:20%; border-style: double;">Update a game by the id</H1>
      <div class="container">
      <div class="row">
      <div class="col-sm-3">
      </div>
      <div class="col-sm-6">
      <form  action = "/game/update" method="POST">
      <div class="form-group">
        <p>ID</p><input class="form-control form-control-lg"  type="text" name="gameid"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Name</p><input  class="form-control form-control-lg" type="text" name="name"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Develop</p><input class="form-control form-control-lg" type="text" name="develop"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Year</p><input class="form-control form-control-lg" type="text" name="year"/><br/><br/>
        </div>
         <div class="form-group">
        <p>Month</p><input class="form-control form-control-lg" type="text" name="month"/><br/><br/>
        </div>
         <div class="form-group ">
        <p>Day</p><input class="form-control form-control-lg" type="text" name="day"/><br/><br/>
        </div>
        <div class="container">
      <div class="row">
      <div class="col-sm-5">
        <a href="/allgames" class="button btn btn-danger">Back to the list</a>
      </div>
        <div class="col-sm-2">

        <button type = "submit" class="button btn btn-info">Update</button>
        </div>
        </div>
        </div>
      </form>
      </div>
      </div>
      </div>
    </body>
  </html>
};