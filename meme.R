library(magick)

# -------- create meme section -------- #

# creates the text header for the meme
meme_text <- image_blank(width = 400, 
                         height = 35, 
                         color = "#000000") %>%
  image_annotate(text = "Yes I take stats 220, How did you know?",
                 color = "#999999",
                 size = 25,
                 font = "Impact",
                 gravity = "north center")


# gets the chad image and scales it to the size of the header
chad_image <- image_read("chad.png") %>%
  image_scale(400)

chad_image2 <- image_read("chad2.png") %>%
  image_scale(400)

chad_image3 <- image_read("chad3.png") %>%
  image_scale(400)

chad_image4 <- image_read("chad4.png") %>%
  image_scale(400)


# stacks the header on top of the chad image
meme_vector <- c(meme_text, chad_image)
image_append(meme_vector, stack=TRUE)  %>% image_write('meme.png')

meme_vector2 <- c(meme_text, chad_image2)
image_append(meme_vector2, stack=TRUE)  %>% image_write('meme2.png')

meme_vector3 <- c(meme_text, chad_image3)
image_append(meme_vector3, stack=TRUE)  %>% image_write('meme3.png')

meme_vector4 <- c(meme_text, chad_image4)
image_append(meme_vector4, stack=TRUE)  %>% image_write('meme4.png')

# -------- create animation section -------- #

# use the just created memes as frames
meme_image = image_read("meme.png")
meme2_image = image_read("meme2.png")
meme3_image = image_read("meme3.png")
meme4_image = image_read("meme4.png")

# turn the frames into a vector
frames <- c(meme_image, meme2_image, meme3_image, meme4_image)

# combine the frames to create a gif
image_animate(frames, fps = 1) %>%
  image_write("meme.gif")