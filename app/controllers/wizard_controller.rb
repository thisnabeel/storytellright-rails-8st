class WizardController < ApplicationController
    def ask
        render json: WizardService.ask(params[:prompt])
    end
end