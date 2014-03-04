import os, sys, pygame #includes
from Battlecruiser import Battlecruiser
from Enemy import Enemy
from pygame.locals import *
from random import randint


class Background(pygame.sprite.Sprite):
    ''' a laser that moves forwards at a steady speen when created. '''
    def load_image(self, image_name):
        try:
            image = pygame.image.load(image_name)
        except pygame.error, message:
            print "cannot load image: "+ image_name
            raise SystemExit, Message
        return image.convert_alpha()

    def __init__(self, screen, init_y_speed):
        pygame.sprite.Sprite.__init__(self) #pygame sprite init
        self.screen = screen
        #load image
        self.image = self.load_image("./assets/ram_aras.png")
        
        #get width and height
        self.image_w, self.image_h = self.image.get_size()

        #set the (x,y)
        self.x = 400
        self.y = -900

        #Set the default speed (dx, dy)
        self.dx = 0
        self.dy = (init_y_speed)
        self.active = True

    def update(self):
        ''' move the laser a bit'''
        if self.y <= 1500:
            self.y = self.y + self.dy
                
    def draw(self):
        '''Draw the sprite on the screen'''
        draw_pos = self.image.get_rect().move(self.x - self.image_w/2, self.y - self.image_h / 2)
        self.screen.blit(self.image, draw_pos)


def spawn(num_enemies, dist_mod):
    swarm = []
    for zerg in range(num_enemies):
        swarm.append(Enemy(screen, ENEMY_IMAGE,ship, randint(0,SCREEN_WIDTH), randint(0,int(SCREEN_HEIGHT*dist_mod)), ENEMY_SPEEDX*((2*randint(0,1))-1)/dist_mod, ENEMY_SPEEDY*((2*randint(0,1))-1) ))
    return swarm


 
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
    ENEMY_IMAGE = './assets/mutalisk.gif'
    NUM_SPRITES = 1
    SCORE_LOCATION = (10,10)
    ACCELERATION_X = 2
    ACCELERATION_Y = 2
    ENEMY_SPEEDX = 1
    ENEMY_SPEEDY = 1
    SCROLL_SPEED = .75
    MULTIPLIER = 2
        
    pygame.init()
    cur_enemies = 10
    num_enemies = 10
    max_enemies = 100

    dist_mod = .4

    
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    game_over_screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    game_over = False
    pygame.display.set_caption('simple Sprite Demo')
    clock = pygame.time.Clock()
    font = pygame.font.Font(None, 28)
    counter = 0
    score = 0
    ship = Battlecruiser(screen, SPRITE_IMAGE, 400, 500)
    ram_aras = Background(screen, SCROLL_SPEED)
    end_aras = Background(game_over_screen, SCROLL_SPEED)
    ship_events = []
    swarm = spawn(cur_enemies, dist_mod)
    

    #setup Ram Aras
        


    while not game_over:
        time_passed = clock.tick(FPS)
        text = font.render("Score: "+ str(score),1,(0,200,127))
        
        #spawn_enemies
        if cur_enemies <= 0:
            num_enemies *= MULTIPLIER
            if num_enemies >= max_enemies:
                num_enemies = max_enemies      
                dist_mod += .2
            cur_enemies = num_enemies
        
            swarm = spawn(cur_enemies, dist_mod)
            
        
        

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
        ram_aras.update()
        end_aras.update()
        ram_aras.draw()
        
        ship.update(ship_events)
        ship_events = []
        ship.draw()
        
        for zerg in swarm:
            zerg.update()
            zerg.draw()
            if pygame.sprite.collide_rect(ship, zerg) and ship.active == True and zerg.active == True:
                ship.death()
                game_over = True
            
            
            for shot in ship.lasers:
                if pygame.sprite.collide_rect(shot,zerg) and zerg.active == True:
                    score+=100
                    ship.lasers.remove(shot)
                    zerg.death()        
                    cur_enemies-=1
        
        screen.blit(text, SCORE_LOCATION)
        counter +=1
        pygame.display.update()
        pygame.display.flip()


    while True:
        time_passed = clock.tick(FPS)
        end_aras.update()
        end_aras.draw()
        text = font.render("Game Over",1,(0,200,255))
        screen.blit(text, (360,250))
        
        for event in pygame.event.get():
            if event.type == pygame.event.get():
                pygame.quit()
                sys.exit()
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    sys.exit()
        
        ship.update([])
        ship.draw()
        pygame.display.update()
        pygame.display.flip()
        


