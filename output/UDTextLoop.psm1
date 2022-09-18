$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDTextLoop {
    <#
    .SYNOPSIS
    Creates a new text loop component
    
    .DESCRIPTION
    Creates a new text loop component. An animated loop of text nodes for your headings. Uses react-motion for the transition so it handles super fast animations and spring params.
    
    .PARAMETER Id
    The ID of this editor

    .PARAMETER Text
    The words you want to loop (required), this must be entered as an array @("item1","item2","item3")

    .PARAMETER Interval
    The frequency (in ms) that the words change. Can also pass an array if you want a different interval per children. Default 1000
    
    .PARAMETER Delay
    A delay (in ms) for the animation to start. This allows to use multiple instances to create a staggered animation effect for example. Default 0
    
    .PARAMETER AdjustingSpeed
    The speed that the container around each word adjusts to the next one (in ms). Usually you don't need to change this. Default 500

    .PARAMETER Fade
    Enable or disable the fade animation on enter and leave. Default true
    
    .PARAMETER Mask
    Mask the animation around the bounding box of the animated content. Default false
    
    .PARAMETER Stiffness
    Configuration for react-motion spring stiffness default 70

    .PARAMETER Damping
    Configuration for react-motion spring default 31

    .PARAMETER ClassName
    Any additional CSS classes you might want to use to style the component. Default udTextLoop

    .EXAMPLE
    New-UDTextLoop -Text @("item1","item2","item3") -Interval 100


    #>
    
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [array]$Text,
        [Parameter()]
        [int]$Interval = 1000,
        [Parameter()]
        [int]$Delay = 0,
        [Parameter()]
        [int]$AdjustingSpeed = 500,
        [Parameter()]
        [bool]$Fade = $true,
        [Parameter()]
        [bool]$Mask = $false,
        [Parameter()]
        [int]$Stiffness = 70,
        [Parameter()]
        [int]$Damping = 31,
        [Parameter()]
        [string]$ClassName = "udTextLoop"
    )

    End {
        @{
            assetId  = $AssetId 
            isPlugin = $true 
            type     = "udtextloop"
            id       = $Id

            children = $text
            internval = $Interval
            delay = $Delay
            adjustingSpeed = $AdjustingSpeed
            fade = $Fade
            mask = $Mask
            stiffness = $Stiffness
            damping = $Damping
            className = $ClassName
        }
    }
}