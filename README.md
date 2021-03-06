# Tiny LoadBalancer Orchestra

This is a small Ruby on Rails app for managing app server instances belonging to a load balancer.
It's just a small fun project which I need for executing remotly some ssh scripts on some mirrored app server instances.

## Technical information

This project uses Ruby on Rails 6, sqlite3 and Ruby's NET:SSH for remotly login to specified load balancer entites (app server instances of a load balancer group)

## Version history:

### 0.0.1

 - first proof of concept for local usage