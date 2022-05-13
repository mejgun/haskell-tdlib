{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- | Describes a photo to be set as a user profile or chat photo
data InputChatPhoto
  = -- | A previously used profile photo of the current user @chat_photo_id Identifier of the current user's profile photo to reuse
    InputChatPhotoPrevious
      { -- |
        chat_photo_id :: Maybe Int
      }
  | -- | A static photo in JPEG format @photo Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
    InputChatPhotoStatic
      { -- |
        photo :: Maybe InputFile.InputFile
      }
  | -- | An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 800 and be at most 2MB in size
    InputChatPhotoAnimation
      { -- | Timestamp of the frame, which will be used as static chat photo
        main_frame_timestamp :: Maybe Float,
        -- | Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
        animation :: Maybe InputFile.InputFile
      }
  deriving (Eq)

instance Show InputChatPhoto where
  show
    InputChatPhotoPrevious
      { chat_photo_id = chat_photo_id_
      } =
      "InputChatPhotoPrevious"
        ++ U.cc
          [ U.p "chat_photo_id" chat_photo_id_
          ]
  show
    InputChatPhotoStatic
      { photo = photo_
      } =
      "InputChatPhotoStatic"
        ++ U.cc
          [ U.p "photo" photo_
          ]
  show
    InputChatPhotoAnimation
      { main_frame_timestamp = main_frame_timestamp_,
        animation = animation_
      } =
      "InputChatPhotoAnimation"
        ++ U.cc
          [ U.p "main_frame_timestamp" main_frame_timestamp_,
            U.p "animation" animation_
          ]

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
        chat_photo_id_ <- mconcat [o A..:? "chat_photo_id", U.rm <$> (o A..: "chat_photo_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ InputChatPhotoPrevious {chat_photo_id = chat_photo_id_}

      parseInputChatPhotoStatic :: A.Value -> T.Parser InputChatPhoto
      parseInputChatPhotoStatic = A.withObject "InputChatPhotoStatic" $ \o -> do
        photo_ <- o A..:? "photo"
        return $ InputChatPhotoStatic {photo = photo_}

      parseInputChatPhotoAnimation :: A.Value -> T.Parser InputChatPhoto
      parseInputChatPhotoAnimation = A.withObject "InputChatPhotoAnimation" $ \o -> do
        main_frame_timestamp_ <- o A..:? "main_frame_timestamp"
        animation_ <- o A..:? "animation"
        return $ InputChatPhotoAnimation {main_frame_timestamp = main_frame_timestamp_, animation = animation_}
  parseJSON _ = mempty

instance T.ToJSON InputChatPhoto where
  toJSON
    InputChatPhotoPrevious
      { chat_photo_id = chat_photo_id_
      } =
      A.object
        [ "@type" A..= T.String "inputChatPhotoPrevious",
          "chat_photo_id" A..= chat_photo_id_
        ]
  toJSON
    InputChatPhotoStatic
      { photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "inputChatPhotoStatic",
          "photo" A..= photo_
        ]
  toJSON
    InputChatPhotoAnimation
      { main_frame_timestamp = main_frame_timestamp_,
        animation = animation_
      } =
      A.object
        [ "@type" A..= T.String "inputChatPhotoAnimation",
          "main_frame_timestamp" A..= main_frame_timestamp_,
          "animation" A..= animation_
        ]
