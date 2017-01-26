local videoShare = require "plugin.videoShare"
local widget = require("widget")
local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 1, .49803921568, .31372549019 )--coral #FF7F50

local logo = display.newImage( "videoIcon.png" )
logo.x, logo.y = display.contentCenterX, 168*.5
local title = display.newText( "Video Share", 0, 0, native.systemFontBold, 20 )
title.x, title.y = logo.x, logo.y+(logo.height*.5)+10

local myVideo= system.pathForFile( "sampleVideo.mp4")

local save
save = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY,
        id = "Save to Photos",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        label = "Save to Photos",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        videoShare.save(myVideo)
                end
        end
} )
local show
show = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+70,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        id = "show",
        label = "Show",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        videoShare.show(myVideo)
                end
        end
} )
