class ProjectController < AppController

    set :views, './app/views'

    # @method: Display a small welcome message
    get '/hello' do
        "Our very first controller"
    end

    # @method: Add a new TO-DO to the DB
    post '/projects/create' do
        data = JSON.parse(request.body.read)
        begin
            project = Project.create(data)
            
            project.to_json

        rescue => e
            { error: e.message }.to_json
        end

    end

    # @method: Display all projects
    get '/projects' do
        projects = Project.all
        projects.to_json
    end

    post '/skills/create' do
        data = JSON.parse(request.body.read)

        begin
            skill = Skill.create(data)
            skill.to_json
        rescue => e
            { error: e.message }.to_json
        end



    end

    # @view: Renders an erb file which shows all projects
    # erb has content_type because we want to override the default set above
    get '/' do
        @projects = Project.all.map { |project|
          {
            project: project,
            badge: project.status
          }
        }
        @i = 1
        erb_response :projects 
    end

    # @method: Update existing project according to :id
    put '/projects/update/:id' do
        begin
            project = Project.find(self.project_id)
            project.update(self.data)
            json_response(data: { message: "todo updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete project based on :id
    delete '/projects/destroy/:id' do
        begin
            project = Project.find(self.project_id)
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