#region Border
var WindowTargetWidth = Border.Enabled ? 960 : 640,
	WindowTargetHeight = Border.Enabled ? 540 : 480,
	WindowWidth = window_get_width(),
	WindowHeight = window_get_height(),
	WindowRatio = min(WindowWidth / WindowTargetWidth, WindowHeight / WindowTargetHeight);
if Border.Enabled {
	application_surface_draw_enable(false);
	var BorderX = (WindowWidth - 960 * WindowRatio) / 2,
		BorderY = (WindowHeight - 540 * WindowRatio) / 2;
	display_set_gui_maximize(WindowRatio, WindowRatio, BorderX + 160 * WindowRatio, BorderY + 30 * WindowRatio);
	if Border.SpritePrevious != -1
		draw_sprite_stretched_ext(Border.SpritePrevious, 0, BorderX, BorderY, 960 * WindowRatio, 540 * WindowRatio, c_white, Border.AlphaPrevious);
	if Border.Sprite != -1 || Border.AutoCapture
	{
		if Border.Blur != 0
		{
			shader_set(shdGaussianBlur);
			shader_set_uniform_f(Border.__BlurShaderSize, 640, 480, Border.Blur);
		}
		if Border.AutoCapture
			draw_surface_ext(application_surface, BorderX, BorderY, 960 * WindowRatio / 640, 540 * WindowRatio / 480, 0, c_white, Border.Alpha);
		else
			draw_sprite_stretched_ext(Border.Sprite, 0, BorderX, BorderY, 960 * WindowRatio, 540 * WindowRatio, c_white, Border.Alpha);
		if Border.Blur != 0
			shader_reset();
	}
	gpu_set_blendenable(false);
	draw_surface_ext(application_surface, BorderX + 160 * WindowRatio, BorderY + 30 * WindowRatio, WindowRatio, WindowRatio, 0, c_white, 1);
	gpu_set_blendenable(true);
}
else
{
	application_surface_draw_enable(true);
	display_set_gui_maximize(WindowRatio, WindowRatio, (WindowWidth - 640 * WindowRatio) / 2, (WindowHeight - 480 * WindowRatio) / 2);
}
#endregion