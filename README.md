Flask Style Tiles
=================

Scaffold for [Style Tiles](http://styletil.es) presentation project, built on [KL[AS] Flask](http://github.com/kylelarkin/flask) using [Middleman](http://middlemanapp.com)


Installation
------------

1. Prerequisites: Ruby (Bundler, Rake), Bower
2. Clone repository
3. `cd` into repository and run `bundle install`
3. Run `rake init`


Useage
------

#### `rake init`

- Bootstraps your project folder by running `bower install`, and installing bourbon and neat (for scss).
- Prompts for the project name, and saves that in `data/project.json` for use by the layout files
- Automatically calls `rake new`

#### `rake new`

- Creates a scaffold for a new style tile iteration
- If this is the first time (e.g. when called by `rake init`), this will create index.html.erb and _index.scss files. All other times it will create corresponding incremented version files.
- All styletile iteration files are automagically linked and ready to edit

#### To change the template .html.erb and .scss files

- Edit them in `templates/`

#### Middleman tl;dr

- Run `bundle exec middleman` to spawn a live-reloaded web server at `http://localhost:4567`
- Run `bundle exec middleman build` to package your site into static files (for deployment) within a `build` directory
- [Middleman Documentation](http://middlemanapp.com)