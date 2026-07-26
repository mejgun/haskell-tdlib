module TD.Data.InputRichMessageMedia
  ( InputRichMessageMedia(..)    
  , defaultInputRichMessageMedia 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import {-# SOURCE #-} qualified TD.Data.InputMessageContent as InputMessageContent

data InputRichMessageMedia
  = InputRichMessageMedia -- ^ Describes a media to be used in a sent rich message
    { _id   :: Maybe T.Text                                  -- ^ Unique identifier of the media; 1-64 base64url characters
    , media :: Maybe InputMessageContent.InputMessageContent -- ^ The media to send. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessagePhoto, inputMessageVideo, or inputMessageVoiceNote
    }
  deriving (Eq, Show)

instance I.ShortShow InputRichMessageMedia where
  shortShow InputRichMessageMedia
    { _id   = _id_
    , media = media_
    }
      = "InputRichMessageMedia"
        ++ I.cc
        [ "_id"   `I.p` _id_
        , "media" `I.p` media_
        ]

instance AT.FromJSON InputRichMessageMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputRichMessageMedia" -> parseInputRichMessageMedia v
      _                       -> mempty
    
    where
      parseInputRichMessageMedia :: A.Value -> AT.Parser InputRichMessageMedia
      parseInputRichMessageMedia = A.withObject "InputRichMessageMedia" $ \o -> do
        _id_   <- o A..:?  "id"
        media_ <- o A..:?  "media"
        pure $ InputRichMessageMedia
          { _id   = _id_
          , media = media_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputRichMessageMedia where
  toJSON InputRichMessageMedia
    { _id   = _id_
    , media = media_
    }
      = A.object
        [ "@type" A..= AT.String "inputRichMessageMedia"
        , "id"    A..= _id_
        , "media" A..= media_
        ]

defaultInputRichMessageMedia :: InputRichMessageMedia
defaultInputRichMessageMedia =
  InputRichMessageMedia
    { _id   = Nothing
    , media = Nothing
    }

