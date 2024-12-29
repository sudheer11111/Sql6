with cte as (
Select p1.x x1, p1.y y1, p2.x x2, p2.y y2,
Round(sqrt((POW(p2.x - p1.x,2)) + (POW(p2.y - p1.y,2))),2) as dist
from Point2D p1 
join Point2D p2 
on p1.x!= p2.x or p1.y!=p2.y
)

select min(dist) as shortest
from cte
