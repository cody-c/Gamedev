import os, sys, pygame #includes
from Laser import Laser
from pygame.locals import *
from random import randint

class Enemy(pygame.sprite.Sprite):
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

    def __init__(self, screen, img_filename, cruiser, init_x, init_y,init_dx,init_dy):
        pygame.sprite.Sprite.__init__(self) #pygame sprite init
        self.screen = screen
        self.image = self.load_image(img_filename)
        self.rect = self.image.get_rect()#set the rect attribute(collision)
        self.ship = cruiser

        #get width and height
        self.image_w, self.image_h = self.image.get_size()
        self.disp_w = self.screen.get_width()
        self.disp_h = self.screen.get_height()

        #set the (x,y)
        self.x = init_x
        self.y = init_y

        #Set the default speed (dx, dy)
        self.dx = init_dx
        self.dy = init_dy        
        self.dying = 0
        self.active = True

    def update(self):
        ''' move the laser a bit'''
        if self.active == True:
            self.x = self.x + self.dx
            self.y = self.y + self.dy
            self.rect.x = self.x
            self.rect.y = self.y
            #self.rect = self.rect.move(self.x, self.y)
            #limit battlecruiser movement
            if(self.x < 0):
                self.dx*=-1
            elif(self.x > self.disp_w):
                self.dx*=-1    
            if(self.y < 0):
                self.dy*=-1
            elif(self.y > self.disp_h):
                self.dy *=-1
        elif self.dying > 0:
            self.dying -=1
            
 
    def draw(self):
        '''Draw the sprite on the screen'''
        if self.active == True or self.dying > 0:
            draw_pos = self.image.get_rect().move(self.x - self.image_w/2, self.y - self.image_h / 2)
            self.screen.blit(self.image, draw_pos)
    def death(self):
        '''runs whenever a laser collides with a Enemy'''
        self.active = False
        self.dying = 5
        self.image = self.load_image('./assets/laser_explosion.gif')



        

if __name__ == "__main__":
    #check if sound
    if not pygame.font:
        print "Warning, fonts disabled"
    if not pygame.mixer:
        print "Warning, sound disabled"

    #constants
    FPS = 50
    SCREEN_WIDTH, SCREEN_HEIGHT = 800, 600
    MAX_SPEED = 10
    BACKGROUND_COLOR = (255,255,255)
    SPRITE_IMAGE = './assets/mutalisk.gif'
    NUM_SPRITES = 10
    COUNTER_LOCATION = (10,10)
    ENEMY_SPEEDX = 5
    ENEMY_SPEEDY = 2
        
    pygame.init()
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    pygame.display.set_caption('simple Sprite Demo')
    clock = pygame.time.Clock()
    font = pygame.font.Font(None, 28)
    swarm = []
    counter = 0
    for zerg in range(NUM_SPRITES):
        swarm.append(Enemy(screen, SPRITE_IMAGE, None, randint(0,SCREEN_WIDTH), randint(0,SCREEN_HEIGHT), ENEMY_SPEEDX*((2*randint(0,1))-1), ENEMY_SPEEDY*((2*randint(0,1))-1) ))

    while True:
        time_passed = clock.tick(FPS)
        text = font.render("Time: "+str(counter)+" (at "+str(FPS)+" FPS)",1,(0,0,0))        
        for event in pygame.event.get():
            if event.type == pygame.event.get():
                pygame.quit()
                sys.exit()
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    sys.exit()
            elif event.type == KEYUP:
                pass 
             
        screen.fill(BACKGROUND_COLOR)
        for zerg in swarm:
            zerg.update()
            zerg.draw()        
        screen.blit(text, COUNTER_LOCATION)
        counter +=1
        pygame.display.flip()
