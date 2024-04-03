module TD.Data.BusinessIntro
  (BusinessIntro(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data BusinessIntro
  = BusinessIntro -- ^ Describes settings for a business account intro
    { title   :: Maybe T.Text          -- ^ Title text of the intro
    , message :: Maybe T.Text          -- ^ Message text of the intro
    , sticker :: Maybe Sticker.Sticker -- ^ Greeting sticker of the intro; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessIntro where
  shortShow BusinessIntro
    { title   = title_
    , message = message_
    , sticker = sticker_
    }
      = "BusinessIntro"
        ++ I.cc
        [ "title"   `I.p` title_
        , "message" `I.p` message_
        , "sticker" `I.p` sticker_
        ]

instance AT.FromJSON BusinessIntro where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessIntro" -> parseBusinessIntro v
      _               -> mempty
    
    where
      parseBusinessIntro :: A.Value -> AT.Parser BusinessIntro
      parseBusinessIntro = A.withObject "BusinessIntro" $ \o -> do
        title_   <- o A..:?  "title"
        message_ <- o A..:?  "message"
        sticker_ <- o A..:?  "sticker"
        pure $ BusinessIntro
          { title   = title_
          , message = message_
          , sticker = sticker_
          }
  parseJSON _ = mempty

