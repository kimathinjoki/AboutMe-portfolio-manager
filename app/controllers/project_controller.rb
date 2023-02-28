class ProjectController < AppController

    set :views, './app/views'

    # @method: Display a small welcome message
    get '/hello' do
        "Our very first controller"
    end

    # @method: Add a new TO-DO to the DB
    post '/project/create' do
        begin
            project = Project.create( self.data(create: true) )
            json_response(code: 201, data: todo)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all projects
    get '/projects' do
        projects = Project.all
        json_response(data: projects)
    end

    # @view: Renders an erb file which shows all projects
    # erb has content_type because we want to override the default set above
    get '/' do
        @projects = Project.all.map { |project|
          {
            project: project,
            badge: project_status_badge(project.status)
          }
        }
        @i = 1
        erb_response :todos
    end

    # @method: Update existing project according to :id
    put '/projects/update/:id' do
        begin
            project = Project.find(self.todo_id)
            project.update(self.data)
            json_response(data: { message: "todo updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete project based on :id
    delete '/projects/destroy/:id' do
        begin
            project = Project.find(self.todo_id)
            project.destroy
            json_response(data: { message: "todo deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end


    private

    # @helper: format body data
    def data(create: false)
        payload = JSON.parse(request.body.read)
        if create
            payload["createdAt"] = Time.now
        end
        payload
    end

    # @helper: retrieve to-do :id
    def project_id
        params['id'].to_i
    end

    # @helper: format status style
    def project_status_badge(status)
        case status
            when 'CREATED'
                'bg-info'
            when 'ONGOING'
                'bg-success'
            when 'CANCELLED'
                'bg-primary'
            when 'COMPLETED'
                'bg-warning'
            else
                'bg-dark'
        end
    end


end