module TD.Data.InputBusinessStartPage
  ( InputBusinessStartPage(..)    
  , defaultInputBusinessStartPage 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputFile as InputFile

data InputBusinessStartPage
  = InputBusinessStartPage -- ^ Describes settings for a business account start page to set
    { title   :: Maybe T.Text              -- ^ Title text of the start page; 0-getOption("business_start_page_title_length_max") characters
    , message :: Maybe T.Text              -- ^ Message text of the start page; 0-getOption("business_start_page_message_length_max") characters
    , sticker :: Maybe InputFile.InputFile -- ^ Greeting sticker of the start page; pass null if none. The sticker must belong to a sticker set and must not be a custom emoji
    }
  deriving (Eq, Show)

instance I.ShortShow InputBusinessStartPage where
  shortShow InputBusinessStartPage
    { title   = title_
    , message = message_
    , sticker = sticker_
    }
      = "InputBusinessStartPage"
        ++ I.cc
        [ "title"   `I.p` title_
        , "message" `I.p` message_
        , "sticker" `I.p` sticker_
        ]

instance AT.FromJSON InputBusinessStartPage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputBusinessStartPage" -> parseInputBusinessStartPage v
      _                        -> mempty
    
    where
      parseInputBusinessStartPage :: A.Value -> AT.Parser InputBusinessStartPage
      parseInputBusinessStartPage = A.withObject "InputBusinessStartPage" $ \o -> do
        title_   <- o A..:?  "title"
        message_ <- o A..:?  "message"
        sticker_ <- o A..:?  "sticker"
        pure $ InputBusinessStartPage
          { title   = title_
          , message = message_
          , sticker = sticker_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputBusinessStartPage where
  toJSON InputBusinessStartPage
    { title   = title_
    , message = message_
    , sticker = sticker_
    }
      = A.object
        [ "@type"   A..= AT.String "inputBusinessStartPage"
        , "title"   A..= title_
        , "message" A..= message_
        , "sticker" A..= sticker_
        ]

defaultInputBusinessStartPage :: InputBusinessStartPage
defaultInputBusinessStartPage =
  InputBusinessStartPage
    { title   = Nothing
    , message = Nothing
    , sticker = Nothing
    }

