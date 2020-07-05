PauseState = Class{__includes = BaseState}


local pauseIcon = love.graphics.newImage('pause.png')

function PauseState:enter(params)
    self.state = params
    sounds['music']:pause()
    sounds['pause']:play()
    BACKGROUND_SCROLL_SPEED = 0
    GROUND_SCROLL_SPEED = 0
end

function PauseState:exit()
    sounds['pause']:play()
    sounds['music']:resume()
    BACKGROUND_SCROLL_SPEED = 30
    GROUND_SCROLL_SPEED = 60
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', self.state)
    end
end

function PauseState:render()
    for k, pair in pairs(self.state["pipePairs"]) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.state["score"]), 8, 8)

    self.state["bird"]:render()
    love.graphics.draw(pauseIcon, VIRTUAL_WIDTH/2 - pauseIcon:getWidth()/2, VIRTUAL_HEIGHT/2 - pauseIcon:getHeight()/2)
end