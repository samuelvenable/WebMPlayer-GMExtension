/// @description And so it begins

/*
** Ubuntu needs the following command executed to install the dependencies:
** sudo apt update && sudo apt install libsdl2-dev libvorbis-dev libvpx-dev
*/

v = -1; fname = working_directory + "example.webm";
if (file_exists(fname)) {
  v = webm_add(fname);
  webm_play(v);
  w = webm_get_width(v);
  h = webm_get_height(v);

  chan = buffer_sizeof(buffer_u64); // size of one pixel
  buff = buffer_create(chan * w * h, buffer_fixed, chan);
  surf = -1; // surfaces should be created in Draw events only!
  webm_position = webm_get_playtime(v);

  // a hackfix for GM's internal 'used bytes' counter:
  buffer_poke(buff, buffer_get_size(buff) - 1, buffer_u8, 0);
  // just poke 0 at the very end, so we ensure everything is allocated properly.
  // probably not needed since GMS2.3+?
}

// fixes window close button on unix-likes with kwin/kde.
window_set_size(window_get_width(), window_get_height());
