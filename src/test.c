#include "kos.h"
#include "dc/pvr.h"
#include "dc/video.h"
#include "stdio.h"

int main()
{
    KOS_INIT_FLAGS(INIT_DEFAULT);
    vid_init(DM_256x256_PAL_IL, PM_RGB565);

    pvr_init_defaults();
    pvr_set_bg_color(0.5f, 0.7f, 0.3f);

    while (1)
    {
        pvr_wait_ready();

        pvr_scene_begin();
        pvr_list_begin(PVR_LIST_OP_POLY);

        pvr_list_finish();
        pvr_scene_finish();

        printf("Console output!\n");
    }
    
    return 0;
}