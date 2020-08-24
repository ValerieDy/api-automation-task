RSpec.describe 'Users' do
  let(:api) { Api::User.new }
  let(:reponse) { nil }
  let(:job) { nil }
  let(:name) { nil }
  let(:user_id) { 12 }

  let(:user_data) do
    {
      name: name,
      job: job
    }
  end

  context 'Success' do
    let!(:job) { FFaker::Company.position }
    let!(:name) { FFaker::Name.name }

    context 'POST' do
      it 'should create user' do
        response = api.create(user_data)
        expect(response.code).to eq(201)
        validate(
          response.body,
          {
            key: 'createdAt',
            type: 'string'
          },
          {
            key: 'id',
            type: 'string'
          }
        )
      end
    end
  end

    context 'PUT' do
      let!(:job) { FFaker::Company.position }
      let!(:name) { FFaker::Name.name }

      it 'should update user' do
        response = api.update(user_id, user_data)
        expect(response.code).to eq(200)
        validate(
          response.body,
          {
            key: 'updatedAt',
            type: 'string'
          }
        )
      end
    end

    context 'PATCH' do
      let!(:job) { FFaker::Company.position }

      it 'should partially update user' do
        response = api.update_partially(user_id, user_data)
        expect(response.code).to eq(200)
        validate(
          response.body,
          {
            key: 'updatedAt',
            type: 'string'
          }
        )
      end
    end

    context 'DELETE' do
      it 'should delete user' do
        response = api.delete(user_id)

        expect(response.code).to eq(204)
    end
  end

  context 'GET' do
    it 'should return user info' do
      response = api.get(user_id)

      expect(response.code).to eq(200)
      validate(
        response.body['data'],
        {
          key: 'id',
          value: 12,
          type: 'integer'
        }
      )
    end
  end
end