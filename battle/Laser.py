import os, sys, pygame #includes
from pygame.locals import *
from random import randint

class Laser(pygame.sprite.Sprite):
    ''' a laser that moves forwards at a steady speen when created. '''
    def load_image(self, image_name):
        try:
            image = pygame.image.load(image_name)
        except pygame.error, message:
            print "cannot load image: "+ image_name
            raise SystemExit, Message
        return image.convert_alpha()
    
    def load_sound(self, sound_name):
        try:
            sound = pygame.mixer.Sound(sound_name)
        except pygame.error, message:
            print "Cannot load sound: " + sound_name
            raise SystemExit, message
        return sound

    def __init__(self, screen,  init_x, init_y, init_y_speed):
        pygame.sprite.Sprite.__init__(self) #pygame sprite init
        self.screen = screen
        #load image
        self.image = self.load_image("./assets/laser.gif")
        self.sound = self.load_sound("./assets/laser.wav")
        self.sound.play()
        self.rect = self.image.get_rect()#set the rect attribute (collision)
        
        #get width and height
        self.image_w, self.image_h = self.image.get_size()

        #set the (x,y)
        self.x = init_x
        self.y = init_y

        #Set the default speed (dx, dy)
        self.dx = 0
        self.dy = (-1*init_y_speed)
        self.active = True

    def update(self):
        ''' move the laser a bit'''
        self.y = self.y + self.dy
        self.rect.x = self.x
        self.rect.y = self.y
        if(self.y < 0):
            self.active = False
        if(self.active == False):
            self.kill()
            
    
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
    LASER_TICK = 200
    SCREEN_WIDTH, SCREEN_HEIGHT = 800, 600
    MAX_SPEED = 10
    BACKGROUND_COLOR = (0,0,0)
    SPRITE_IMAGE = './assets/laser.gif'
    NUM_SPRITES = 1
    COUNTER_LOCATION = (10,10)
        
    pygame.init()
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    pygame.display.set_caption('simple Sprite Demo')
    clock = pygame.time.Clock()
    font = pygame.font.Font(None, 28)
    counter = 0
    laser_timer = 0
    
    sprites = []
    while True:
        time_passed = clock.tick(FPS)
        text = font.render("Time: " + str(counter) + " (at "+str(FPS)+" FPS)",1,(0,0,0))
        
        if(laser_timer == 0):
            sprites.append(Laser(screen, randint(100, SCREEN_WIDTH-100), randint(400, 600), randint(3,MAX_SPEED)))
#            print(str(len(sprites))+" sprites")
        
        for event in pygame.event.get():
            if event.type == pygame.event.get():
                pygame.quit()
                sys.exit()
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    sys.exit()
        screen.fill(BACKGROUND_COLOR)
        
        for sprite in sprites:
            sprite.update()
            sprite.draw()

            if(sprite.active == False):
                sprites.remove(sprite)
                
              
        screen.blit(text, COUNTER_LOCATION)
        counter +=1
        pygame.display.flip()


