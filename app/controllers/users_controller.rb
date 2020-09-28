class UsersController < ApplicationController

  def signup
    byebug
    user = User.new(user_params)

    if user.valid?
      user.save
      token = encode_token({ user_id: user.id })

      render json: { user: user, token: token },
        except: [:created_at, :updated_at, :password_digest],
        include: [
          :invitations,
          :watchparties,
          :friends => {
            except: [:created_at, :updated_at, :password_digest]
          },
          :user_leagues => {
            only: [:id],
            include: [
              :league => { except: [:created_at, :updated_at] }
            ]
          }]
    else
      render json: { error: user.errors }
    end
  end

end
