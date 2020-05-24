
module namespace page = 'http://pepillo.com';


declare
  %rest:GET
  %rest:path('/myactors')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:myactors(
) as element(Q{http://www.w3.org/1999/xhtml}html) {
  <html xmlns='http://www.w3.org/1999/xhtml'>
   <head>
<tittle>Hola</tittle>
</head>
<body>
<p>intento</p>
<table>
{
for $actor in doc("prueba")//actor
return

<tr>
  <td>{$actor/name/text()}</td>
  <td>{$actor/age/text()}</td>
</tr> 
}

</table>

</body>
  </html>
};
