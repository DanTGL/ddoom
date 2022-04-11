import wad;
import std.stdio;
import derelict.sdl2.sdl;

int main()
{
	/*template MyTemplate() {
		
	}DerelictSDL2.load();

	if (SDL_Init(SDL_INIT_VIDEO) < 0) {
		writeln("Failed to initialize the SDL2 library");

		return -1;
	}

	SDL_Window* window = SDL_CreateWindow("SDL2 Window", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, 0);

	if (!window) {
		writeln("Failed to create window");
		return -1;
	}

	SDL_Surface* windowSurface = SDL_GetWindowSurface(window);

	if (!windowSurface) {
		writeln("Failed to get the surface from the window");
		return -1;
	}

	bool windowOpen = true;

	while (windowOpen) {
		SDL_Event e;
		while (SDL_PollEvent(&e) > 0) {
			switch (e.type) {
				case SDL_QUIT:
					windowOpen = false;
					break;
				default:
					break;
			}

			SDL_UpdateWindowSurface(window);
		}
	}*/

	WADLoader wadloader = new WADLoader("DOOM.WAD");
	wadloader.loadWad();

	return 0;
}
