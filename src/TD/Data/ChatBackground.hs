module TD.Data.ChatBackground
  ( ChatBackground(..)    
  , defaultChatBackground 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Background as Background

data ChatBackground
  = ChatBackground -- ^ Describes a background set for a specific chat
    { background         :: Maybe Background.Background -- ^ The background
    , dark_theme_dimming :: Maybe Int                   -- ^ Dimming of the background in dark themes, as a percentage; 0-100
    }
  deriving (Eq)

instance Show ChatBackground where
  show ChatBackground
    { background         = background_
    , dark_theme_dimming = dark_theme_dimming_
    }
      = "ChatBackground"
        ++ I.cc
        [ "background"         `I.p` background_
        , "dark_theme_dimming" `I.p` dark_theme_dimming_
        ]

instance AT.FromJSON ChatBackground where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBackground" -> parseChatBackground v
      _                -> mempty
    
    where
      parseChatBackground :: A.Value -> AT.Parser ChatBackground
      parseChatBackground = A.withObject "ChatBackground" $ \o -> do
        background_         <- o A..:?  "background"
        dark_theme_dimming_ <- o A..:?  "dark_theme_dimming"
        pure $ ChatBackground
          { background         = background_
          , dark_theme_dimming = dark_theme_dimming_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatBackground where
  toJSON ChatBackground
    { background         = background_
    , dark_theme_dimming = dark_theme_dimming_
    }
      = A.object
        [ "@type"              A..= AT.String "chatBackground"
        , "background"         A..= background_
        , "dark_theme_dimming" A..= dark_theme_dimming_
        ]

defaultChatBackground :: ChatBackground
defaultChatBackground =
  ChatBackground
    { background         = Nothing
    , dark_theme_dimming = Nothing
    }

