module TD.Data.InputBusinessIntro
  ( InputBusinessIntro(..)    
  , defaultInputBusinessIntro 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputFile as InputFile

data InputBusinessIntro
  = InputBusinessIntro -- ^ Describes settings for a business account intro to set
    { title   :: Maybe T.Text              -- ^ Title text of the intro; 0-getOption("business_intro_title_length_max") characters
    , message :: Maybe T.Text              -- ^ Message text of the intro; 0-getOption("business_intro_message_length_max") characters
    , sticker :: Maybe InputFile.InputFile -- ^ Greeting sticker of the intro; pass null if none. The sticker must belong to a sticker set and must not be a custom emoji
    }
  deriving (Eq, Show)

instance I.ShortShow InputBusinessIntro where
  shortShow InputBusinessIntro
    { title   = title_
    , message = message_
    , sticker = sticker_
    }
      = "InputBusinessIntro"
        ++ I.cc
        [ "title"   `I.p` title_
        , "message" `I.p` message_
        , "sticker" `I.p` sticker_
        ]

instance AT.FromJSON InputBusinessIntro where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputBusinessIntro" -> parseInputBusinessIntro v
      _                    -> mempty
    
    where
      parseInputBusinessIntro :: A.Value -> AT.Parser InputBusinessIntro
      parseInputBusinessIntro = A.withObject "InputBusinessIntro" $ \o -> do
        title_   <- o A..:?  "title"
        message_ <- o A..:?  "message"
        sticker_ <- o A..:?  "sticker"
        pure $ InputBusinessIntro
          { title   = title_
          , message = message_
          , sticker = sticker_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputBusinessIntro where
  toJSON InputBusinessIntro
    { title   = title_
    , message = message_
    , sticker = sticker_
    }
      = A.object
        [ "@type"   A..= AT.String "inputBusinessIntro"
        , "title"   A..= title_
        , "message" A..= message_
        , "sticker" A..= sticker_
        ]

defaultInputBusinessIntro :: InputBusinessIntro
defaultInputBusinessIntro =
  InputBusinessIntro
    { title   = Nothing
    , message = Nothing
    , sticker = Nothing
    }

