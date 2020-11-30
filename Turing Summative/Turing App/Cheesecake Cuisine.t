%--------------------------------------------------%
% Shi, Richard                                     %
% 333540102                                        %
% Mr. J. Lee, ICS2O1 - 25                          %
% May 2019                                         %
% Summative Assignment:                            %
%    Cheesecake Cuisine                            %
%    Tutorial on how to make Japanese Cheesecake   %
%--------------------------------------------------%

%********************************************************
% PUBLISHER'S NOTE:                                     *
%                                                       *
% Thank you for choosing to use Cheesecake Cuisine. We  *
% hope that by using this app, you will be able to      *
% bake your very own cheesecake! Best of luck!!         *
%                                                       *
% P.S. Run in the already declared 800 x 600 run window *
%********************************************************


%-----------------------------------------------------------------------------------------------------------------
% VARIABLE AND CONSTANT DECLARATION

%-----------------------------
% global identifiers & run window
% mousewhere variables
var x, y, prevButton, b : int
% constants for mouse button state
const MOUSEDOWN := 1
const MOUSEUP := 0
% run window size
var runWindow : int := Window.Open ("graphics:800;600,nobuttonbar")
%-----------------------------


%-----------------------------
% main menu variables
% title font
var font : int := Font.New ("Comic Sans MS:42")
% gui button font
var buttonFont : int := Font.New ("Comic Sans MS:18")
% center of screen (x and y)
const CENTERX := maxx div 2
const CENTERY := maxy div 2
% app theme colour
const CREAMYYELLOW := 68
const THEMECOLOUR := CREAMYYELLOW
%-----------------------------


%-----------------------------
% lesson variables
% text fonts
var headerFont : int := Font.New ("Comic Sans MS:30")
var textFont : int := Font.New ("Comics Sans MS:12")
var listFont : int := Font.New ("Comics Sans MS:11")
% pictures
var stepOnePic : int := Pic.FileNew ("oven.bmp")
var stepTwoPic : int := Pic.FileNew ("step two.bmp")
var stepThreePic : int := Pic.FileNew ("step three.bmp")
var stepFourPic : int := Pic.FileNew ("step four.bmp")
var stepFivePic : int := Pic.FileNew ("step five.bmp")
var stepSixPic : int := Pic.FileNew ("step six.bmp")
var stepSevenPic : int := Pic.FileNew ("step seven.bmp")
var stepEightPic : int := Pic.FileNew ("step eight.bmp")
var stepNinePic : int := Pic.FileNew ("step nine.bmp")
var stepTenPic : int := Pic.FileNew ("step ten.bmp")
var stepElevenPic : int := Pic.FileNew ("step eleven.bmp")
var stepTwelvePic : int := Pic.FileNew ("step twelve.bmp")
var bakedCake : int := Pic.FileNew ("finished cheesecake.bmp")
%-----------------------------


%-----------------------------
% quiz variables
% answer array
var answer : array 1 .. 5 of char := init ('b', 'c', 'c', 'd', 'a')
% response array
var response : array 1 .. 5 of char
% counter to count the number of right answers
var correct : int := 0
% counter to count the number of questions the user got wrong
var wrong : int := 0
% quiz question font
var questionFont : int := Font.New ("Comic Sans MS:24")
% multiple choice answer font
var answerFont : int := Font.New ("Comic Sans MS:12")
% multiple choice option colours (for the circles being used as their selection method)
const LIGHTGRAY := 30
const OPTIONCOLOUR := LIGHTGRAY
% colour change after an option is selecteed
const SELECTIONCOLOUR := black
% keep track when the user already selected an answer
const LIGHTGREEN := 96
const ANSWEREDCOLOUR := LIGHTGREEN
%-----------------------------


%-----------------------------
% animation variables
% egg yolk colour
const YOLK := yellow
% background for when numbers are displayed
const BACKGROUND := black
% text for the clock and temperature
var clockAndTempText : int := Font.New ("Comic Sans MS:54")
% stovetop colour
const DARKGRAY := 21
const STOVETOPCOLOUR := DARKGRAY
% stovetop markings colour
const GRAY := 27
const STOVETOPMARKINGS := GRAY
% small pot colour
const DARKGRAY2 := 24
const SMALLPOTCOLOUR := DARKGRAY2
% secondary small pot colour to add depth
const SMALLPOTCOLOUR2 := GRAY
% pot handle colour
const SECONDARYBLACK := 18
const POTHANDLECOLOUR := SECONDARYBLACK
% colour of butter
const BUTTERYELLOW := 68
const BUTTER := BUTTERYELLOW
% colour of the bowl
const TRANSPARENTWHITE := 30
const BOWLCOLOUR := TRANSPARENTWHITE
% colour of the cream cheese mixture
const CREAM := 91
const CREAMCHEESECOLOUR := CREAM
% wall colour
const LIGHTBLUE := 77
const WALLCOLOUR := LIGHTBLUE
% egg colour
const YOLKCOLOUR := BUTTERYELLOW
% flour and cornstarch position generator
var xSifting, ySifting : int
% sugar position generator
var xSugar, ySugar : int
% colour of the egg/cream cheese mixture
const EGGYCREAM := 92
const EGGMIXTURE := EGGYCREAM
% colour of the hot water
const WATERCOLOUR := LIGHTBLUE
% image of a whisker
var whisker : int := Pic.FileNew ("whisker.bmp")
% hand whisk
var whiskRight : int := Pic.FileNew ("whisk1.bmp")
var whiskLeft : int := Pic.FileNew ("whisk2.bmp")
% sifter
var sifter : int := Pic.FileNew ("sifter.bmp")
% drizzling cream cheese mixture
var drizzle : int := Pic.FileNew ("drizzle.bmp")
% mixing egg whites
var eggMix : int := Pic.FileNew ("egg white mix.bmp")
var eggMix2 : int := Pic.FileNew ("egg white mix2.bmp")
var eggMix3 : int := Pic.FileNew ("egg white mix3.bmp")
%-----------------------------
%-----------------------------------------------------------------------------------------------------------------


%-----------------------------------------------------------------------------------------------------------------
% PROCEDURES

%--------------------------------------------------------------
% functionality button procedure(s)

%**********nextButton******************************************
% Purpose: To allow the user to control when the lessons      *
%          transition to the next step                        *
%**************************************************************
procedure nextButton
    drawfillbox (maxx - 100, CENTERY - 275, maxx - 200, CENTERY - 230, THEMECOLOUR) % x = 599 and x = 699 & y = 24 and y = 69
    Font.Draw ("Next", maxx - 179, CENTERY - 260, buttonFont, black)
end nextButton

%**********menuButton******************************************
% Purpose: To allow the user to exit to the main menu even if *
%          they're not done a lesson                          *
%**************************************************************
procedure menuButton
    drawfillbox (maxx - 100, CENTERY - 275, maxx - 200, CENTERY - 230, THEMECOLOUR) % x = 599 and x = 699 & y = 24 and y = 69
    Font.Draw ("Menu", maxx - 179, CENTERY - 260, buttonFont, black)
end menuButton

%**********submitButton*****************************************
% Purpose: Allows the user to decide when to submit their quiz *
%          quiz responses.                                     *
%***************************************************************
procedure submitButton
    drawfillbox (maxx - 100, CENTERY - 205, maxx - 200, CENTERY - 160, THEMECOLOUR) % x = 599 and x = 699 & y = 94 and y = 139
    Font.Draw ("Submit!", maxx - 190, CENTERY - 190, buttonFont, black)
end submitButton

%**********flushMouse*********************************************
% Purpose: To make sure the program doesn't register held clicks *
%*****************************************************************
proc flushMouse
    loop
	mousewhere (x, y, b)
	exit when b = MOUSEUP
    end loop
end flushMouse
%--------------------------------------------------------------


%--------------------------------------------------------------
% main menu procedure(s)

%***********mainMenu*******************************************
% Purpose: To make the formatting section of my program more  *
%          efficient by assigning the main menu design as a   *
%          procedure so I can just call on this procedure     *
%          instead of rewriting the fragment again.           *
%**************************************************************
procedure mainMenu
    View.Set ("title:Welcome to Cheesecake Cuisine!")
    cls
    % page design
    drawfillbox (0, maxy, 200, 0, THEMECOLOUR)
    drawfillbox (maxx, maxy, 600, 0, THEMECOLOUR)
    % title
    Font.Draw ("Cheesecake Cuisine", 145, 540, font, black)

    % lesson button
    drawfillbox (CENTERX - 80, CENTERY + 170, CENTERX + 80, CENTERY + 100, THEMECOLOUR)
    Font.Draw ("Lesson", CENTERX - 37, CENTERY + 128, buttonFont, black)

    % quiz button
    drawfillbox (CENTERX - 80, CENTERY + 60, CENTERX + 80, CENTERY - 10, THEMECOLOUR)
    Font.Draw ("Test Yourself!", CENTERX - 78, CENTERY + 18, buttonFont, black)

    % animation button
    drawfillbox (CENTERX - 80, CENTERY - 50, CENTERX + 80, CENTERY - 120, THEMECOLOUR)
    Font.Draw ("Animation", CENTERX - 54, CENTERY - 92, buttonFont, black)

    % exit button
    drawfillbox (CENTERX - 50, CENTERY - 160, CENTERX + 50, CENTERY - 230, THEMECOLOUR)
    Font.Draw ("Quit", CENTERX - 25, CENTERY - 201, buttonFont, black)

    % name, class & section and teacher
    locate (maxrow - 2, maxcol div 2 - 7)
    put "By: Richard Shi" ..
    locate (maxrow - 1, maxcol div 2 - 5)
    put "ICS2O1 - 25" ..
    locate (maxrow, maxcol div 2 - 5)
    put "Mr. J. Lee" ..
end mainMenu
%--------------------------------------------------------------


%--------------------------------------------------------------
% transitional procedure(s)

%******mainMenuTransfer****************************************
% Purpose: To make the program more efficient by bundling up  *
%          the fragment that brings you back to the menu      *
%          into a procedure that can be called upon later     *
%**************************************************************
% note: use only on the last slide of each selection
procedure mainMenuTransfer
    % mousewhere tracking to exit to main menu if user hits menu button
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 599 and x <= 699 and y >= 24 and y <= 69 then % location of menu button
	    flushMouse
	    % exits to main menu and exits this loop
	    cls
	    mainMenu
	    exit
	end if
    end loop
end mainMenuTransfer
%--------------------------------------------------------------


%--------------------------------------------------------------
% lesson procedure(s)

%*********pageDesign*******************************************
% Purpose: To make the program more efficient by creating a   *
%          procedure that will output the page layout of the  *
%          lesson (used for all the slides).                  *
%**************************************************************
procedure pageDesign
    % header bar of colour
    drawfillbox (0, maxy, maxx, maxy - 100, THEMECOLOUR)
end pageDesign

%**********pageNavigator***************************************
% Purpose: To allow the user to navigate through different    *
%          lesson pages.                                      *
%**************************************************************
procedure pageNavigator
    %-------------------------------
    % NAVIGATOR BUTTONS
    % ingredient list button
    drawfilloval (CENTERX - 360, maxy - 180, 17, 17, THEMECOLOUR)
    Font.Draw ("Ing.", CENTERX - 368, maxy - 185, textFont, black)
    % step 1 button
    drawfilloval (CENTERX - 360, maxy - 240, 17, 17, THEMECOLOUR)
    Font.Draw ("1", CENTERX - 364, maxy - 245, textFont, black)
    % step 2 button
    drawfilloval (CENTERX - 360, maxy - 300, 17, 17, THEMECOLOUR)
    Font.Draw ("2", CENTERX - 364, maxy - 305, textFont, black)
    % step 3 button
    drawfilloval (CENTERX - 360, maxy - 360, 17, 17, THEMECOLOUR)
    Font.Draw ("3", CENTERX - 364, maxy - 365, textFont, black)
    % step 4 button
    drawfilloval (CENTERX - 360, maxy - 420, 17, 17, THEMECOLOUR)
    Font.Draw ("4", CENTERX - 364, maxy - 425, textFont, black)
    % step 5 button
    drawfilloval (CENTERX - 360, maxy - 480, 17, 17, THEMECOLOUR)
    Font.Draw ("5", CENTERX - 364, maxy - 485, textFont, black)
    % step 6 button
    drawfilloval (CENTERX - 360, maxy - 540, 17, 17, THEMECOLOUR)
    Font.Draw ("6", CENTERX - 364, maxy - 545, textFont, black)
    % step 7 button
    drawfilloval (CENTERX + 360, maxy - 180, 17, 17, THEMECOLOUR)
    Font.Draw ("7", CENTERX + 356, maxy - 185, textFont, black)
    % step 8 button
    drawfilloval (CENTERX + 360, maxy - 240, 17, 17, THEMECOLOUR)
    Font.Draw ("8", CENTERX + 356, maxy - 245, textFont, black)
    % step 9 button
    drawfilloval (CENTERX + 360, maxy - 300, 17, 17, THEMECOLOUR)
    Font.Draw ("9", CENTERX + 356, maxy - 305, textFont, black)
    % step 10 button
    drawfilloval (CENTERX + 360, maxy - 360, 17, 17, THEMECOLOUR)
    Font.Draw ("10", CENTERX + 351, maxy - 365, textFont, black)
    % step 11 button
    drawfilloval (CENTERX + 360, maxy - 420, 17, 17, THEMECOLOUR)
    Font.Draw ("11", CENTERX + 351, maxy - 425, textFont, black)
    % step 12 button
    drawfilloval (CENTERX + 360, maxy - 480, 17, 17, THEMECOLOUR)
    Font.Draw ("12", CENTERX + 351, maxy - 485, textFont, black)
    % end button
    drawfilloval (CENTERX + 360, maxy - 540, 17, 17, THEMECOLOUR)
    Font.Draw ("End.", CENTERX + 346, maxy - 545, textFont, black)
    %-------------------------------

    % menu button
    menuButton
end pageNavigator

%************lessonIntro***************************************
% Purpose: To tell the user what ingredients are required to  *
%          make the cheesecake and the serving size of this   *
%          portion.                                           *
%**************************************************************
procedure lessonIntro
    % procedure call for the page design
    pageDesign
    % page header
    Font.Draw ("Welcome !!", CENTERX - 95, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("This recipe will help teach you how to make your very own fluffy Japanese", CENTERX - 255, CENTERY + 75, textFont, black)
    Font.Draw ("Cheesecake in the comfort of your own home. This dessert is surely going", CENTERX - 259, CENTERY + 35, textFont, black)
    Font.Draw ("to leave you and your guests wanting more!", CENTERX - 162, CENTERY - 5, textFont, black)
    Font.Draw ("We hope you enjoy this tutorial and wish you the best of luck!", CENTERX - 217, CENTERY - 130, textFont, black)

    % function buttons
    pageNavigator
end lessonIntro

%**********ingredientList**************************************
% Purpose: To tell the user what ingredients are required for *
%          the making of this dessert and the approximate     *
%          serving size.                                      *
%**************************************************************
procedure ingredientList
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 180, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Ingredient List", CENTERX - 138, maxy - 60, headerFont, black)

    % main body of text
    Font.Draw ("In order to bake this delicious cheesecake, you're going to need some ingredients.", CENTERX - 283, maxy - 130, textFont, black)
    Font.Draw ("For a cheesecake that yields a serving size of 6, you'll need:", CENTERX - 283, maxy - 175, textFont, black)

    % ingredient list
    Font.Draw ("•100 grams of butter", CENTERX - 282, CENTERY + 85, textFont, black) % left column
    Font.Draw ("•100 grams of cream cheese", CENTERX - 282, CENTERY + 35, textFont, black) % left column
    Font.Draw ("•130 mL of milk", CENTERX - 282, CENTERY - 25, textFont, black) % left column
    Font.Draw ("•8 egg yolks", CENTERX - 282, CENTERY - 75, textFont, black) % left column
    Font.Draw ("•60 g of flour", CENTERX - 282, CENTERY - 125, textFont, black) % left column
    Font.Draw ("•60 g of cornstarch", CENTERX - 282, CENTERY - 175, textFont, black) % left column
    Font.Draw ("•13 egg whites", CENTERX + 32, CENTERY + 85, textFont, black) % right column
    Font.Draw ("•130 g of table sugar", CENTERX + 32, CENTERY + 35, textFont, black) % right column
    Font.Draw ("•Hot water (for baking)", CENTERX + 32, CENTERY - 25, textFont, black) % right column
    Font.Draw ("•Powdered sugar (for serving)", CENTERX + 32, CENTERY - 75, textFont, black) % right column
    Font.Draw ("•Any garnish you wish to add", CENTERX + 32, CENTERY - 125, textFont, black) % right column
end ingredientList

%**********stepOne******************************************
% Purpose: To display step 1 of baking the cheesecake.     *
%***********************************************************
procedure stepOne
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 240, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step One", CENTERX - 85, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Start by preheating the oven to 320°F (160°C).", CENTERX - 159, CENTERY + 95, textFont, black)

    % oven picture
    Pic.Draw (stepOnePic, CENTERX - 125, CENTERY - 180, picMerge)
end stepOne

%**********stepTwo*****************************************
% Purpose: To display step 2 of baking the cheesecake.    *
%**********************************************************
procedure stepTwo
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 300, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Two", CENTERX - 85, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Place a small pot over medium heat.", CENTERX - 122, CENTERY + 95, textFont, black)
    Font.Draw ("Now, whisk in the butter, cream cheese and milk until they're all melted and smooth.", CENTERX - 290, CENTERY + 45, textFont, black)
    Font.Draw ("Remove from the heat and allow it to cool.", CENTERX - 140, CENTERY - 5, textFont, black)

    % picture
    Pic.Draw (stepTwoPic, CENTERX - 85, CENTERY - 210, picMerge)
end stepTwo

%**********stepThree***************************************
% Purpose: To display step 3 of baking the cheesecake.    *
%**********************************************************
procedure stepThree
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 360, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Three", CENTERX - 103, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Put the egg yolks in a separate bowl and whisk them until they're smooth.", CENTERX - 237, CENTERY + 95, textFont, black)
    Font.Draw ("Slowly pour in the cream cheese mixture into the bowl containing egg yolks.", CENTERX - 246, CENTERY + 45, textFont, black)
    Font.Draw ("Stir both together until they're evenly combined.", CENTERX - 154, CENTERY - 5, textFont, black)

    % picture
    Pic.Draw (stepThreePic, CENTERX - 90, CENTERY - 210, picMerge)
end stepThree

%**********stepFour****************************************
% Purpose: To display step 4 of baking the cheesecake.    *
%**********************************************************
procedure stepFour
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 420, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Four", CENTERX - 94, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Sift flour and cornstarch into the mixture.", CENTERX - 135, CENTERY + 95, textFont, black)
    Font.Draw ("Whisk until there are no more lumps.", CENTERX - 123, CENTERY + 45, textFont, black)

    % picture
    Pic.Draw (stepFourPic, CENTERX - 97, CENTERY - 180, picMerge)
end stepFour

%**********stepFive****************************************
% Purpose: To display step 5 of baking the cheesecake.    *
%**********************************************************
procedure stepFive
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 480, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Five", CENTERX - 94, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Grab a different bowl then beat the egg whites until soft peaks form.", CENTERX - 235, CENTERY + 95, textFont, black)
    Font.Draw ("Gradually add sugar while you are beating the egg whites.", CENTERX - 193, CENTERY + 45, textFont, black)

    % picture
    Pic.Draw (stepFivePic, CENTERX - 105, CENTERY - 200, picMerge)
end stepFive

%**********stepSix*****************************************
% Purpose: To display step 6 of baking the cheesecake.    *
%**********************************************************
procedure stepSix
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX - 360, maxy - 540, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Six", CENTERX - 85, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Mix in about one-fourth of the egg whites into the yolk mixture.", CENTERX - 207, CENTERY + 95, textFont, black)
    Font.Draw ("Repeat this process with the rest of the egg whites until the batter is evenly combined.", CENTERX - 286, CENTERY + 45, textFont, black)

    % picture
    Pic.Draw (stepSixPic, CENTERX - 110, CENTERY - 200, picMerge)
end stepSix

%**********stepSeven****************************************
% Purpose: To display step 7 of baking the cheesecake.     *
%***********************************************************
procedure stepSeven
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 180, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Seven", CENTERX - 103, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Grease the bottom of a 9-inch x 3-inch round cake pan then line the bottom and sides", CENTERX - 297, CENTERY + 145, textFont, black)
    Font.Draw ("with parchment paper.", CENTERX - 74, CENTERY + 95, textFont, black)
    Font.Draw ("If you are using a springform pan, wrap the bottom and sides completely with foil", CENTERX - 267, CENTERY + 45, textFont, black)
    Font.Draw ("twice in order to prevent the batter from leaking.", CENTERX - 155, CENTERY - 15, textFont, black)

    % picture
    Pic.Draw (stepSevenPic, CENTERX - 93, CENTERY - 220, picMerge)
end stepSeven

%**********stepEight****************************************
% Purpose: To display step 8 of baking the cheesecake.     *
%***********************************************************
procedure stepEight
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 240, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Eight", CENTERX - 103, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Pour the batter into the pan and shake the pan to remove any large air bubbles.", CENTERX - 271, CENTERY + 145, textFont, black)

    % picture
    Pic.Draw (stepEightPic, CENTERX - 138, CENTERY - 160, picMerge)
end stepEight

%**********stepNine****************************************
% Purpose: To display step 9 of baking the cheesecake.    *
%**********************************************************
procedure stepNine
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 300, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Nine", CENTERX - 94, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Place the pan into a larger baking dish that has two paper towels at the bottom.", CENTERX - 273, CENTERY + 145, textFont, black)
    Font.Draw ("The paper towels ensures that the heat is distributed evenly throughout the bottom of", CENTERX - 294, CENTERY + 95, textFont, black)
    Font.Draw ("the pan.", CENTERX - 29, CENTERY + 45, textFont, black)
    Font.Draw ("Fill the larger pan to about an inch (2.54 cm) high with hot water.", CENTERX - 212, CENTERY - 15, textFont, black)

    % picture
    Pic.Draw (stepNinePic, CENTERX - 97, CENTERY - 220, picMerge)
end stepNine

%**********stepTen*****************************************
% Purpose: To display step 10 of baking the cheesecake.   *
%**********************************************************
procedure stepTen
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 360, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Ten", CENTERX - 85, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Bake for 25 minutes at 320°F (160°C) and then reduce the heat to 285°F (140°C).", CENTERX - 280, CENTERY + 145, textFont, black)
    Font.Draw ("Continue to bake for another 55 minutes or until the cake has risen to almost double", CENTERX - 287, CENTERY + 95, textFont, black)
    Font.Draw ("its original height.", CENTERX - 57, CENTERY + 45, textFont, black)

    % picture
    Pic.Draw (stepTenPic, CENTERX - 125, CENTERY - 220, picMerge)
end stepTen

%**********stepEleven**************************************
% Purpose: To display step 11 of baking the cheesecake.   *
%**********************************************************
procedure stepEleven
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 420, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Eleven", CENTERX - 110, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Remove from the oven, flip the cake onto your hand and peel off the parchment paper.", CENTERX - 286, CENTERY + 145, textFont, black)
    Font.Draw ("Be extremely cautious as the cake is still hot and you may burn yourself.", CENTERX - 241, CENTERY + 95, textFont, black)
    Font.Draw ("Note: You can also flip the cake onto a plate but this will cause it to deflate.", CENTERX - 255, CENTERY + 45, textFont, black)

    % picture
    Pic.Draw (stepElevenPic, CENTERX - 121, CENTERY - 220, picMerge)
end stepEleven

%**********stepTwelve**************************************
% Purpose: To display step 12 of baking the cheesecake.   *
%**********************************************************
procedure stepTwelve
    % procedure call for the page design
    pageDesign

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 480, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Step Twelve", CENTERX - 110, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("Dust the top of the cake with powdered sugar.", CENTERX - 149, CENTERY + 145, textFont, black)
    Font.Draw ("Add whatever garnishes as you'd like!", CENTERX - 123, CENTERY + 95, textFont, black)

    % picture
    Pic.Draw (stepTwelvePic, CENTERX - 121, CENTERY - 200, picMerge)
end stepTwelve

%**********congratsPage*************************************
% Purpose: To congratulate the user on baking their very   *
%          own cheesecake.                                 *
%***********************************************************
procedure congratsPage
    % procedure call for the page design
    pageDesign

    % picture
    Pic.Draw (bakedCake, CENTERX - 400, CENTERY - 300, picMerge)

    % function buttons
    drawfilloval (CENTERX + 360, maxy - 540, 24, 24, THEMECOLOUR)
    pageNavigator

    % page header
    Font.Draw ("Congratulations!", CENTERX - 140, maxy - 60, headerFont, black)
    % main body of text
    Font.Draw ("You've made your very own cheesecake! Enjoy!", CENTERX - 158, CENTERY + 175, answerFont, black)
end congratsPage

%********lesson*********************************************************************************
% Purpose: To combine all the steps into one big procedure and put the function buttons to use *
%***********************************************************************************************
proc lesson
    View.Set ("title:Lesson")
    % lesson intro
    lessonIntro

    % assess the user's clicks and execute one accordingly
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 402 and y <= 436 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is the ingredient list
	    ingredientList
	elsif prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 342 and y <= 376 then
	    flushMouse
	    cls
	    % next slide is step 1
	    stepOne
	elsif prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 282 and y <= 316 then
	    flushMouse
	    cls
	    % next slide is step 2
	    stepTwo
	elsif prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 222 and y <= 256 then
	    flushMouse
	    cls
	    % next slide is step 3
	    stepThree
	elsif prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 162 and y <= 196 then
	    flushMouse
	    cls
	    % next slide is step 4
	    stepFour
	elsif prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 102 and y <= 136 then
	    flushMouse
	    cls
	    % next slide is step 5
	    stepFive
	elsif prevButton = MOUSEDOWN and x >= 22 and x <= 56 and y >= 42 and y <= 76 then
	    flushMouse
	    cls
	    % next slide is step 6
	    stepSix
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 402 and y <= 436 then
	    flushMouse
	    cls
	    % next slide is step 7
	    stepSeven
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 342 and y <= 376 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is step 8
	    stepEight
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 282 and y <= 316 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is step 9
	    stepNine
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 222 and y <= 256 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is step 10
	    stepTen
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 162 and y <= 196 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is step 11
	    stepEleven
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 102 and y <= 136 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is step 12
	    stepTwelve
	elsif prevButton = MOUSEDOWN and x >= 742 and x <= 776 and y >= 42 and y <= 76 and whatdotcolour (x, y) = THEMECOLOUR then
	    flushMouse
	    cls
	    % next slide is the congrats page
	    congratsPage
	elsif prevButton = MOUSEDOWN and x >= 599 and x <= 699 and y >= 24 and y <= 69 then
	    flushMouse
	    % exit when clicking the main menu button
	    mainMenu
	    exit
	end if
    end loop
end lesson
%--------------------------------------------------------------


%--------------------------------------------------------------
% quiz procedure(s)

%**********selection*****************************************
% Purpose: To display the circles the user can click on to  *
%          register which answer they picked                *
%************************************************************

proc selection
    % text to tell the user how to select their choice
    Font.Draw ("Please click inside one of the circles to select your option.", CENTERX - 320, CENTERY + 170, buttonFont, black)
    Font.Draw ("Note: you cannot change your answers when you click Question 5.", CENTERX - 215, CENTERY + 145, textFont, black)

    % choice a
    drawoval (CENTERX - 280, CENTERY + 110, 10, 10, black) % x = 119, y = 409
    drawfill (CENTERX - 280, CENTERY + 110, OPTIONCOLOUR, black)
    Font.Draw ('a.)', CENTERX - 260, CENTERY + 105, textFont, black)

    % choice b
    drawoval (CENTERX - 100, CENTERY + 110, 10, 10, black) % x = 299, y = 409
    drawfill (CENTERX - 100, CENTERY + 110, OPTIONCOLOUR, black)
    Font.Draw ('b.)', CENTERX - 80, CENTERY + 105, textFont, black)

    % choice c
    drawoval (CENTERX + 80, CENTERY + 110, 10, 10, black) % x = 479, y = 409
    drawfill (CENTERX + 80, CENTERY + 110, OPTIONCOLOUR, black)
    Font.Draw ('c.)', CENTERX + 100, CENTERY + 105, textFont, black)

    % choice d
    drawoval (CENTERX + 260, CENTERY + 110, 10, 10, black) % x = 659, y = 119
    drawfill (CENTERX + 260, CENTERY + 110, OPTIONCOLOUR, black)
    Font.Draw ('d.)', CENTERX + 280, CENTERY + 105, textFont, black)
end selection

%**********selectedA****************************************
% Purpose: To show the user what answer they selected      *
%***********************************************************
proc selectedA
    % change colour of choice a
    drawoval (CENTERX - 280, CENTERY + 110, 10, 10, black) % x = 119, y = 409
    drawfill (CENTERX - 280, CENTERY + 110, SELECTIONCOLOUR, black)
end selectedA

%**********selectedB****************************************
% Purpose: To show the user what answer they selected      *
%***********************************************************
proc selectedB
    % change colour of choice b
    drawoval (CENTERX - 100, CENTERY + 110, 10, 10, black) % x = 299, y = 409
    drawfill (CENTERX - 100, CENTERY + 110, SELECTIONCOLOUR, black)
end selectedB

%**********selectedC****************************************
% Purpose: To show the user what answer they selected      *
%***********************************************************
proc selectedC
    % change colour of choice c
    drawoval (CENTERX + 80, CENTERY + 110, 10, 10, black) % x = 479, y = 409
    drawfill (CENTERX + 80, CENTERY + 110, SELECTIONCOLOUR, black)
end selectedC

%**********selectedD****************************************
% Purpose: To show the user what answer they selected      *
%***********************************************************
proc selectedD
    % change colour of choice d
    drawoval (CENTERX + 260, CENTERY + 110, 10, 10, black) % x = 659, y = 119
    drawfill (CENTERX + 260, CENTERY + 110, SELECTIONCOLOUR, black)
end selectedD

%**********questionNavigator**************************
% Purpose: Allows the user to go back to a previous  *
%          question to change their answer           *
%*****************************************************
proc questionNavigator
    % check if the user has filled in an answer
    for i : 1 .. 5
	if response (i) not= ' ' then
	    drawfilloval (CENTERX + 360, maxy - (240 + 50 * i), 15, 15, ANSWEREDCOLOUR)
	elsif response (i) = ' ' then
	    drawfilloval (CENTERX + 360, maxy - (240 + 50 * i), 15, 15, THEMECOLOUR)
	end if
    end for

    % question one
    Font.Draw ("q.1", CENTERX + 352, maxy - 295, textFont, black)
    % question 2
    Font.Draw ("q.2", CENTERX + 352, maxy - 345, textFont, black)
    % question 3
    Font.Draw ("q.3", CENTERX + 352, maxy - 395, textFont, black)
    % question 4
    Font.Draw ("q.4", CENTERX + 352, maxy - 445, textFont, black)
    % question 5
    Font.Draw ("q.5", CENTERX + 352, maxy - 495, textFont, black)
end questionNavigator

%**********quizResults**********************************
% Purpose: To format the user's quiz results in a more *
%          efficient way.                              *
%*******************************************************
proc quizResults
    colour (black)
    locate (7, 1)
    put "Hold on, I'm computing your score!"
    delay (1500)
    put ""
    % user's score
    put "You scored ", correct, " out of 5."
    put skip
    % show the user what questions they got wrong
    put "Incorrect Answers In:"
    if wrong = 0 then
	put "Nothing. Only perfection."
    elsif wrong = 5 then
	put "Every question."
    elsif wrong <= 4 then
	for i : 1 .. 5
	    if response (i) not= answer (i) then
		put "Question ", i
	    end if
	end for
    end if
    put ""
end quizResults

%**********questionOne**************************************
% Purpose: Present the first multiple choice question, get *
%          the user's selection choice, and assess whether *
%          or not their choice was correct.                *
%***********************************************************
proc questionOne
    % procedure call for the page design
    pageDesign

    % display the question
    Font.Draw ("1.) How many pans are needed for this cake?", CENTERX - 245, maxy - 60, buttonFont, black)

    % display the options
    Font.Draw ("a.) 4", CENTERX - 293, CENTERY + 50, buttonFont, black)         % option a
    Font.Draw ("b.) 2", CENTERX - 113, CENTERY + 50, buttonFont, black)         % option b
    Font.Draw ("c.) 1", CENTERX + 67, CENTERY + 50, buttonFont, black)         % option c
    Font.Draw ("d.) 3", CENTERX + 247, CENTERY + 50, buttonFont, black)         % option d

    % procedure call for the selection choices
    selection

    % assess user's response
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 109 and x <= 129 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (1) := 'a'
	    selectedA
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 289 and x <= 309 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (1) := 'b'
	    selectedB
	    Font.Draw ("Correct", maxx - 100, maxy - 95, buttonFont, green)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 469 and x <= 489 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (1) := 'c'
	    selectedC
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 649 and x <= 669 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (1) := 'd'
	    selectedD
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	end if
    end loop

    % functionality buttons
    drawfilloval (CENTERX + 360, maxy - 290, 20, 20, THEMECOLOUR)
    questionNavigator
    menuButton
end questionOne

%**********questionTwo***************************************
% Purpose: Present the second multiple choice question, get *
%          the user's selection choice, and assess whether  *
%          or not their choice was correct.                 *
%************************************************************
proc questionTwo
    % procedure call for the page design
    pageDesign

    % display the question
    Font.Draw ("2.) Approximately how long do you bake this cake for?", CENTERX - 302, maxy - 60, buttonFont, black)

    % display the options
    Font.Draw ("a.) 55 minutes", CENTERX - 325, CENTERY + 50, answerFont, black)         % option a
    Font.Draw ("b.) 25 minutes", CENTERX - 145, CENTERY + 50, answerFont, black)         % option b
    Font.Draw ("c.) 80 minutes", CENTERX + 35, CENTERY + 50, answerFont, black)         % option c
    Font.Draw ("d.) 40 minutes", CENTERX + 215, CENTERY + 50, answerFont, black)         % option d

    % procedure call for the selection choices
    selection

    % assess user's response
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 109 and x <= 129 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (2) := 'a'
	    selectedA
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 289 and x <= 309 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (2) := 'b'
	    selectedB
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 469 and x <= 489 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (2) := 'c'
	    selectedC
	    Font.Draw ("Correct", maxx - 100, maxy - 95, buttonFont, green)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 649 and x <= 669 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (2) := 'd'
	    selectedD
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	end if
    end loop

    % functionality buttons
    drawfilloval (CENTERX + 360, maxy - 340, 20, 20, THEMECOLOUR)
    questionNavigator
    menuButton
end questionTwo

%**********questionThree*************************************
% Purpose: Present the third multiple choice question, get  *
%          the user's selection choice, and assess whether  *
%          or not their choice was correct.                 *
%************************************************************
proc questionThree
    % procedure call for the page design
    pageDesign

    % display the question
    Font.Draw ("3.) What happens if you invert the cake onto a plate?", CENTERX - 295, maxy - 60, buttonFont, black)

    % display the options
    Font.Draw ("a.) Nothing happens.", CENTERX - 350, CENTERY + 50, answerFont, black)         % option a
    Font.Draw ("b.) You burn yourself.", CENTERX - 180, CENTERY + 10, answerFont, black)         % option b
    Font.Draw ("c.) The cake deflates more.", CENTERX - 20, CENTERY + 50, answerFont, black)         % option c
    Font.Draw ("d.) The cake rises more.", CENTERX + 170, CENTERY + 10, answerFont, black)         % option d

    % procedure call for the selection choices
    selection

    % assess user's response
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 109 and x <= 129 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (3) := 'a'
	    selectedA
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 289 and x <= 309 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (3) := 'b'
	    selectedB
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 469 and x <= 489 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (3) := 'c'
	    selectedC
	    Font.Draw ("Correct", maxx - 100, maxy - 95, buttonFont, green)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 649 and x <= 669 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (3) := 'd'
	    selectedD
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	end if
    end loop

    % functionality buttons
    drawfilloval (CENTERX + 360, maxy - 390, 20, 20, THEMECOLOUR)
    questionNavigator
    menuButton
end questionThree

%**********questionFour**************************************
% Purpose: Present the fourth multiple choice question, get *
%          the user's selection choice, and assess whether  *
%          or not their choice was correct.                 *
%************************************************************
proc questionFour
    % procedure call for the page design
    pageDesign

    % display the question
    Font.Draw ("4.) How many egg yolks do you need?", CENTERX - 202, maxy - 60, buttonFont, black)

    % display the options
    Font.Draw ("a.) 13", CENTERX - 303, CENTERY + 50, buttonFont, black)         % option a
    Font.Draw ("b.) 7", CENTERX - 118, CENTERY + 50, buttonFont, black)         % option b
    Font.Draw ("c.) 4", CENTERX + 62, CENTERY + 50, buttonFont, black)         % option c
    Font.Draw ("d.) 8", CENTERX + 241, CENTERY + 50, buttonFont, black)         % option d

    % procedure call for the selection choices
    selection

    % assess user's response
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 109 and x <= 129 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (4) := 'a'
	    selectedA
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 289 and x <= 309 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (4) := 'b'
	    selectedB
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 469 and x <= 489 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (4) := 'c'
	    selectedC
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 649 and x <= 669 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (4) := 'd'
	    selectedD
	    Font.Draw ("Correct", maxx - 100, maxy - 95, buttonFont, green)
	    exit
	end if
    end loop

    % functionality buttons
    drawfilloval (CENTERX + 360, maxy - 440, 20, 20, THEMECOLOUR)
    questionNavigator
    menuButton
end questionFour

%**********questionFive**************************************
% Purpose: Present the fifth multiple choice question, get  *
%          the user's selection choice, and assess whether  *
%          or not their choice was correct.                 *
%************************************************************
proc questionFive
    % procedure call for the page design
    pageDesign

    % display the question
    Font.Draw ("5.) If using a SPRINGFORM PAN, what extra step must you do?", CENTERX - 360, maxy - 60, buttonFont, black)

    % display the options
    Font.Draw ("a.) Wrap bottom", CENTERX - 350, CENTERY + 50, answerFont, black)         % option a
    Font.Draw ("and sides in", CENTERX - 321, CENTERY + 20, answerFont, black)
    Font.Draw ("foil twice.", CENTERX - 317, CENTERY - 10, answerFont, black)

    Font.Draw ("b.) Line the bottom", CENTERX - 170, CENTERY + 50, answerFont, black)         % option b
    Font.Draw ("and sides with", CENTERX - 141, CENTERY + 20, answerFont, black)
    Font.Draw ("parchment paper.", CENTERX - 149, CENTERY - 10, answerFont, black)

    Font.Draw ("c.) Fill it up", CENTERX + 30, CENTERY + 50, answerFont, black)         % option c
    Font.Draw ("with hot water.", CENTERX + 24, CENTERY + 20, answerFont, black)

    Font.Draw ("d.) Butter up the", CENTERX + 195, CENTERY + 50, answerFont, black)         % option d
    Font.Draw ("pan.", CENTERX + 251, CENTERY + 20, answerFont, black)

    % procedure call for the selection choices
    selection

    % assess user's response
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 109 and x <= 129 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (5) := 'a'
	    selectedA
	    Font.Draw ("Correct", maxx - 100, maxy - 95, buttonFont, green)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 289 and x <= 309 and y >= 399 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (5) := 'b'
	    selectedB
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 469 and x <= 489 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (5) := 'c'
	    selectedC
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	elsif prevButton = MOUSEDOWN and x >= 649 and x <= 669 and y <= 419 and whatdotcolour (x, y) = LIGHTGRAY then
	    flushMouse
	    response (5) := 'd'
	    selectedD
	    Font.Draw ("Incorrect", maxx - 120, maxy - 95, buttonFont, red)
	    exit
	end if
    end loop

    % functionality buttons
    submitButton
    menuButton

    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 599 and x <= 699 and y >= 94 and y <= 139 then
	    flushMouse
	    % erase the submit button
	    drawfillbox (maxx - 100, CENTERY - 205, maxx - 200, CENTERY - 160, white)

	    % erase the functionality button
	    drawfillbox (maxx - 80, CENTERY + 35, maxx, CENTERY - 210, white)

	    % clear the screen and open a new page
	    cls
	    pageDesign
	    menuButton

	    % title
	    Font.Draw ("Quiz Results", CENTERX - 113, maxy - 60, headerFont, black)

	    % calculations of the user's score
	    for indexNum : 1 .. 5
		if response (indexNum) = answer (indexNum) then
		    correct += 1
		elsif response (indexNum) not= answer (indexNum) then
		    wrong += 1
		end if
	    end for

	    % format the output
	    quizResults

	    case correct of
		label 0 :
		    put "C'mon. Are you even trying?!??!"
		label 1 :
		    put "Study harder next time!!"
		label 2 :
		    put "Study the lesson more!"
		label 3 :
		    put "Decent work!"
		    put "You're on your way to becoming a pro!"
		label 4 :
		    put "Wow!"
		    put "You show some serious potential!"
		label 5 :
		    put "Excellent work.."
		    put "Are you sure you aren't a professional baker?"
	    end case

	    % menu button prompt and transfer
	    delay (1000)
	    put ""
	    put "Hit the menu button to return to the main menu." ..
	    mainMenuTransfer
	    exit
	elsif prevButton = MOUSEDOWN and x >= 599 and x <= 699 and y >= 24 and y <= 69 then         % location of menu button
	    flushMouse
	    % exits to main menu and exits this loop
	    cls
	    mainMenu
	    exit
	end if
    end loop
end questionFive

%**********quiz*************************************************************************************
% Purpose: To combine all the questions into one big procedure and put the function buttons to use.*
%***************************************************************************************************
proc quiz
    View.Set ("title:Quiz")
    % reset the value of correct and wrong
    wrong := 0
    correct := 0

    % initialize/reset the responses
    for i : 1 .. 5
	response (i) := ' '
    end for

    % initial quiz page
    questionOne

    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 739 and x <= 779 and y >= 289 and y <= 329 then
	    flushMouse
	    cls
	    % first question
	    questionOne
	elsif prevButton = MOUSEDOWN and x >= 739 and x <= 779 and y >= 239 and y <= 279 then
	    cls
	    % second question
	    questionTwo
	elsif prevButton = MOUSEDOWN and x >= 739 and x <= 779 and y >= 189 and y <= 229 then
	    cls
	    % third question
	    questionThree
	elsif prevButton = MOUSEDOWN and x >= 739 and x <= 779 and y >= 139 and y <= 179 then
	    cls
	    % fourth question
	    questionFour
	elsif prevButton = MOUSEDOWN and x >= 739 and x <= 779 and y >= 89 and y <= 129 then
	    cls
	    % fifth question
	    questionFive
	    exit
	elsif prevButton = MOUSEDOWN and x >= 599 and x <= 699 and y >= 24 and y <= 69 then         % location of menu button
	    flushMouse
	    % exits to main menu and exits this loop
	    cls
	    mainMenu
	    exit
	end if
    end loop
end quiz
%--------------------------------------------------------------


%--------------------------------------------------------------
% animation procedure(s)

%**********preheatTemp***********************************************
% Purpose: To show the user what temperature to preheat the oven to *
%********************************************************************
proc preheatTemp
    View.Set ("nooffscreenonly")
    % background
    drawfillbox (0, 0, maxx, maxy, BACKGROUND)
    % text
    Font.Draw ("320°F", CENTERX - 95, CENTERY + 50, clockAndTempText, white)
    Font.Draw ("(160°C)", CENTERX - 116, CENTERY - 50, clockAndTempText, white)

    % delay and cls
    delay (2500)
    cls
end preheatTemp

%**********stovetop*************************************************
% Purpose: To draw the stovetop                                    *
%*******************************************************************
proc stovetop
    drawfillbox (0, 0, maxx, maxy, STOVETOPCOLOUR)
    % stovetop markings (using thick ovals)
    for thickness : 1 .. 5
	drawoval (CENTERX, CENTERY, 295 - thickness, 295 - thickness, STOVETOPMARKINGS)
	drawoval (CENTERX, CENTERY, 245 - thickness, 245 - thickness, STOVETOPMARKINGS)
    end for

    % small pot
    drawoval (CENTERX, CENTERY, 260, 260, black)
    for thickness : 1 .. 30
	drawfilloval (CENTERX, CENTERY, 260 - thickness, 260 - thickness, SMALLPOTCOLOUR)
    end for
    % bottom of the pot (to add depth)
    drawoval (CENTERX, CENTERY, 230, 230, black)
    for thickness : 1 .. 230
	drawoval (CENTERX, CENTERY, 230 - thickness, 230 - thickness, SMALLPOTCOLOUR2)
    end for

    % pot handle
    drawfillbox (CENTERX - 49, CENTERY - 256, CENTERY + 149, 0, POTHANDLECOLOUR)
end stovetop

%**********butter****************************************************
% Purpose: To show the final frame of where the butter will be      *
%********************************************************************
proc butter (x : int, y : int)
    % the butter
    drawfillbox (219 + x, 376 + y, 244 + x, 401 + y, BUTTER)
    drawbox (219 + x, 376 + y, 244 + x, 401 + y, black)
    drawfillbox (215 + x, 360 + y, 244 + x, 331 + y, BUTTER)
    drawbox (215 + x, 360 + y, 244 + x, 331 + y, black)
    drawfillbox (216 + x, 275 + y, 246 + x, 305 + y, BUTTER)
    drawbox (216 + x, 275 + y, 246 + x, 305 + y, black)
    drawfillbox (215 + x, 234 + y, 247 + x, 269 + y, BUTTER)
    drawbox (215 + x, 234 + y, 247 + x, 269 + y, black)
    drawfillbox (217 + x, 184 + y, 240 + x, 208 + y, BUTTER)
    drawbox (217 + x, 184 + y, 240 + x, 208 + y, black)
end butter

%**********ingredientBowl********************************************
% Purpose: To show the final frame of where the bowl will be        *
%********************************************************************
proc ingredientBowl (x : int, y : int)
    drawfilloval (CENTERX - 239 + x, CENTERY + y, 20, 150, BOWLCOLOUR)
    drawoval (CENTERX - 239 + x, CENTERY + y, 20, 150, black)
    drawarc (CENTERX - 239 + x, CENTERY + y, 120, 150, 90, 270, black)
    drawfill (CENTERX - 339 + x, CENTERY + y, BOWLCOLOUR, black)
end ingredientBowl

%**********creamCheese*************************************************
% Purpose: To show the final frame of where the cream cheese will be  *
%**********************************************************************
proc creamCheese (x : int, y : int)
    drawfilloval (CENTERX - 93 + x, CENTERY + y, 30, 115, white)
    drawoval (CENTERX - 93 + x, CENTERY + y, 30, 115, black)
end creamCheese

%**********whiskerPosition******************************************
% Purpose: To help with displaying the position of the whisk       *
%*******************************************************************
proc whiskerPosition (x : int, y : int)
    Pic.SetTransparentColour (whisker, white)
    Pic.Draw (whisker, CENTERX - 380 + x, CENTERY - 500 + y, picMerge)
end whiskerPosition

%**********milk*****************************************************
% Purpose: To show the final frame of where the milk will be       *
%*******************************************************************
proc milk (x : int, y : int)
    drawfilloval (CENTERX - 144 + x, CENTERY + y, 70, 100, white)
end milk

%**********stovetopMixing********************************************
% Purpose: To show the user what ingredients are being mixed in over*
%          the stovetop to make the cream cheese mixture            *
%********************************************************************
proc stovetopMixing
    % stovetop picture
    stovetop

    % to reduce choppiness
    View.Set ("offscreenonly")

    % delay before the ingredients are added
    delay (500)

    % butter gets added
    % the bowl
    for position : 1 .. 19
	% text to label what's being added
	Font.Draw ("Butter", CENTERX - 380, maxy - 50, headerFont, BUTTER)
	% the bowl
	drawfilloval (CENTERX - (259 - position), CENTERY, 40 - position, 150, BOWLCOLOUR)
	drawoval (CENTERX - (259 - position), CENTERY, 40 - position, 150, black)
	drawarc (CENTERX - (259 - position), CENTERY, 140 - position, 150, 90, 270, black)
	drawfill (CENTERX - (359 - position), CENTERY, BOWLCOLOUR, black)

	% the butter
	drawfillbox (125 + position, 360, 154 + position, 331, BUTTER)
	drawbox (125 + position, 360, 154 + position, 331, black)
	drawfillbox (126 + position, 275, 156 + position, 305, BUTTER)
	drawbox (126 + position, 275, 156 + position, 305, black)
	drawfillbox (127 + position, 184, 150 + position, 208, BUTTER)
	drawbox (127 + position, 184, 150 + position, 208, black)
	drawfillbox (125 + position, 234, 157 + position, 269, BUTTER)
	drawbox (125 + position, 234, 157 + position, 269, black)
	drawfillbox (129 + position, 376, 154 + position, 401, BUTTER)
	drawbox (129 + position, 376, 154 + position, 401, black)

	% delay for next frame
	View.Update
	delay (5)

	stovetop
    end for

    % text to label what's being added
    Font.Draw ("Butter", CENTERX - 380, maxy - 50, headerFont, BUTTER)

    % finished frame of the bowl
    ingredientBowl (0, 0)

    % the butter
    drawfillbox (145, 360, 174, 331, BUTTER)
    drawbox (145, 360, 174, 331, black)
    drawfillbox (146, 275, 176, 305, BUTTER)
    drawbox (146, 275, 176, 305, black)
    drawfillbox (147, 184, 170, 208, BUTTER)
    drawbox (147, 184, 170, 208, black)
    drawfillbox (145, 234, 177, 269, BUTTER)
    drawbox (145, 234, 177, 269, black)
    drawfillbox (149, 376, 174, 401, BUTTER)
    drawbox (149, 376, 174, 401, black)

    delay (100)

    for position : 1 .. 70
	% text to label what's being added
	Font.Draw ("Butter", CENTERX - 380, maxy - 50, headerFont, BUTTER)

	% butter dropping into the pot
	drawfillbox (149 + position, 376, 174 + position, 401, BUTTER)
	drawbox (149 + position, 376, 174 + position, 401, black)
	drawfillbox (145 + position, 360, 174 + position, 331, BUTTER)
	drawbox (145 + position, 360, 174 + position, 331, black)
	drawfillbox (146 + position, 275, 176 + position, 305, BUTTER)
	drawbox (146 + position, 275, 176 + position, 305, black)
	drawfillbox (145 + position, 234, 177 + position, 269, BUTTER)
	drawbox (145 + position, 234, 177 + position, 269, black)
	drawfillbox (147 + position, 184, 170 + position, 208, BUTTER)
	drawbox (147 + position, 184, 170 + position, 208, black)

	% delay for next frame
	View.Update
	delay (5)

	% the stove
	stovetop

	% the bowl
	ingredientBowl (0, 0)
    end for

    % refresh the image
    stovetop

    % the butter
    butter (0, 0)

    % delay for the next set of frames (adding cream cheese)
    delay (500)

    % adding the cream cheese
    for position : 1 .. 19
	% text to label what's being added
	Font.Draw ("Cream Cheese", CENTERX - 380, maxy - 40, questionFont, BUTTER)

	% the bowl
	drawfilloval (CENTERX - (259 - position), CENTERY, 40 - position, 150, BOWLCOLOUR)
	drawoval (CENTERX - (259 - position), CENTERY, 40 - position, 150, black)
	drawarc (CENTERX - (259 - position), CENTERY, 140 - position, 150, 90, 270, black)
	drawfill (CENTERX - (359 - position), CENTERY, BOWLCOLOUR, black)

	% cream cheese
	drawfilloval (CENTERX - (264 - position), CENTERY, 34 - position, 100, white)
	drawoval (CENTERX - (264 - position), CENTERY, 34 - position, 100, black)

	% delay and refresh screen
	View.Update
	delay (5)

	% the stove
	stovetop
	butter (0, 0)
    end for

    % text to label what's being added
    Font.Draw ("Cream Cheese", CENTERX - 380, maxy - 40, questionFont, BUTTER)

    % the bowl
    ingredientBowl (0, 0)

    % cream cheese
    drawfilloval (CENTERX - 243, CENTERY, 15, 100, white)
    drawoval (CENTERX - 243, CENTERY, 15, 100, black)


    for position : 1 .. 149
	% text to label what's being added
	Font.Draw ("Cream Cheese", CENTERX - 380, maxy - 40, questionFont, BUTTER)

	% cream cheese
	drawfilloval (CENTERX - 243 + position, CENTERY, 15, 100, white)
	drawoval (CENTERX - 243 + position, CENTERY, 15, 100, black)

	% delay and refresh screen
	View.Update
	delay (5)

	% the stove, butter and the bowl
	stovetop
	butter (0, 0)
	ingredientBowl (0, 0)
    end for

    % final position of the cream cheese and size
    for thickness : 1 .. 15
	% text to label what's being added
	Font.Draw ("Cream Cheese", CENTERX - 380, maxy - 40, questionFont, BUTTER)
	% cream cheese
	drawfilloval (CENTERX - 93, CENTERY, 15 + thickness, 100 + thickness, white)
	drawoval (CENTERX - 93, CENTERY, 15 + thickness, 100 + thickness, black)

	% delay and refresh screen
	View.Update
	delay (5)

	% the stove, butter and the bowl
	stovetop
	butter (0, 0)
    end for

    % the cream cheese
    creamCheese (0, 0)

    % delay for the next set of frames (adding the milk)
    delay (500)

    % adding the milk
    for position : 1 .. 19
	% text to label what's being added
	Font.Draw ("Milk", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	% the bowl
	drawfilloval (CENTERX - (259 - position), CENTERY, 40 - position, 150, BOWLCOLOUR)
	drawoval (CENTERX - (259 - position), CENTERY, 40 - position, 150, black)
	drawarc (CENTERX - (259 - position), CENTERY, 140 - position, 150, 90, 270, black)
	drawfill (CENTERX - (359 - position), CENTERY, BOWLCOLOUR, black)

	% milk
	drawfilloval (CENTERX - (264 - position), CENTERY, 34 - position, 100, white)
	drawfillbox (CENTERX - (264 - position), CENTERY + 25, CENTERX - (238 - position), CENTERY - 25, white)

	% delay and refresh screen
	View.Update
	delay (5)

	% the stove
	stovetop
	butter (0, 0)
	creamCheese (0, 0)
    end for

    for position : 1 .. 75
	% text to label what's being added
	Font.Draw ("Milk", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	% milk being poured into the pot
	ingredientBowl (0, 0)
	drawfilloval (CENTERX - 245, CENTERY, 15, 100 - position, white)
	drawfillbox (CENTERX - 245, CENTERY + 25, CENTERX - (219 - position), CENTERY - 25, white)

	% delay and refresh screen
	View.Update
	delay (5)

	% setting
	stovetop
	butter (0, 0)
	creamCheese (0, 0)
    end for

    for volume : 1 .. 50
	% text to label what's being added
	Font.Draw ("Milk", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	% milk being poured into the pot
	ingredientBowl (0, 0)
	drawfillbox (CENTERX - (245 - volume * 2), CENTERY + 25, CENTERX - 144, CENTERY - 25, white)
	% milk spreading to fill its container (property of a liquid)
	drawfilloval (CENTERX - 144, CENTERY, volume - 30, volume, white)

	% delay and refresh screen
	View.Update
	delay (5)

	% setting
	stovetop
	butter (0, 0)
	creamCheese (0, 0)
    end for

    % milk expanding
    for volume : 1 .. 50
	% text to label what's being added
	Font.Draw ("Milk", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	% milk spreading to fill its container (property of a liquid)
	drawfilloval (CENTERX - 144, CENTERY, 20 + volume, 50 + volume, white)

	% delay and refresh screen
	View.Update
	delay (5)

	% setting
	stovetop
	butter (0, 0)
	creamCheese (0, 0)
    end for

    % final frame for milk
    milk (0, 0)

    % mixing frames
    for repetition : 1 .. 5
	% delay and refresh screen
	View.Update
	delay (250)
	cls

	% ingredients and whisk
	stovetop
	butter (0, 0)
	creamCheese (0, 0)
	milk (0, 0)
	whiskerPosition (0, 0)

	% delay and refresh screen
	View.Update
	delay (250)
	cls

	% next frame
	stovetop
	butter (100, 100)
	creamCheese (100, 100)
	milk (100, 100)
	whiskerPosition (100, 100)

	% delay and refresh screen
	View.Update
	delay (250)
	cls

	% next frame
	stovetop
	butter (200, 0)
	creamCheese (200, 0)
	milk (200, 0)
	whiskerPosition (200, 0)

	% delay and refresh screen
	View.Update
	delay (250)
	cls

	% next frame
	stovetop
	butter (100, -100)
	creamCheese (100, -100)
	milk (100, -100)
	whiskerPosition (100, -100)
    end for

    % next frame
    stovetop
    for thickness : 1 .. 229
	drawoval (CENTERX, CENTERY, 229 - thickness, 229 - thickness, CREAMCHEESECOLOUR)
    end for

    % delay and cls
    View.Update
    delay (2500)
    cls
end stovetopMixing

%**********tableSetting***************************************
% Purpose: To display the elements of the table settings.    *
%*************************************************************
proc tableSetting
    % the background
    drawfillbox (0, maxy, maxx, maxy - 480, WALLCOLOUR)
    % the table
    drawfillbox (0, maxy - 481, maxx, 0, STOVETOPCOLOUR)
end tableSetting

%**********bowl2**********************************************
% Purpose: To draw a bowl from the side view.                *
%*************************************************************
proc bowl2
    % the bowl
    drawarc (CENTERX - 100, maxy - 450, 110, 80, 180, 0, black)
    drawline (CENTERX - 210, maxy - 450, CENTERX + 10, maxy - 450, black)
    drawfill (CENTERX - 200, maxy - 460, TRANSPARENTWHITE, black)
    drawoval (CENTERX - 100, maxy - 525, 40, 3, DARKGRAY)
end bowl2

%**********eggYolks*******************************************
% Purpose: To draw the egg yolks in an efficient manner.     *
%*************************************************************
proc eggYolks
    % drawing the egg yolks
    drawfilloval (CENTERX - 100, maxy - 510, 18, 7, YOLKCOLOUR)
    drawarc (CENTERX - 100, maxy - 510, 18, 7, 317, 267, black)
    drawfilloval (CENTERX - 70, maxy - 510, 18, 7, YOLKCOLOUR)
    drawarc (CENTERX - 70, maxy - 510, 18, 7, 300, 267, black)
    drawfilloval (CENTERX - 135, maxy - 517, 18, 7, YOLKCOLOUR)
    drawarc (CENTERX - 135, maxy - 517, 18, 7, 19, 290, black)
    drawfilloval (CENTERX - 130, maxy - 509, 18, 7, YOLKCOLOUR)
    drawarc (CENTERX - 130, maxy - 509, 18, 7, 317, 267, black)
    drawoval (CENTERX - 120, maxy - 520, 15, 6, black)
    drawfill (CENTERX - 121, maxy - 520, YOLKCOLOUR, black)
    drawfilloval (CENTERX - 65, maxy - 520, 14, 4, YOLKCOLOUR)
    drawarc (CENTERX - 65, maxy - 520, 14, 4, 234, 145, black)
    drawoval (CENTERX - 88, maxy - 520, 15, 6, black)
    drawfill (CENTERX - 88, maxy - 520, YOLKCOLOUR, black)
end eggYolks

%**********whiskingEggs***************************************
% Purpose: To display the image and animate whisking eggs.   *
%*************************************************************
proc whiskingEggs (x : int, y : int)
    % the whisks
    Pic.SetTransparentColour (whiskRight, white)
    Pic.SetTransparentColour (whiskLeft, white)

    % text to label what's being added
    Font.Draw ("Egg Yolks", CENTERX - 380, maxy - 40, headerFont, BUTTER)

    Pic.Draw (whiskRight, x, y, picMerge)

    % delay and prep the next frame
    View.Update
    delay (300)
    cls

    % setting, bowls, and yolks
    tableSetting
    bowl2
    eggYolks

    % text to label what's being added
    Font.Draw ("Egg Yolks", CENTERX - 380, maxy - 40, headerFont, BUTTER)

    Pic.Draw (whiskLeft, x - 75, y, picMerge)

    % delay and prep the next frame
    View.Update
    delay (300)
    cls

    % setting, bowls, and yolks
    tableSetting
    bowl2
    eggYolks
end whiskingEggs

%**********beatenYolks*****************************************
% Purpose: To show the finished frame of the beaten egg yolks.*
%**************************************************************
proc beatenYolks
    % the bowl
    bowl2
    % yolks
    drawarc (CENTERX - 100, maxy - 450, 110, 80, 180, 0, black)
    drawline (CENTERX - 207, maxy - 470, CENTERX + 7, maxy - 470, black)
    drawfill (CENTERX - 180, maxy - 480, YOLKCOLOUR, black)
end beatenYolks

%**********addingMixture**************************************
% Purpose: To show the process of adding the cream cheese    *
%          mixture into the whisked egg yolks.               *
%*************************************************************
proc addingMixture (x : int, y : int)
    % cream cheese mixture being added
    drawfilloval (CENTERX - 340 - x, CENTERY + 100 - y, 30, 100, SMALLPOTCOLOUR)
    drawfillbox (CENTERX - 340 - x, CENTERY - y, CENTERX - 230 - x, CENTERY + 200 - y, SMALLPOTCOLOUR)
    drawline (CENTERX - 228 - x, CENTERY + 200 - y, CENTERX - 340 - x, CENTERY + 200 - y, black)
    drawline (CENTERX - 228 - x, CENTERY - y, CENTERX - 340 - x, CENTERY - y, black)
    drawarc (CENTERX - 340 - x, CENTERY + 100 - y, 30, 100, 90, 270, black)
    drawfilloval (CENTERX - 230 - x, CENTERY + 100 - y, 30, 100, SMALLPOTCOLOUR)
    drawoval (CENTERX - 230 - x, CENTERY + 100 - y, 30, 100, black)

    Pic.SetTransparentColour (drizzle, white)
    Pic.Draw (drizzle, 133 - x, -10 - y, picMerge)
end addingMixture

%**********whiskingFrames*************************************
% Purpose: To display the image and animate the whisking.    *
%*************************************************************
proc whiskingFrames (x : int, y : int)
    % the whisks
    Pic.SetTransparentColour (whiskRight, white)
    Pic.SetTransparentColour (whiskLeft, white)

    % cream cheese mixture being added
    addingMixture (50, 2)

    % whisk
    Pic.Draw (whiskRight, x, y, picMerge)

    % delay and prep the next frame
    View.Update
    delay (300)
    cls

    % setting, bowls, and yolks
    tableSetting
    beatenYolks

    % cream cheese mixture being added
    addingMixture (50, 2)

    % whisk
    Pic.Draw (whiskLeft, x - 75, y, picMerge)

    % delay and prep the next frame
    View.Update
    delay (300)
    cls

    % setting, bowls, and yolks
    tableSetting
    beatenYolks
end whiskingFrames

%**********sifting*************************************************
% Purpose: To show the action of sifting the flour and cornstarch *
%          into the egg yolks.                                    *
%******************************************************************
proc sifting
    View.Set ("offscreenonly")
    % image of sift
    for repetition : 1 .. 5
	for yDown : 50 .. 100
	    Pic.Draw (sifter, CENTERX - 415, maxy - (200 + yDown), picMerge)
	    Font.Draw ("Flour & Cornstarch", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	    % delay for next frame
	    View.Update
	    delay (5)

	    % next frame
	    tableSetting
	    beatenYolks
	end for

	Pic.Draw (sifter, CENTERX - 415, maxy - 300, picMerge)
	Font.Draw ("Flour & Cornstarch", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	% flour and cornstarch
	for particles : 1 .. 200
	    % x location of the particles
	    randint (xSifting, CENTERX - 200, CENTERX)
	    % y location of the particles
	    randint (ySifting, maxy - 470, maxy - 245)

	    % particles
	    drawfillbox (xSifting, ySifting, xSifting + 2, ySifting + 2, white)

	    % delay for next frame
	    View.Update
	    delay (5)
	end for

	for decreasing yUp : 99 .. 50
	    Pic.Draw (sifter, CENTERX - 415, maxy - (200 + yUp), picMerge)
	    Font.Draw ("Flour & Cornstarch", CENTERX - 380, maxy - 40, headerFont, BUTTER)

	    % delay for next frame
	    View.Update
	    delay (5)

	    % next frame
	    tableSetting
	    beatenYolks
	end for
    end for
end sifting

%**********eggWhites******************************************
% Purpose: To display the positioning of the egg whites.     *
%*************************************************************
proc eggWhites
    % bowl
    bowl2

    % egg whites
    drawarc (CENTERX - 100, maxy - 450, 110, 80, 180, 0, black)
    drawline (CENTERX - 207, maxy - 470, CENTERX + 7, maxy - 470, black)
    drawfill (CENTERX - 180, maxy - 480, white, black)
end eggWhites

%**********addingSugar******************************************
% Purpose: To show the step of adding sugar to the egg whites. *
%***************************************************************
proc addingSugar
    % sugar
    for particles : 1 .. 100
	% text to label what's being added
	Font.Draw ("Sugar into Egg Whites", CENTERX - 380, maxy - 40, headerFont, BUTTER)
	% x location of the particles
	randint (xSugar, CENTERX - 150, CENTERX - 50)
	% y location of the particles
	randint (ySugar, maxy - 470, maxy - 200)

	% particles
	drawfillbox (xSugar, ySugar, xSugar + 2, ySugar + 2, white)

	% delay for next frame
	View.Update
	delay (5)
    end for
end addingSugar

%**********whiskingFrames2************************************
% Purpose: To display the image and animate the whisking.    *
%*************************************************************
proc whiskingFrames2 (x : int, y : int)
    % the whisks
    Pic.SetTransparentColour (whiskRight, white)
    Pic.SetTransparentColour (whiskLeft, white)

    Pic.Draw (whiskRight, x, y, picMerge)

    addingSugar

    % delay and prep the next frame
    View.Update
    delay (150)
    cls

    % setting, bowls, and egg whites
    tableSetting
    eggWhites

    Pic.Draw (whiskLeft, x - 75, y, picMerge)

    addingSugar

    % delay and prep the next frame
    View.Update
    delay (150)
    cls

    % setting, bowls, and yolks
    tableSetting
    eggWhites
end whiskingFrames2

%**********finishedYolks**********************************
% Purpose: To show the final frame of the yolk mixture.  *
%*********************************************************
proc finishedYolks
    % setting
    tableSetting
    bowl2
    % the egg mixture
    drawarc (CENTERX - 100, maxy - 450, 110, 80, 180, 0, black)
    drawline (CENTERX - 207, maxy - 470, CENTERX + 7, maxy - 470, black)
    drawfill (CENTERX - 180, maxy - 480, EGGMIXTURE, black)
end finishedYolks

%**********beatingEggs****************************************
% Purpose: To visualize the process of beating the egg yolks *
%          and the egg whites being mixed in with the cream  *
%          cheese mixture.                                   *
%*************************************************************
proc beatingEggs
    % setting
    tableSetting

    % text to label what's being added
    Font.Draw ("Egg Yolks", CENTERX - 380, maxy - 40, headerFont, BUTTER)

    % the bowl
    bowl2

    % egg yolks
    eggYolks

    % whisking animation
    for repetition : 1 .. 5
	whiskingEggs (130, 75)
    end for

    % next frame
    % the whisked eggs
    tableSetting
    beatenYolks

    % delay for next frame
    View.Update
    delay (1500)

    % sifter
    sifting

    % delay for the next frame
    delay (500)

    % whisking animation
    for repetition : 1 .. 5
	whiskingFrames (130, 75)
    end for

    % new frame
    finishedYolks
    View.Update

    % delay for the next frame
    delay (1500)

    % new frame
    tableSetting
    bowl2
    % the egg whites
    eggWhites
    View.Update

    % whisking the egg whites
    for repetition : 1 .. 7
	whiskingFrames2 (130, 75)
    end for

    % finished frame
    tableSetting
    eggWhites

    % peaks in the egg whites
    drawfilloval (CENTERX - 147, maxy - 470, 50, 10, white)
    drawarc (CENTERX - 147, maxy - 470, 50, 10, 0, 180, black)
    drawfilloval (CENTERX - 67, maxy - 470, 70, 10, white)
    drawarc (CENTERX - 67, maxy - 470, 70, 10, 0, 136, black)
    View.Update

    % delay and cls
    View.Update
    delay (2500)
    cls
end beatingEggs

%**********finalWhisk*************************************
% Purpose: To show the process of mixing the egg whites  *
%          with the batter.                              *
%*********************************************************
proc finalWhisk (x : int, y : int)
    % the whisks
    Pic.SetTransparentColour (whiskRight, white)
    Pic.SetTransparentColour (whiskLeft, white)

    % setting, bowls, and yolks
    finishedYolks
    Pic.Draw (eggMix3, 100, 30, picMerge)

    Pic.Draw (whiskRight, x, y, picMerge)

    % delay and prep the next frame
    View.Update
    delay (150)
    cls

    % setting, bowls, and yolks
    finishedYolks
    Pic.Draw (eggMix3, 100, 30, picMerge)

    Pic.Draw (whiskLeft, x - 75, y, picMerge)

    % delay and prep the next frame
    View.Update
    delay (150)
    cls
end finalWhisk

%**********mixingEggWhites********************************
% Purpose: To show the egg whites being mixed with the   *
%          cream cheese mixture.                         *
%*********************************************************
proc mixingEggWhites
    % the bowls
    Pic.SetTransparentColour (eggMix, white)
    Pic.SetTransparentColour (eggMix2, white)
    % egg whites
    Pic.SetTransparentColour (eggMix3, white)

    for i : 1 .. 4
	% the bowl & the egg whites
	finishedYolks
	Pic.Draw (eggMix, 100, 177, picMerge)

	% delay
	View.Update
	delay (500)

	% next frame
	cls
	finishedYolks
	Pic.Draw (eggMix2, 100, 30, picMerge)

	% delay
	View.Update
	delay (500)
	cls

	for whisking : 1 .. 3
	    finalWhisk (130, 75)
	end for

	finishedYolks

	% delay
	View.Update
	delay (500)
    end for

    % delay and cls
    View.Update
    delay (2500)
end mixingEggWhites

%**********smallPan*****************************************
% Purpose: To draw the pan the batter will be poured into. *
%***********************************************************
proc smallPan (x : int, y : int)
    % the pan
    drawfilloval (CENTERX + x, CENTERY + y, 250, 250, LIGHTGRAY)
    for radius : 1 .. 224
	drawfilloval (CENTERX + x, CENTERY + y, radius, radius, white)
    end for
    drawoval (CENTERX + x, CENTERY + y, 250, 250, black)
    drawoval (CENTERX + x, CENTERY + y, 225, 225, black)
end smallPan

%**********batterPouring**********************************
% Purpose: To prep the batter for being baked.           *
%*********************************************************
proc batterPouring
    % table colour
    drawfillbox (0, 0, maxx, maxy, STOVETOPCOLOUR)

    % pan
    smallPan (0, 0)

    % batter being poured
    for i : 1 .. 133
	ingredientBowl (140, 0)
	drawfilloval (CENTERX - 100, CENTERY, 15, 148 - i, EGGMIXTURE)
	drawfillbox (CENTERX - 100, CENTERY + 15, CENTERX, CENTERY - 15, EGGMIXTURE)

	% delay and view update
	View.Update
	delay (25)
    end for

    for streamLength : 1 .. 100
	ingredientBowl (140, 0)
	drawfillbox (CENTERX - (100 - streamLength), CENTERY + 15, CENTERX, CENTERY - 15, EGGMIXTURE)

	% delay and view update
	View.Update
	delay (25)

	drawfillbox (CENTERX - (100 - streamLength), CENTERY + 15, CENTERX, CENTERY - 15, white)
    end for

    for radius : 1 .. 209
	drawfilloval (CENTERX, CENTERY, 15 + radius, 15 + radius, EGGMIXTURE)
	ingredientBowl (140, 0)

	% delay and view update
	View.Update
	delay (25)
    end for

    % delay and cls
    View.Update
    delay (2500)
    cls
end batterPouring

%**********batterPan******************************************
% Purpose: To show the final frame of the batter in the pan. *
%*************************************************************
proc batterPan (x : int, y : int)
    % pan
    smallPan (x, y)

    % batter
    for radius : 1 .. 224
	drawfilloval (CENTERX + x, CENTERY + y, radius, radius, EGGMIXTURE)
    end for

    % avoid stuttering
    View.Update
end batterPan

%**********largePan***************************************
% Purpose: To draw the pan that the batter pan will be   *
%          placed in.                                    *
%*********************************************************
proc largePan
    % table colour
    drawfillbox (0, 0, maxx, maxy, STOVETOPCOLOUR)

    % large pan
    drawfilloval (CENTERX, CENTERY, 275, 275, SMALLPOTCOLOUR)
    for i : 1 .. 250
	drawfilloval (CENTERX, CENTERY, i, i, SMALLPOTCOLOUR2)
    end for
    drawoval (CENTERX, CENTERY, 275, 275, black)
    drawoval (CENTERX, CENTERY, 250, 250, black)

    % paper towels
    drawbox (CENTERX - 140, CENTERY + 200, CENTERX, CENTERY - 200, black)
    drawbox (CENTERX + 140, CENTERY + 200, CENTERX, CENTERY - 200, black)
    drawfill (CENTERX - 100, CENTERY + 150, white, black)
    drawfill (CENTERX + 100, CENTERY + 150, white, black)
end largePan

%**********placingPans************************************
% Purpose: To place the batter pan into the larger pan.  *
%*********************************************************
proc placingPans
    View.Set ("offscreenonly")
    % smaller pan
    for position : 1 .. CENTERY
	% large pan
	largePan
	batterPan (0, (-CENTERY + position))

	% delay
	View.Update
	delay (1)
    end for

    % text to label what's being added
    Font.Draw ("Add hot water", CENTERX - 380, maxy - 40, headerFont, BUTTER)

    % delay before next frame
    View.Update
    delay (1000)

    % add the water
    drawfilloval (CENTERX, CENTERY, 274, 274, WATERCOLOUR)
    batterPan (0, 0)

    % delay and cls
    View.Update
    delay (2500)
    cls
end placingPans

%**********bakingTime1**************************************
% Purpose: To show the user how long they need to bake the *
%          cake for.                                       *
%***********************************************************
proc bakingTime1
    View.Set ("nooffscreenonly")
    for minutes : 0 .. 25
	% background
	drawfillbox (0, 0, maxx, maxy, BACKGROUND)

	% time formatting
	locate (maxrow div 2, maxcol div 2 - 2)
	colourback (black)
	colour (white)
	if minutes < 10 then
	    put "12:0", minutes ..
	elsif minutes = 10 then
	    put "12:10" ..
	elsif minutes > 10 then
	    put "12:", minutes ..
	end if

	% delay
	delay (250)

    end for
    % delay and cls
    delay (2500)
    colourback (white)
    cls
end bakingTime1

%**********tempChange****************************************
% Purpose: To tell the user to change the oven temperature. *
%************************************************************
proc tempChange
    % background
    drawfillbox (0, 0, maxx, maxy, BACKGROUND)
    % text
    Font.Draw ("Reduce to 285°F", CENTERX - 269, CENTERY + 50, clockAndTempText, white)
    Font.Draw ("(140°C)", CENTERX - 116, CENTERY - 50, clockAndTempText, white)

    % delay and cls
    delay (2500)
    cls
end tempChange

%**********bakingTime2**************************************
% Purpose: To show the user how long they need to bake the *
%          cake again.                                     *
%***********************************************************
proc bakingTime2
    for minutes : 25 .. 80
	% background
	drawfillbox (0, 0, maxx, maxy, BACKGROUND)

	% time formatting
	locate (maxrow div 2, maxcol div 2 - 2)
	colourback (black)
	colour (white)
	if minutes < 60 then
	    put "12:", minutes ..
	elsif minutes = 60 then
	    locate (maxrow div 2, maxcol div 2 - 1)
	    put "1:00" ..
	elsif minutes > 60 and minutes < 70 then
	    locate (maxrow div 2, maxcol div 2 - 1)
	    put "1:0", minutes mod 60 ..
	elsif minutes >= 70 then
	    locate (maxrow div 2, maxcol div 2 - 1)
	    put "1:", minutes mod 60 ..
	end if

	% delay
	delay (150)

    end for
    % delay and cls
    delay (2500)
    colourback (white)
    cls
end bakingTime2

%**********animation**************************************
% Purpose: To combine all animation procedures into one. *
%*********************************************************
proc animation
    View.Set ("title:Animation")
    % animation fragments
    preheatTemp
    stovetopMixing
    beatingEggs
    mixingEggWhites
    batterPouring
    placingPans
    bakingTime1
    tempChange
    bakingTime2

    % procedure call for the page design
    pageDesign

    % page header
    Font.Draw ("Enjoy!", CENTERX - 55, maxy - 60, headerFont, black)

    % picture
    Pic.Draw (bakedCake, CENTERX - 400, CENTERY - 300, picMerge)
    menuButton
    loop
	mousewhere (x, y, prevButton)
	if prevButton = MOUSEDOWN and x >= 599 and x <= 699 and y >= 24 and y <= 69 then         % location of menu button
	    flushMouse
	    % exits to main menu and exits this loop
	    cls
	    mainMenu
	    exit
	end if
    end loop
end animation
%-----------------------------------------------------------------------------------------------------------------


%-----------------------------------------------------------------------------------------------------------------
% MAIN PROGRAM

% display the main menu
mainMenu

% main loop
loop
    mousewhere (x, y, prevButton)
    % exit button
    % exit when the user hits the quit button
    if prevButton = MOUSEDOWN and x >= 349 and x <= 449 and y >= 69 and y <= 139 then
	flushMouse
	exit
	% lesson
    elsif prevButton = MOUSEDOWN and x >= 319 and x <= 479 and y >= 399 and y <= 469 then
	flushMouse
	cls
	lesson
	% quiz
    elsif prevButton = MOUSEDOWN and x >= 319 and x <= 479 and y >= 289 and y <= 359 then
	flushMouse
	cls
	quiz
	% animation
    elsif prevButton = MOUSEDOWN and x >= 319 and x <= 479 and y >= 179 and y <= 249 then
	flushMouse
	cls
	animation
    end if
end loop

% close the run window (user exits the app after hitting quit)
Window.Close (runWindow)
