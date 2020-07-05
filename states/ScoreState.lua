--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local GOLD_MEDAL = love.graphics.newImage('gold.png')
local SILVER_MEDAL = love.graphics.newImage('silver.png')
local BRONZE_MEDAL = love.graphics.newImage('bronze.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    if (self.score > 1) then
	    if (self.score < 4) then
	        love.graphics.draw(BRONZE_MEDAL, VIRTUAL_WIDTH/2 - BRONZE_MEDAL:getWidth()/2, 10)
	        love.graphics.printf('You won bronze medal! Try harder to win silver!', 0, 100, VIRTUAL_WIDTH, 'center')
	    elseif (self.score < 7) then
	        love.graphics.draw(SILVER_MEDAL, VIRTUAL_WIDTH/2 - SILVER_MEDAL:getWidth()/2, 10)
	        love.graphics.printf('You won silver medal! Try harder to win gold!', 0, 100, VIRTUAL_WIDTH, 'center')
	    else
	        love.graphics.draw(GOLD_MEDAL, VIRTUAL_WIDTH/2 - GOLD_MEDAL:getWidth()/2, 10)
	        love.graphics.printf('Yayyy!!! You won gold medal! You are a champion!', 0, 100, VIRTUAL_WIDTH, 'center')
	    end
	else
		love.graphics.printf('You did not win a medal! Try harder to win bronze!', 0, 100, VIRTUAL_WIDTH, 'center')
	end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end