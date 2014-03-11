import os, sys, pygame #includes
from Laser import Laser
from pygame.locals import *
from random import randint

class Battlecruiser(pygame.sprite.Sprite):
    ''' a laser that moves forwards at a steady speen when created. '''
    def load_image(self, image_name):
        try:
            image = pygame.image.load(image_name)
        except pygame.error, message:
            raise SystemExit, "Cannot load image: "+image_name
        return image.convert_alpha()

    def load_sound(self, sound_name):
        try:
            sound = pygame.mixer.Sound(sound_name)
        except pygame.error, message:
            print "Cannot load sound: " + sound_name
            raise SystemExit, message
        return sound

    def __init__(self, screen, img_filename, init_x, init_y):
        pygame.sprite.Sprite.__init__(self) #pygame sprite init
        self.screen = screen
        
        #load image
        self.image = self.load_image(img_filename)
        self.rect = self.image.get_rect()#set the rect attribute (collision)
        self.rect.left +=2
        self.rect.right -=2
        self.rect.top +=4
        self.rect.bottom -=4
        
        #get width and height
        self.image_w, self.image_h = self.image.get_size()
        self.disp_w = self.screen.get_width()
        self.disp_h = self.screen.get_height()

        #set the (x,y)
        self.x = init_x
        self.y = init_y

        #Set the default speed (dx, dy)
        self.dx = 0
        self.dy = 0
        self.ddx = 0
        self.ddy = 0
        self.acc_x = 2.2
        self.acc_y = 2.2
        self.decay = .85
        
        self.lasers = pygame.sprite.Group()
        self.active = True
        self.laserspeed = 15
        self.firerate = 6
        self.firetimer = 0

    def update(self, ship_events):

        for event in ship_events:
            if event.type == KEYDOWN:
                if event.key == K_UP:
                    self.ddy -= self.acc_y
                if event.key == K_DOWN:
                    self.ddy += self.acc_y
                if event.key == K_LEFT:
                    self.ddx -= self.acc_x
                if event.key == K_RIGHT:
                    self.ddx += self.acc_x
            elif event.type == KEYUP:
                if event.key == K_UP:
                    self.ddy += self.acc_y
                if event.key == K_DOWN:
                    self.ddy -= self.acc_y
                if event.key == K_LEFT:
                    self.ddx += self.acc_x
                if event.key == K_RIGHT:
                    self.ddx -= self.acc_x
        self.dx = self.dx + self.ddx
        self.dy = self.dy + self.ddy

        self.dx *= self.decay
        self.dy *= self.decay

        self.x = self.x + self.dx
        self.y = self.y + self.dy
        self.rect.x = self.x
        self.rect.y = self.y

        #limit battlecruiser movement
        if(self.x < 0):
            self.x = 0
        elif(self.x > self.disp_w):

            self.x = self.disp_w    
        if(self.y < 0):
            self.y = 0
        elif(self.y > self.disp_h):
            self.y = self.disp_h

        #cleanup lasers
        self.lasers.update()
        for shot in self.lasers:
            if shot.y < 0:
                self.lasers.remove(shot)
                
        #update fire rate
        self.firetimer+=1


        
        
    def fire(self):
        if(self.firetimer >= self.firerate):
            self.firetimer = 0
            self.lasers.add(Laser(self.screen, self.x, self.y-40, (self.laserspeed-(self.dy/2))))
            
    
    def draw(self):
        '''Draw the sprite on the screen'''
        if(self.active == True):
            for shot in self.lasers:
                shot.draw()
            draw_pos = self.image.get_rect().move(self.x - self.image_w/2, self.y - self.image_h / 2)
            self.screen.blit(self.image, draw_pos)
    
    def death(self):
        self.active = False
        sound = self.load_sound("./assets/death_explode.wav" )
        sound.play()
        
        



#__________________________________________________________________________________________
if __name__ == "__main__":
    #check if sound and font are supported
    if not pygame.font:
        print "Warning, fonts disabled"
    if not pygame.mixer:
        print "Warning, sound disabled"

        #constants
    FPS = 50
    SCREEN_WIDTH, SCREEN_HEIGHT = 800, 600
    MAX_SPEED = 10
    BACKGROUND_COLOR = (0,0,0)
    SPRITE_IMAGE = './assets/battlecruiser.gif'
    NUM_SPRITES = 1
    COUNTER_LOCATION = (10,10)
    ACCELERATION_X = 2
    ACCELERATION_Y = 2
        
    pygame.init()
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    pygame.display.set_caption('simple Sprite Demo')
    clock = pygame.time.Clock()
    font = pygame.font.Font(None, 28)
    counter = 0
    ship = Battlecruiser(screen, SPRITE_IMAGE, 400, 500)
    ship_events = []

    while True:
        time_passed = clock.tick(FPS)
        text = font.render("Time: " + str(counter) + " (at "+str(FPS)+" FPS)",1,(0,0,0))


        #handle input
        if pygame.key.get_pressed()[K_SPACE]:
            ship.fire()
        for event in pygame.event.get():
            if event.type == pygame.event.get():
                pygame.quit()
                sys.exit()
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    sys.exit()
                if event.key == K_UP:
                    ship_events.append(event)
                if event.key == K_DOWN:
                    ship_events.append(event)
                if event.key == K_LEFT:
                    ship_events.append(event)
                if event.key == K_RIGHT:
                    ship_events.append(event)
            elif event.type == KEYUP:
                if event.key == K_UP:
                    ship_events.append(event)
                if event.key == K_DOWN:
                    ship_events.append(event)
                if event.key == K_LEFT:
                    ship_events.append(event)
                if event.key == K_RIGHT:
                    ship_events.append(event)
            
             
        screen.fill(BACKGROUND_COLOR)
        
        ship.update(ship_events)
        ship_events = []
        ship.draw()
        
        screen.blit(text, COUNTER_LOCATION)
        counter +=1
        pygame.display.flip()


