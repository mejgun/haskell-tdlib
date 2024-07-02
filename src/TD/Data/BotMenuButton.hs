module TD.Data.BotMenuButton
  ( BotMenuButton(..)    
  , defaultBotMenuButton 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data BotMenuButton
  = BotMenuButton -- ^ Describes a button to be shown instead of bot commands menu button
    { text :: Maybe T.Text -- ^ Text of the button
    , url  :: Maybe T.Text -- ^ URL of a Web App to open when the button is pressed. If the link is of the type internalLinkTypeWebApp, then it must be processed accordingly. Otherwise, the link must be passed to openWebApp
    }
  deriving (Eq, Show)

instance I.ShortShow BotMenuButton where
  shortShow BotMenuButton
    { text = text_
    , url  = url_
    }
      = "BotMenuButton"
        ++ I.cc
        [ "text" `I.p` text_
        , "url"  `I.p` url_
        ]

instance AT.FromJSON BotMenuButton where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botMenuButton" -> parseBotMenuButton v
      _               -> mempty
    
    where
      parseBotMenuButton :: A.Value -> AT.Parser BotMenuButton
      parseBotMenuButton = A.withObject "BotMenuButton" $ \o -> do
        text_ <- o A..:?  "text"
        url_  <- o A..:?  "url"
        pure $ BotMenuButton
          { text = text_
          , url  = url_
          }
  parseJSON _ = mempty

instance AT.ToJSON BotMenuButton where
  toJSON BotMenuButton
    { text = text_
    , url  = url_
    }
      = A.object
        [ "@type" A..= AT.String "botMenuButton"
        , "text"  A..= text_
        , "url"   A..= url_
        ]

defaultBotMenuButton :: BotMenuButton
defaultBotMenuButton =
  BotMenuButton
    { text = Nothing
    , url  = Nothing
    }

