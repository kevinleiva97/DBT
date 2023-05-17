select 
{# PASSENGER_ID, 
NAME #}
*
from  {{source('source', 'PASSENGERS')}}