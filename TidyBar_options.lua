-- TODO - be able to completely disable TidyBar?

function TidyBar_create_options_pane()
  local Frame = CreateFrame( 'Frame', 'TidyBar_options' )
  local Text = Frame:CreateFontString( nil, 'BACKGROUND', 'GameFontHighlight' )
  Text:SetText( 'TidyBar simplifies the game buttons, giving much more screen space.' )
  Text:SetJustifyH( 'LEFT' )
  Text:SetJustifyV( 'TOP' )
  Text:SetPoint( 'TOPLEFT', 20, -20 )
  Text:SetPoint( 'BOTTOMRIGHT', -20, 0 )



  -- 1  -  Experience Bar
  local Button,editbox
  Button = CreateFrame( 'CheckButton', 'TidyBar_option1', Frame, 'OptionsCheckButtonTemplate' )
  Button:SetPoint( 'TOPLEFT', TidyBar_options, 20, -50 )
  --Button:SetText( 'option1' )
  getglobal( Button:GetName() .. 'Text' ):SetText( 'Hide Experience Bar' )
  Button.tooltipText = 'The reputation bar can still be shown.'
  Button:SetScript( 'OnClick', function( self )
    if self:GetChecked()then
      PlaySound( 'igMainMenuOptionCheckBoxOff' )
      TidyBar_HideExperienceBar = true
    else
      PlaySound( 'igMainMenuOptionCheckBoxOn' )
      TidyBar_HideExperienceBar = false
    end
    TidyBar_RefreshPositions()
  end)



  -- HideGryphons
  Button = CreateFrame( 'CheckButton', 'TidyBar_option2', Frame, 'OptionsCheckButtonTemplate' )
  Button:SetPoint( 'TOPLEFT',TidyBar_option1, 'BottomLeft', 0, -25 )

  --Button:SetPoint( 'BOTTOMLEFT', TidyBar_HideExperienceBar, 'TOPLEFT', 20, 0 )
  --Button:SetText( 'option1' )
  getglobal( Button:GetName() .. 'Text' ):SetText( 'Hide Gryphons' )
  Button.tooltipText = 'Hide the gryphons on either side of the action bars.'
  Button:SetScript( 'OnClick', function( self )
    if self:GetChecked()then
      PlaySound( 'igMainMenuOptionCheckBoxOff' )
      TidyBar_HideGryphons = true
    else
      PlaySound( 'igMainMenuOptionCheckBoxOn' )
      TidyBar_HideGryphons = false
    end

    TidyBar_update()
  end)



  -- AutoHideSideBar
  Button = CreateFrame( 'CheckButton', 'TidyBar_option3', Frame, 'OptionsCheckButtonTemplate' )
  Button:SetPoint( 'TOPLEFT', TidyBar_option2, 'BottomLeft', 0, -25 )
  --Button:SetText( 'option1' )
  getglobal( Button:GetName() .. 'Text' ):SetText( 'Audo Hide Sidebar' )
  Button.tooltipText = 'Automatically hide the right-hand sidebar(s) when the mouse is not over them.'
  Button:SetScript( 'OnClick', function( self )
    if self:GetChecked()then
      PlaySound( 'igMainMenuOptionCheckBoxOff' )
      TidyBar_AutoHideSideBar = true
    else
      PlaySound( 'igMainMenuOptionCheckBoxOn' )
      TidyBar_AutoHideSideBar = false
    end

    TidyBar_update()
  end)



  -- HideActionBarButtonsTexturedBackground
  Button = CreateFrame( 'CheckButton', 'TidyBar_option4', Frame, 'OptionsCheckButtonTemplate' )
  Button:SetPoint( 'TOPLEFT', TidyBar_option3, 'BottomLeft', 0, -25 )
  --Button:SetText( 'option1' )
  getglobal( Button:GetName() .. 'Text' ):SetText( 'Hide Texture' )
  Button.tooltipText = 'Hide the texture behind the main buttons.'
  Button:SetScript( 'OnClick', function( self )
    if self:GetChecked()then
      PlaySound( 'igMainMenuOptionCheckBoxOff' )
      TidyBar_HideActionBarButtonsTexturedBackground = true
    else
      PlaySound( 'igMainMenuOptionCheckBoxOn' )
      TidyBar_HideActionBarButtonsTexturedBackground = false
    end

    TidyBar_update()
  end)



  ----TODO - TidyBarScale
  --Slider = CreateFrame( 'Slider', 'TidyBar_TidyBarScale', Frame, 'OptionsCheckButtonTemplate' )
  --Slider:SetPoint( 'TOPLEFT', TidyBar_HideActionBarButtonsTexturedBackground, 'BottomLeft', 0, -25 )
  ----Button:SetText( 'option1' )
  --getglobal( Slider:GetName() .. 'Text' ):SetText( 'Scale' )
  --Slider.tooltipText = 'The scale of the various buttons.'
  ---- FIXME
  --Slider:SetScript( 'OnClick', function( self )
    --if self:GetChecked()then
      --PlaySound( 'igMainMenuOptionCheckBoxOff' )
      --TidyBar_grouping = true
    --else
      --PlaySound( 'igMainMenuOptionCheckBoxOn' )
      --TidyBar_grouping = false
    --end

    --TidyBar_update()
  --end)









  --version id
  Text = Frame:CreateFontString( nil, 'BACKGROUND', 'GameFontNormalSmall' )
  Text:SetPoint( 'BOTTOMRIGHT', -13, 13 )
  Text:SetText( 'Version ' .. tostring( GetAddOnMetadata( 'TidyBar', 'Version' ) ) )

  Text = Frame:CreateFontString( nil, 'BACKGROUND', 'GameFontNormalSmall' )
  Text:SetPoint( 'BOTTOMRIGHT', -13, 33 )
  Text:SetText( 'With great thanks to danltiger' )


  Frame.name = 'TidyBar'
  InterfaceOptions_AddCategory( Frame )
end
