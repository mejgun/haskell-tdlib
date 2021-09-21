-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputChatPhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Describes a photo to be set as a user profile or chat photo
data InputChatPhoto = 
 -- |
 -- 
 -- A previously used profile photo of the current user 
 -- 
 -- __chat_photo_id__ Identifier of the current user's profile photo to reuse
 InputChatPhotoPrevious { chat_photo_id :: Maybe Int }  |
 -- |
 -- 
 -- A static photo in JPEG format 
 -- 
 -- __photo__ Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
 InputChatPhotoStatic { photo :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 800 and be at most 2MB in size
 -- 
 -- __animation__ Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
 -- 
 -- __main_frame_timestamp__ Timestamp of the frame, which will be used as static chat photo
 InputChatPhotoAnimation { main_frame_timestamp :: Maybe Float, animation :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON InputChatPhoto where
 toJSON (InputChatPhotoPrevious { chat_photo_id = chat_photo_id }) =
  A.object [ "@type" A..= T.String "inputChatPhotoPrevious", "chat_photo_id" A..= chat_photo_id ]

 toJSON (InputChatPhotoStatic { photo = photo }) =
  A.object [ "@type" A..= T.String "inputChatPhotoStatic", "photo" A..= photo ]

 toJSON (InputChatPhotoAnimation { main_frame_timestamp = main_frame_timestamp, animation = animation }) =
  A.object [ "@type" A..= T.String "inputChatPhotoAnimation", "main_frame_timestamp" A..= main_frame_timestamp, "animation" A..= animation ]

instance T.FromJSON InputChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputChatPhotoPrevious" -> parseInputChatPhotoPrevious v
   "inputChatPhotoStatic" -> parseInputChatPhotoStatic v
   "inputChatPhotoAnimation" -> parseInputChatPhotoAnimation v
   _ -> mempty
  where
   parseInputChatPhotoPrevious :: A.Value -> T.Parser InputChatPhoto
   parseInputChatPhotoPrevious = A.withObject "InputChatPhotoPrevious" $ \o -> do
    chat_photo_id <- mconcat [ o A..:? "chat_photo_id", readMaybe <$> (o A..: "chat_photo_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InputChatPhotoPrevious { chat_photo_id = chat_photo_id }

   parseInputChatPhotoStatic :: A.Value -> T.Parser InputChatPhoto
   parseInputChatPhotoStatic = A.withObject "InputChatPhotoStatic" $ \o -> do
    photo <- o A..:? "photo"
    return $ InputChatPhotoStatic { photo = photo }

   parseInputChatPhotoAnimation :: A.Value -> T.Parser InputChatPhoto
   parseInputChatPhotoAnimation = A.withObject "InputChatPhotoAnimation" $ \o -> do
    main_frame_timestamp <- o A..:? "main_frame_timestamp"
    animation <- o A..:? "animation"
    return $ InputChatPhotoAnimation { main_frame_timestamp = main_frame_timestamp, animation = animation }