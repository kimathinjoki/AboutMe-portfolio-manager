class ProjectController < AppController

    set :views, './app/views'

    # Add a new project to the database
    post '/projects/create' do
        data = JSON.parse(request.body.read)
        begin
            project = Project.create(data)
            
            json_response(code: 201, data: project)

        rescue => e
            { error: e.message }.to_json
        end

    end

    # Display all projects
    get '/projects' do
        projects = Project.all.order(id: :desc)
        projects.to_json
    end


# gets the projects associated by a specific user
    get '/user/projects/:id' do

        user = User.find(params[:id].to_i)
        userProjects = user.projects
        userProjects.to_json

    end

    # Update existing project according to :id
    put '/projects/update/:id' do
        begin
            project = Project.find(params[:id].to_i)
            project.update(self.data)
            response(data: { message: "Project updated successfully" })
        rescue => e
            response(code: 422 ,data: { error: e.message })
        end
    end

    # Delete project based on :id
    delete '/projects/destroy/:id' do
        begin
            project = Project.find(self.project_id)
            project.destroy
            response(data: { message: "Project deleted successfully" })
        rescue => e
          response(code: 422, data: { error: e.message })
        end
    end


    private

    #  format body data
    def data()
        dt = JSON.parse(request.body.read)
        dt
    end

    


end