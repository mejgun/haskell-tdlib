module TD.Data.BusinessStartPage
  (BusinessStartPage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data BusinessStartPage
  = BusinessStartPage -- ^ Describes settings for a business account start page
    { title   :: Maybe T.Text          -- ^ Title text of the start page
    , message :: Maybe T.Text          -- ^ Message text of the start page
    , sticker :: Maybe Sticker.Sticker -- ^ Greeting sticker of the start page; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessStartPage where
  shortShow BusinessStartPage
    { title   = title_
    , message = message_
    , sticker = sticker_
    }
      = "BusinessStartPage"
        ++ I.cc
        [ "title"   `I.p` title_
        , "message" `I.p` message_
        , "sticker" `I.p` sticker_
        ]

instance AT.FromJSON BusinessStartPage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessStartPage" -> parseBusinessStartPage v
      _                   -> mempty
    
    where
      parseBusinessStartPage :: A.Value -> AT.Parser BusinessStartPage
      parseBusinessStartPage = A.withObject "BusinessStartPage" $ \o -> do
        title_   <- o A..:?  "title"
        message_ <- o A..:?  "message"
        sticker_ <- o A..:?  "sticker"
        pure $ BusinessStartPage
          { title   = title_
          , message = message_
          , sticker = sticker_
          }
  parseJSON _ = mempty

