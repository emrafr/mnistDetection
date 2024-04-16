import pygame
import sys

# Initialize Pygame
pygame.init()

# Set up the screen
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Cube Game")

# Colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
BLUE = (0, 0, 255)
RED = (255, 0, 0)

# Cube properties
cube_size = 50
cube_x = SCREEN_WIDTH // 2 - cube_size // 2
cube_y = SCREEN_HEIGHT // 2 - cube_size // 2
cube_color = BLUE

# Check if joystick is connected
joystick_connected = pygame.joystick.get_count() > 0
if joystick_connected:
        joystick = pygame.joystick.Joystick(0)
        joystick.init()

# Start screen
start_font = pygame.font.Font(None, 36)
start_text = start_font.render("Press START to begin", True, BLACK)
start_text_rect = start_text.get_rect(center=(SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2))

# Game loop
game_started = False
running = True
while running:
    screen.fill(WHITE)

    if not game_started:
        screen.blit(start_text, start_text_rect)
        pygame.display.flip()
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
            elif event.type == pygame.KEYDOWN and not joystick_connected:
                if event.key == pygame.K_RETURN:  # Enter key on keyboard
                    game_started = True
            elif event.type == pygame.JOYBUTTONDOWN and joystick_connected:
                if event.button == 0:  # Start button on joystick
                    game_started = True
    else:
        # Game logic
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        if joystick_connected:
            # Joystick control

            # Get joystick input
            horizontal_movement = joystick.get_axis(0)  # Horizontal movement (left/right)
            vertical_movement = joystick.get_axis(1)    # Vertical movement (up/down)

            # Change cube color if button B is pressed
            if joystick.get_button(1):  # Button B
                if cube_color == BLUE:
                    cube_color = RED
                else:
                    cube_color = BLUE
        else:
            # Keyboard control
            keys = pygame.key.get_pressed()
            horizontal_movement = (keys[pygame.K_RIGHT] - keys[pygame.K_LEFT]) * 5
            vertical_movement = (keys[pygame.K_DOWN] - keys[pygame.K_UP]) * 5

            # Change cube color if space key is pressed
            if keys[pygame.K_SPACE]:
                if cube_color == BLUE:
                    cube_color = RED
                else:
                    cube_color = BLUE

        # Update cube position based on input
        cube_x += int(horizontal_movement)
        cube_y += int(vertical_movement)

        # Keep cube within the screen boundaries
        cube_x = max(0, min(cube_x, SCREEN_WIDTH - cube_size))
        cube_y = max(0, min(cube_y, SCREEN_HEIGHT - cube_size))

        # Draw the cube
        pygame.draw.rect(screen, cube_color, (cube_x, cube_y, cube_size, cube_size))

        # Update the display
        pygame.display.flip()

        # Add a slight delay
        pygame.time.delay(10)

# Quit Pygame
pygame.quit()
sys.exit()
