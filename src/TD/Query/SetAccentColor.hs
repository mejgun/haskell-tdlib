module TD.Query.SetAccentColor
  (SetAccentColor(..)
  , defaultSetAccentColor
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes accent color and background custom emoji for the current user; for Telegram Premium users only. Returns 'TD.Data.Ok.Ok'
data SetAccentColor
  = SetAccentColor
    { accent_color_id            :: Maybe Int -- ^ Identifier of the accent color to use
    , background_custom_emoji_id :: Maybe Int -- ^ Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow SetAccentColor where
  shortShow
    SetAccentColor
      { accent_color_id            = accent_color_id_
      , background_custom_emoji_id = background_custom_emoji_id_
      }
        = "SetAccentColor"
          ++ I.cc
          [ "accent_color_id"            `I.p` accent_color_id_
          , "background_custom_emoji_id" `I.p` background_custom_emoji_id_
          ]

instance AT.ToJSON SetAccentColor where
  toJSON
    SetAccentColor
      { accent_color_id            = accent_color_id_
      , background_custom_emoji_id = background_custom_emoji_id_
      }
        = A.object
          [ "@type"                      A..= AT.String "setAccentColor"
          , "accent_color_id"            A..= accent_color_id_
          , "background_custom_emoji_id" A..= fmap I.writeInt64  background_custom_emoji_id_
          ]

defaultSetAccentColor :: SetAccentColor
defaultSetAccentColor =
  SetAccentColor
    { accent_color_id            = Nothing
    , background_custom_emoji_id = Nothing
    }

