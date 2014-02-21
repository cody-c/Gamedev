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

    def __init__(self, screen, img_filename, init_x, init_y):
        pygame.sprite.Sprite.__init__(self) #pygame sprite init
        self.screen = screen
        #load image
        self.image = self.load_image(img_filename)
        self.rect = self.image.get_rect()#set the rect attribute (collision)
        
        #get width and height
        self.image_w, self.image_h = self.image.get_size()

        #set the (x,y)
        self.x = init_x
        self.y = init_y

        #Set the default speed (dx, dy)
        self.dx = 0
        self.dy = 0
        self.ddx = 0
        self.ddy = 0
        self.decay = .85
        
        self.lasers = []
        self.active = True

    def update(self):
        ''' move the laser a bit'''
        self.dx = self.dx + self.ddx
        self.dy = self.dy + self.ddy

        self.dx *= self.decay
        self.dy *= self.decay

        self.x = self.x + self.dx
        self.rect.x = self.rect.x + self.dx
        self.y = self.y + self.dy
        self.rect.y = self.rect.y + self.dy
        if(self.x < 0):
            self.x = 0
        elif(self.x > SCREEN_WIDTH):

            self.x = SCREEN_WIDTH    
        if(self.y < 0):
            self.y = 0
        elif(self.y > SCREEN_HEIGHT):
            self.y = SCREEN_HEIGHT
        #cleanup lasers
        for shot in self.lasers:
            shot.update()
            shot.draw()
            if shot.y < 0:
                self.lasers.remove(shot)

        
        
    def fire(self):
        shot = Laser(self.screen, self.x, self.y-40, 15)
        self.lasers.append(shot)
            
    
    def draw(self):
        '''Draw the sprite on the screen'''
        draw_pos = self.image.get_rect().move(self.x - self.image_w/2, self.y - self.image_h / 2)
        self.screen.blit(self.image, draw_pos)

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

    while True:
        time_passed = clock.tick(FPS)
        text = font.render("Time: " + str(counter) + " (at "+str(FPS)+" FPS)",1,(0,0,0))
        
        for event in pygame.event.get():
            if event.type == pygame.event.get():
                pygame.quit()
                sys.exit()
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    sys.exit()
                if event.key == K_UP:
                    ship.ddy -= ACCELERATION_Y;
                if event.key == K_DOWN:
                    ship.ddy += ACCELERATION_Y;
                if event.key == K_LEFT:
                    ship.ddx -= ACCELERATION_X;
                if event.key == K_RIGHT:
                    ship.ddx += ACCELERATION_X;
                if event.key == K_SPACE:
                    ship.fire()
            elif event.type == KEYUP:
                if event.key == K_UP:
                    ship.ddy += ACCELERATION_Y;
                if event.key == K_DOWN:
                    ship.ddy -= ACCELERATION_Y;
                if event.key == K_LEFT:
                    ship.ddx += ACCELERATION_X;
                if event.key == K_RIGHT:
                    ship.ddx -= ACCELERATION_X;
             
        screen.fill(BACKGROUND_COLOR)
        
        ship.update()
        ship.draw()
        
        screen.blit(text, COUNTER_LOCATION)
        counter +=1
        pygame.display.flip()


