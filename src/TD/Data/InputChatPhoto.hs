module TD.Data.InputChatPhoto
  (InputChatPhoto(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.ChatPhotoSticker as ChatPhotoSticker

-- | Describes a photo to be set as a user profile or chat photo
data InputChatPhoto
  = InputChatPhotoPrevious -- ^ A previously used profile photo of the current user
    { chat_photo_id :: Maybe Int -- ^ Identifier of the current user's profile photo to reuse
    }
  | InputChatPhotoStatic -- ^ A static photo in JPEG format
    { photo :: Maybe InputFile.InputFile -- ^ Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
    }
  | InputChatPhotoAnimation -- ^ An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 1280 and be at most 2MB in size
    { animation            :: Maybe InputFile.InputFile -- ^ Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
    , main_frame_timestamp :: Maybe Double              -- ^ Timestamp of the frame, which will be used as static chat photo
    }
  | InputChatPhotoSticker -- ^ A sticker on a custom background
    { sticker :: Maybe ChatPhotoSticker.ChatPhotoSticker -- ^ Information about the sticker
    }
  deriving (Eq, Show)

instance I.ShortShow InputChatPhoto where
  shortShow InputChatPhotoPrevious
    { chat_photo_id = chat_photo_id_
    }
      = "InputChatPhotoPrevious"
        ++ I.cc
        [ "chat_photo_id" `I.p` chat_photo_id_
        ]
  shortShow InputChatPhotoStatic
    { photo = photo_
    }
      = "InputChatPhotoStatic"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow InputChatPhotoAnimation
    { animation            = animation_
    , main_frame_timestamp = main_frame_timestamp_
    }
      = "InputChatPhotoAnimation"
        ++ I.cc
        [ "animation"            `I.p` animation_
        , "main_frame_timestamp" `I.p` main_frame_timestamp_
        ]
  shortShow InputChatPhotoSticker
    { sticker = sticker_
    }
      = "InputChatPhotoSticker"
        ++ I.cc
        [ "sticker" `I.p` sticker_
        ]

instance AT.FromJSON InputChatPhoto where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputChatPhotoPrevious"  -> parseInputChatPhotoPrevious v
      "inputChatPhotoStatic"    -> parseInputChatPhotoStatic v
      "inputChatPhotoAnimation" -> parseInputChatPhotoAnimation v
      "inputChatPhotoSticker"   -> parseInputChatPhotoSticker v
      _                         -> mempty
    
    where
      parseInputChatPhotoPrevious :: A.Value -> AT.Parser InputChatPhoto
      parseInputChatPhotoPrevious = A.withObject "InputChatPhotoPrevious" $ \o -> do
        chat_photo_id_ <- fmap I.readInt64 <$> o A..:?  "chat_photo_id"
        pure $ InputChatPhotoPrevious
          { chat_photo_id = chat_photo_id_
          }
      parseInputChatPhotoStatic :: A.Value -> AT.Parser InputChatPhoto
      parseInputChatPhotoStatic = A.withObject "InputChatPhotoStatic" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ InputChatPhotoStatic
          { photo = photo_
          }
      parseInputChatPhotoAnimation :: A.Value -> AT.Parser InputChatPhoto
      parseInputChatPhotoAnimation = A.withObject "InputChatPhotoAnimation" $ \o -> do
        animation_            <- o A..:?  "animation"
        main_frame_timestamp_ <- o A..:?  "main_frame_timestamp"
        pure $ InputChatPhotoAnimation
          { animation            = animation_
          , main_frame_timestamp = main_frame_timestamp_
          }
      parseInputChatPhotoSticker :: A.Value -> AT.Parser InputChatPhoto
      parseInputChatPhotoSticker = A.withObject "InputChatPhotoSticker" $ \o -> do
        sticker_ <- o A..:?  "sticker"
        pure $ InputChatPhotoSticker
          { sticker = sticker_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputChatPhoto where
  toJSON InputChatPhotoPrevious
    { chat_photo_id = chat_photo_id_
    }
      = A.object
        [ "@type"         A..= AT.String "inputChatPhotoPrevious"
        , "chat_photo_id" A..= fmap I.writeInt64  chat_photo_id_
        ]
  toJSON InputChatPhotoStatic
    { photo = photo_
    }
      = A.object
        [ "@type" A..= AT.String "inputChatPhotoStatic"
        , "photo" A..= photo_
        ]
  toJSON InputChatPhotoAnimation
    { animation            = animation_
    , main_frame_timestamp = main_frame_timestamp_
    }
      = A.object
        [ "@type"                A..= AT.String "inputChatPhotoAnimation"
        , "animation"            A..= animation_
        , "main_frame_timestamp" A..= main_frame_timestamp_
        ]
  toJSON InputChatPhotoSticker
    { sticker = sticker_
    }
      = A.object
        [ "@type"   A..= AT.String "inputChatPhotoSticker"
        , "sticker" A..= sticker_
        ]

