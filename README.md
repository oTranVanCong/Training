
This repository for training Ruby on rails. I have built simple Restful API for simple Todo app

* You can access this API on https://todo-congtv.herokuapp.com
* Routes URL of this app following:

```
Verb   URI Pattern                                   Controller#Action
GET    /                                             api/projects#index
GET    /api/projects/:project_id/tasks(.:format)     api/tasks#index
POST   /api/projects/:project_id/tasks(.:format)     api/tasks#create
GET    /api/projects/:project_id/tasks/:id(.:format) api/tasks#show
PATCH  /api/projects/:project_id/tasks/:id(.:format) api/tasks#update
PUT    /api/projects/:project_id/tasks/:id(.:format) api/tasks#update
DELETE /api/projects/:project_id/tasks/:id(.:format) api/tasks#destroy
GET    /api/projects(.:format)                       api/projects#index
POST   /api/projects(.:format)                       api/projects#create
GET    /api/projects/:id(.:format)                   api/projects#show
PATCH  /api/projects/:id(.:format)                   api/projects#update
PUT    /api/projects/:id(.:format)                   api/projects#update
DELETE /api/projects/:id(.:format)                   api/projects#destroy
```