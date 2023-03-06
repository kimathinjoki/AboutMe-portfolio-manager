class SkillController < AppController



    get '/skills' do 
        skills = Skill.all.order(id: :desc).first(4)
        skills.to_json
    end

    # post '/skills/create' do
    #     data = JSON.parse(request.body.read)

    #     begin
    #         skill = Skill.create(data)
    #         skill.to_json
    #     rescue => e
    #         { error: e.message }.to_json
    #     end
        
    # end

    # gets the skills of a certain user and limits them to max of 10
    get '/skills/:id' do
        user = User.find(self.user_id)
        skillSet = user.skills
        skillSet.to_json
    end

    # adds a new skill for a specifies user
    post '/skill/create/:id' do
        data = JSON.parse(request.body.read)

        # begin
        #     skill = Skill.create(data)
        #     skill.to_json
        # rescue => e
        #     { error: e.message }.to_json
        # end

        count_skills = User.find(params[:id].to_i).skills.count

        if count_skills < 10
            skill = User.find(params[:id].to_i).skills.create(data)
            skill.to_json
         else
            {message: "You can only have 10 skills."}.to_json
        end

    end

    # deletes a skill for a specifies user
    delete '/skill/:id' do
        user = User.find(self.user_id)
        skill = user.skills.find(params[:id].to_i)
        skill.destroy
        {message: "Skill deleted successfully."}.to_json
    end


    private

    def user_id
        params['id'].to_i
    end


end