module TD.Data.AnimatedChatPhoto
  (AnimatedChatPhoto(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File

data AnimatedChatPhoto
  = AnimatedChatPhoto -- ^ Animated variant of a chat photo in MPEG4 format
    { _length              :: Maybe Int       -- ^ Animation width and height
    , file                 :: Maybe File.File -- ^ Information about the animation file
    , main_frame_timestamp :: Maybe Double    -- ^ Timestamp of the frame, used as a static chat photo
    }
  deriving (Eq, Show)

instance I.ShortShow AnimatedChatPhoto where
  shortShow AnimatedChatPhoto
    { _length              = _length_
    , file                 = file_
    , main_frame_timestamp = main_frame_timestamp_
    }
      = "AnimatedChatPhoto"
        ++ I.cc
        [ "_length"              `I.p` _length_
        , "file"                 `I.p` file_
        , "main_frame_timestamp" `I.p` main_frame_timestamp_
        ]

instance AT.FromJSON AnimatedChatPhoto where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "animatedChatPhoto" -> parseAnimatedChatPhoto v
      _                   -> mempty
    
    where
      parseAnimatedChatPhoto :: A.Value -> AT.Parser AnimatedChatPhoto
      parseAnimatedChatPhoto = A.withObject "AnimatedChatPhoto" $ \o -> do
        _length_              <- o A..:?  "length"
        file_                 <- o A..:?  "file"
        main_frame_timestamp_ <- o A..:?  "main_frame_timestamp"
        pure $ AnimatedChatPhoto
          { _length              = _length_
          , file                 = file_
          , main_frame_timestamp = main_frame_timestamp_
          }
  parseJSON _ = mempty

